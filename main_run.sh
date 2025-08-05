python3 -m experiments.evaluate \
--alg_name=AlphaEdit \
--model_name=meta-llama/Meta-Llama-3-8B-Instruct \
--hparams_fname=Llama3-8B.json \
--ds_name=mcf --dataset_size_limit=2000 \
--num_edits=100 \
--downstream_eval_steps=5