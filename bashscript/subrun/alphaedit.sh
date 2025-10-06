#!/bin/bash
CUDA_VISIBLE_DEVICES=0 python -m experiments.evaluate \
--alg_name=AlphaEdit \
--model_name=meta-llama/Meta-Llama-3-8B-Instruct \
--hparams_fname=Llama3-8B.json \
--ds_name=mcf \
--dataset_size_limit=20 \
--num_edits=20 \
--downstream_eval_steps=5 \
--debugging_mood=1 \


# the default choise of the models

#--model_name=meta-llama/Meta-Llama-3-8B-Instruct \
#--model_name=/root/autodl-tmp/meta-llama3-8b-instruct \
#--num_edits=100 \


# default choice
#--dataset_size_limit=2000 \
#--num_edits=10 \
