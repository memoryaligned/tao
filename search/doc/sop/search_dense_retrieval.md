# Dense Retrieval Search

## Indexing

annoy or FAISS for millions of documents

## Implementation Details

Relies on similarity of text embeddings to retrieve relevant results.

Query  -->  Dense Retrieval  -->  Results
                  ^              1- Search result document #40
                  |              2- Search result document #68
             text documents      3- Search result document #2

1. Get the text we want to make searchable, apply some light processing to
   chunk it into sentences.
2. Embed the sentences.
3. Build the search index.
4. Search and see the results.

```bash
# NOTE: Annoy is for approximate nearest neighbor search
pip install cohere tqdm Annoy
```

```python
import cohere
import numpy as np
import re
import pandas as pd
from tqdm import tqdm
from sklearn.metrics.pairwise import cosine_similarity
from annoy import AnnoyIndex

api_key = ""
co = cohere.Client(api_key)

text = """Interstellar is a 2014...
"""

# split into sentences
texts = text.split(".")

texts = np.array([t.strip(" \n") for t in texts])

# Get the embeddings
response = co.embed(
   texts=texts
).embeddings

embeds = np.array(response)
print(embeds.shape)
# outputs (15, 4096), 15 vectors with each being 4096 long

# build the search index
search_index = AnnoyIndex(embeds.shap[1], 'angular')
for index, embed in enumerate(embeds):
   search_index.add_item(index, embed)

search_index.build(10)
search_index.save("test.ann")

# search the index
def search(query):
   # 1. Get the query's embedding
   query_embed = co.embed(texts=[query]).embeddings[0]

   # 2. Retrieve the nearest neighbors
   similar_item_ids = search_index.get_nns_by_vector(query_embed, n=3, include_instances=True)

   # 3. Format the results
   results = pd.DataFrame(data={
      "texts": texts[similar_item_ids[0]],
      "distance": similar_item_ids[1]
   })

   # 4. Print and return the results
   print(f"Query: '{query}'\nNearest neighbors:")
   return results
```

Now we can search the text

```python
query = "How much did the film make?"
search(query)
```

NOTE: the limitation of transformer models is context size where the following
strategies are used:

- one vector per document (title and say first 1024 words)
- chunk a document into multiple vectors:
   - embedding the document into chunks then aggregating those chunks via mean
     into a single compressed vector
   - title, summary, then chunk (sentence)
