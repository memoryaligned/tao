# Re-Ranking Search

NOTE: this is the technology Microsoft and Google added to their search engines

Query  -->  Search Results  -->  Re-Ranker  -->  Results (improved order)
                                                1- Search result document #40
                                                2- Search result document #68
                                                3- Search result document #2

```python
import cohere as co
co = cohere.Client(API_KEY)

MODEL_NAME = "rerank-english-02"
```
