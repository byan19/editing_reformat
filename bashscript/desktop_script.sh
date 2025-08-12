#!/bin/bash
MultiRun (){
sessionname=$1
File=$2
Param=$3
Tunning=$4
echo "${sessionname}"

screen -dmS "$sessionname"

screen -S $sessionname -X stuff "cd /home/engs2575/project/editing_reformat^M"
screen -S $sessionname -X stuff "source activate editing^M"
sleep 1.0s
echo ${File}
screen -S $sessionname -X stuff "bash ${File} ${Param} ${sessionname} ${Tunning}^M"
}

Tunning=1

Target_Para_List=(o_proj q_proj k_proj v_proj)
Target_Para_List=(o_proj)

Tunning_list=(0 )
for ((idx=0; idx<${#Target_Para_List[@]}; idx++)); do
Param=${Target_Para_List[$idx]}
Tunning=${Tunning_list[$idx]}


sessionname=version4_NER_test


File=bashscript/subrun/alphaedit.sh

CHECK=${sessionname}

MultiRun ${sessionname} ${File} ${Param} ${Tunning}
done
