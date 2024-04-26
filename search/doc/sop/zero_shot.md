# Zero Shot

TODO: modify this to work with Ollama and LangChain

NOTE: tqdm means "progress" in Arabic and gives our loops a smart progress meter.

```python
zeroshot_prompt = """Predict whether the following document is a positive or negative movie review.

[DOCUMENT]

If it is positive say 1 and if it is negative then say 0.  Do not give any other answers.
"""

from sklearn.metrics import classification_report
from tqdm import tqdm

y_pred = [int(gpt_prediction(zeroshot_prompt, doc)) for doc in tqdm(eval_df.text)]
print(classification_report(eval_df, y_pred))
```
