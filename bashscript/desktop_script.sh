#!/bin/bash
MultiRun (){
sessionname=$1
File=$2
Param1=$3
Param2=$4
Param3=$5
Param4=$6
Param5=$7
echo "${sessionname}"

screen -dmS "$sessionname"

screen -S $sessionname -X stuff "cd /home/engs2575/project/editing_reformat^M"
screen -S $sessionname -X stuff "source activate editing^M"
sleep 1.0s
echo ${File}
screen -S $sessionname -X stuff "bash ${File} ${Param1} ${Param2} ${Param3} ${Param4} ${Param5}^M"
}


Target_Para_List=(alphaedit alphaedit_hessian)
Target_Para_List=(0 )

for ((idx=0; idx<${#Target_Para_List[@]}; idx++)); do
Target_param=${Target_Para_List[$idx]}

gpu=0
model_name=meta-llama/Meta-Llama-3-8B-Instruct

dataset_limit=3000
num_each_round=100

dataset_name=mcf
dataset_name=zsre


algo=${Target_param}
algo=nse
algo=baseline_noneediting
algo=alphaedit_hessian
algo=alphaedit

#File=bashscript/subrun/nse.sh
#File=bashscript/subrun/alphaedit_hessian.sh
#File=bashscript/subrun/alphaedit.sh

File=bashscript/subrun/${algo}.sh

sessionname=test
sessionname=${algo}_${dataset_name}_L${dataset_limit}_NR${num_each_round}


MultiRun ${sessionname} ${File} ${dataset_limit} ${num_each_round} ${model_name} ${gpu} ${dataset_name}
done
