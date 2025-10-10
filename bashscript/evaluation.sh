#python -m experiments.summarize --dir_name=MEMIT --runs=run_<run1>,run_<run2>
#python -m experiments.summarize --dir_name=AlphaEdit_Hessian --runs=run_011
#python -m experiments.summarize --dir_name=AlphaEdit_Hessian --runs=run_011
#python -m experiments.summarize --dir_name=AlphaEdit_Hessian --runs=run_011
#python -m experiments.summarize --dir_name=AlphaEdit --runs=run_007
#python -m experiments.summarize --dir_name=AlphaEdit_Hessian --runs=run_011,run_012
#python -m experiments.summarize --dir_name=AlphaEdit --runs=run_007

#python -m experiments.summarize --dir_name=AlphaEdit_Hessian --runs=run_011,run_012
#python -m experiments.summarize --dir_name=AlphaEdit --runs=run_001
conda activate editing
python -m experiments.summarize --dir_name=AlphaEdit_Hessian --runs=run_004
