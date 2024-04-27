# Build a Cohere replacement on Langchain and Ollama

Why is summarize a legacy endpoint?

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

REQUEST:

RESPONSES:

HTTP 200: OK

```javascript
{
   "id": string
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
   "id": "string",
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
