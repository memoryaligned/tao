# Named Entity Resolution

TODO: modify for Ollama and LangChain if applicable

```bash
pip install spacy
```

```python
import spacy

nlp = spacy.blank("en")

# Create a Named Entity Recognition Task and define labels
task = {
   "task": {
        "@llm_tasks": "spacy.NER.v1",
        "labels": "DATE,AGE,LOCATION,DISEASE,SYMPTOM"
   }
}

# Choose which backend to use
backend = {
   "backend": {
      "@llm_backends": "spacy.REST.v1",
      "api": "OpenAI",
      "config": {
        "model": "gpt-3.5-turbo"
      }
   }
}

# Combine configurations and create SpaCy pipeline
config = task | backend
nlp.add_pipe("llm", config=config)

# Extract entities we are interested in
doc = nlp("On February 11, 2022, a 73-year-old woman came to the hospital\nand was diagnosed with COVID-19 and has a cough.")
print([(ent.text, ent.label_) for ent in doc.ents])

# Visualize the entities found
from spacy import displacy
from IPython.core.display import display, HTML

# display entities
html = displacy.render(doc, style="ent")
display(HTML(html))
```
