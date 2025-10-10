#!/bin/bash
dataset_limit=$1
num_each_round=$2
model_name=$3
gpu=$4
dataset_name=$5

CUDA_VISIBLE_DEVICES=${gpu} python -m experiments.evaluate \
--alg_name=AlphaEdit \
--model_name=${model_name} \
--hparams_fname=Llama3-8B.json \
--ds_name=${dataset_name} \
--dataset_size_limit=${dataset_limit} \
--num_edits=${num_each_round} \
--downstream_eval_steps=5 \
--debugging_mood=1 \


# the default choise of the models

#--model_name=meta-llama/Meta-Llama-3-8B-Instruct \
#--model_name=/root/autodl-tmp/meta-llama3-8b-instruct \
#--num_edits=100 \


# default choice
#--dataset_size_limit=2000 \
#--num_edits=10 \
