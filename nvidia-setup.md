# Nvidia setup

## Windows 11 with WSL

### Dowwnload the Windows driver

https://www.nvidia.com/Download/index.aspx

Select the driver for Thinkpad P16 Gen 1

* Product Type: NVIDIA RTX/Quadro
* Product Series: NVIDIA RTX Series (Notebooks)
* Product: NVIDIA RTX A1000 Laptop GPU
* Operating System: Windows 11
* Download Type: Production Branch/Studio
* Language: English (US)

### Download the CUDA toolkit for WSL-Ubuntu

Without a WSL-Ubuntu driver running nvidia-smi shows 'Segmentation fault'

https://developer.nvidia.com/cuda-downloads

Choose

* Operating system: Linux
* Architecture: `x86_64`
* Distribution: WSL-Ubuntu
* Version: 2.0
* Installer Type: deb(local)

```
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin

sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600

wget https://developer.download.nvidia.com/compute/cuda/12.2.1/local_installers/cuda-repo-wsl-ubuntu-12-2-local_12.2.1-1_amd64.deb

sudo dpkg -i cuda-repo-wsl-ubuntu-12-2-local_12.2.1-1_amd64.deb

sudo cp /var/cuda-repo-wsl-ubuntu-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/

sudo apt-get update

sudo apt-get -y install cuda
```

Restart WSL after installing cuda software.

Run `nvidia-smi` command to display the GPU card details.

### Nvidia cuda toolkit

Do not install the CUDA toolkit using the command below as it will install the Linux version of the drivers rather than the WSL version as shown above.

See https://ubuntu.com/tutorials/enabling-gpu-acceleration-on-ubuntu-on-wsl2-with-the-nvidia-cuda-platform

```
echo sudo apt install nvidia-cuda-toolkit
```

### Explore the CUDA toolkit

Using a shared Windows folder is very slow when cloning the project.

1. Clone the examples repository

```
git clone https://github.com/nvidia/cuda-samples
```

2. Build the example

```
cd cuda-samples/Samples/1_Utilities/deviceQuery
make
```

3. Run the example

```
./deviceQuery
```

### Install RAPIDS

RAPIDS has GPU-accelerated Python libraries

https://docs.rapids.ai/notices/rgn0024/

