import torch
from transformers import AutoModel, AutoTokenizer
import pdb

model = AutoModel.from_pretrained("meta-llama/Meta-Llama-3-8B-Instruct")
tokenizer = AutoTokenizer.from_pretrained("meta-llama/Meta-Llama-3-8B-Instruct")

inputs = tokenizer("Hello world", return_tensors="pt")

# forward with hidden states
outputs = model(**inputs, output_hidden_states=True)
hidden = outputs.hidden_states[-1]   # last layer hidden states

# if you want .grad populated, you must call:
hidden.retain_grad()

# make a dummy scalar loss depending on hidden states
loss = hidden.norm()
loss.backward()

print(hidden.grad.shape)
