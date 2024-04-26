# SOP: Representative Language Embeddings

## Sbert

[https://sbert.net/](https://sbert.net/)

```bash
pip install sentence_transformers
```

```python
from sentence_transformers import SentenceTransformer
model = SentenceTransformer("all-MiniLM-L6-v2")

# our sentences to encode
sentences = [
   "This framework generates embeddings for each input sentence",
   "Sentences are passed as a list of string.",
   "The quick brown fox jumps over the lazy dog."
]

# Sentences are encoded by calling model.encode()
embeddings = model.encode(sentences)

# print the embeddings
for sentence, embedding in zip(sentence, embeddings):
   print("Sentence:", sentence)
   print("Embedding:", embedding)
   print("")

NOTE: you can train/predict on these embeddings 
```
