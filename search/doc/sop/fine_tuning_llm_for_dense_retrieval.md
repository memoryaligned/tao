# Fine Tuning the LLM for Dense Retrieval search

Create training data of queries and relevant results by deprecating similar
vectors that are irrelevant.

Example:
For the vector "Interstellar premiered on October 26, 2014 in Los Angeles"

Q1 [RELEVANT]   "Interstellar release date"
Q2 [RELEVANT]   "When did Interstellar premier"
Q3 [IRRELEVANT] "Interstellar cast"

# GenQ and InPars-v2

Use these to look at documents and generate possible questions about those
documents then use the generated data to fine-tune a retrieval system.

"Demonstrate-Search-Predict: Composing retrieval and langage models for
knowledge-intensive NLP"
[https://arxiv.org/pdf/2212.14024](https://arxiv.org/pdf/2212.14024)

