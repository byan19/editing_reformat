import torch
from transformers import AutoModel, AutoTokenizer
import pdb

model_name = 'meta-llama/Llama-2-7b-hf'
model_name = 'meta-llama/Meta-Llama-3-8B-Instruct'

model = AutoModel.from_pretrained(model_name)
tokenizer = AutoTokenizer.from_pretrained(model_name)


model.to('cuda')
inputs = tokenizer("Hello world", return_tensors="pt")
# forward with hidden states
#outputs = model(**inputs, output_hidden_states=True)
'''
for name, param in model.named_parameters():
	param.requires_grad = False
'''

for name, param in model.named_parameters():
	if '31' in name:
		param.requires_grad = False


outputs = model(inputs['input_ids'].cuda(), inputs['attention_mask'].cuda() , output_hidden_states=True)

hidden2 = outputs.hidden_states[-2]   # last layer hidden states
hidden = outputs.hidden_states[-1]   # last layer hidden states

# if you want .grad populated, you must call:
hidden2.retain_grad()
hidden.retain_grad()

# make a dummy scalar loss depending on hidden states
loss = hidden.norm()
pdb.set_trace()

tmp =  torch.autograd.grad(loss, hidden, retain_graph =True)
tmp =  torch.autograd.grad(loss, hidden2, retain_graph =True)

tmp = [name for name, param in model.named_parameters() if param.requires_grad]
#loss.backward()

print(hidden.grad.shape)
