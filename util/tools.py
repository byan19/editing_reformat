import torch
import pdb
def set_device(gpu_id = 0):
    device = torch.device(f'cuda:{gpu_id}' if torch.cuda.is_available() else 'cpu')
    torch.cuda.set_device(device)
    return device