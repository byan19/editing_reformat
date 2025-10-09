#!/bin/bash
MultiRun (){
sessionname=$1
File=$2
Param1=$3
Param2=$4
Param3=$5
echo "${sessionname}"

screen -dmS "$sessionname"

screen -S $sessionname -X stuff "cd /root/autodl-tmp/project/hessian_editing^M"
#screen -S $sessionname -X stuff "source activate editing^M"
sleep 1.0s
echo ${File}
screen -S $sessionname -X stuff "bash ${File} ${Param1} ${Param2} ${Param3}^M"
}

Target_Para_List=(o_proj q_proj k_proj v_proj)
Target_Para_List=(o_proj)

Tunning_list=(0 )
for ((idx=0; idx<${#Target_Para_List[@]}; idx++)); do
Param=${Target_Para_List[$idx]}
Tunning=${Tunning_list[$idx]}

dataset_limit=2000
num_each_round=200
model_name=/root/autodl-tmp/meta-llama3-8b-instruct

File=bashscript/subrun/nse.sh
File=bashscript/subrun/alphaedit_hessian.sh
File=bashscript/subrun/alphaedit.sh

sessionname=Baseline_alphaedit_L${dataset_limit}_NR${num_each_round}


MultiRun ${sessionname} ${File} ${dataset_limit} ${num_each_round} ${model_name}
done
