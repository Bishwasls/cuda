# Some CUDA programs:

This repo contains my effort to learn CUDA programming. I have tested these codes only on NVIDIA GeForce GTX 1650 Ti (4GB) GPU,
but you should be able to run these codes in any CUDA capable desktop/laptop. 

Installation of CUDA on Ubuntu 20.04: <br/>
Follow the instructions on <br/>

https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=2004&target_type=deblocal

to install cuda on Lenovo X1 Carbon Extreme Gen 3 machine with Ubuntu 20.04 OS.

Type the following command on linux terminal to get informations about the numbers of CUDA cores you have in your machine <br/>

$ nvidia-settings -q CUDACores -t

Also, following command is useful to know the information about the NVIDIA GPU <br/>

$ nvidia-smi

A more detailed information about the device can be obtained running the simple CUDA program "cuda_device_info.cu" on this repo.<br/>

$ nvcc cuda_device_info.cu

$ ./a.out

