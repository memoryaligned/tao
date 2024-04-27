# Build a Cohere replacement on Langchain and Ollama

Why is summarize a legacy endpoint?

## v1/classify

Make a prediction about which label fits the text inputs best passing in
examples and up to 100 texts to be classified.

[https://docs.cohere.com/reference/classify](https://docs.cohere.com/reference/classify)

Models include:

- embed-multilingual-v2.0
- embed-english-light-v2.0
- embed-english-v2.0

REQUEST:

body parameters:

```javascript
{
   "inputs": [
      "string1 to classify",
      "string2 to classify"
   ],
   "examples": [
      {"label": "spam", "text": "string"},
      {"label": "spam", "text": "string"},
      {"label": "spam", "text": "string"},
      {"label": "spam", "text": "string"}
   ],
   "model": "fine-tuned-id | above name",
   "truncate": "NONE|END"                   // if none it will return an error
}                                           // if the token limit is exceeded
```

RESPONSES:

HTTP 200: OK

```javascript
{
   "id": "uuid",
   "classifications": [
      "id": "uuid",
      "input": "confirm your email address",
      "predict": "Not spam",

   ]
}
```

HTTP 400: Bad request

HTTP 409: Too many requests

HTTP 500: Internal Server Error

## v1/dataset

Datasets are created by uploading files specifying both a name for the dataset
and a dataset type.  Valid types include:

- embed-input
- reranker-finetune-input
- prompt-completion-finetune-input
- single-label-classification-input
- chat-finetune-input
- multi-label-classification-finetune-input

[https://docs.cohere.com/reference/dataset](https://docs.cohere.com/reference/dataset)

REQUEST:

query parameters:
{
   "name": "name-of-the-uploaded-dataset",     // required
   "type": "see-types-above",                  // required (due to the above schemas)
   "skip_malformed_input": false,              // dropped rows will be in the warnings
   "optional_fields": [
       "field_to_persist_other_than_schema"
   ],
   "text_separator": "\n",                     // raw .txt files will be split on this
   "csv_delimiter": ",",                       // sep .csv files
}

body parameters:
{
   "data", "the_file_to_upload",               // required
   "eval_data", "optional evaluation data"     
}

RESPONSES:

HTTP 200: OK

{
   "id": "uuid"
   "warnings": [
      "dropped row number {n}"
   ]
}

HTTP 400: Bad Request

## installation and use

```bash
pip install <system>
```

```python
import <system>
client = cohere.Client("API_KEY")
```

## v1/rerank

[https://docs.cohere.com/reference/rerank](https://docs.cohere.com/reference/rerank)

NOTE: rerank models include:

- rerank-english-v3.0
- rerank-multilingual-v3.0
- rerank-english-v2.0
- rerank-multilingual-v2.0

REQUEST:

body parameters:

```javascript
{
   "query": "my query",     // required
   "documents": [           // required (recommend max 1,000)
       { "title": "string", "author": "string", "text": "string"},
       { "title": "string", "author": "string", "text": "string"}
   ],
   "model": "rerank-english-v3.0"  ,
   "top_n": 10,
   "rerank_fields": [       // rerank based on this order of doc fields
      "title",
      "author",
      "text"
   ],
   "return_documents": true    // {"index": 0, "text": "string", "relevance_score"": 0.99}
   "return_documents": false   // {"index": 0, "relevance_score"": 0.99}
                               // NOTE: index is for the list passed in
}
```

RESPONSES:

HTTP 200: OK

```javascript
{
   "id": "uuid",
   "results": [
      {
         "document": {
            "text": "string"
         },
         "index": 0,
         "relevance_score": 0
      }
   ],
   "meta": {
      "api_version": {
         "version": "string",
         "is_deprecated": false,
         "is_experimental": false,
      }
   },
   "tokens": {
      "input_tokens": 0,
      "output_tokens": 0
   },
   "warnings": [
      "string"
   ]
}
```

HTTP 429: Too many requests

## v1/generate    NOTE: this should be v1/chat

[https://docs.cohere.com/reference/generate](https://docs.cohere.com/reference/generate)

REQUEST:

```javascript
{
   "prompt": "please explain how LLMs work",
   "model" : "name",                    // optional
   "num_generations": 1,                // default 1; max 5
   "temperature": 0.75,                 // default 0.75; max 5.0
   "seed": 42,
   "p": 0.75                            // default 0.75; max 0.99 threshold
   "raw_prompting": false               // send prompt to the model raw
}
```

RESPONSES:

HTTP 200: OK

```javascript
{
   "id": "uuid",
   "prompt": "string",
   "generations": [

   ],
   "meta": {
      "api-version": {
         "version": "string",
         "is_deprectated": true,
         "is_experimental": true
      },
      "tokens": {
         "input_tokens": 0,
         "output_tokens": 0
      },
      "warnings": [
         "string"
      ]
   }
}
```

HTTP 400: Bad Request

HTTP 429: Too many requests

HTTP 500: Internal Server Error
