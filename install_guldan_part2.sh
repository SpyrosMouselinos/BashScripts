#!/bin/bash
echo "Welcome to part 2!"
sleep 1
clear
echo "Lets install Docker!"
sudo apt install curl
clear
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
clear
grep active | sudo systemctl status docker
sleep 1
clear
echo "Ok,now lets install htop"
sudo apt install htop
clear
echo "Ok now lets get serious"
echo "Lets make a virtual environment"
sudo apt install python-pip
cd ~/Desktop
mkdir Tensorflow_Environment
cd Tensorflow_Environment
sudo apt install python3-pip
sudo pip3 install virtualenv
virtualenv venv
source venv/bin/activate
pip install numpy
pip install sklearn
pip install matplotlib
pip install opencv-contrib-python
deactivate
echo "Ok lets try CUDA"
sleep 1
clear
echo "This will take some time my friend..."
cd
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run
chmod +x cuda_9.0.176_384.81_linux-run
./cuda_9.0.176_384.81_linux-run --extract=$HOME
sudo ./cuda-linux.9.0.176-22781540.run
clear
echo "Verify"
sudo ./cuda-samples.9.0.176-22781540-linux.run
sudo bash -c "echo /usr/local/cuda/lib64/ > /etc/ld.so.conf.d/cuda.conf"
clear
sudo ldconfig
echo "Need to add to path stuff"
cd /etc
sed -i '$ s/.$//' environment
sed '$s/$/\:\/usr\/local\/cuda\/bin\"/' environment > _environment_ && mv -- _environment_ environment
clear
"You need to install manually cuDNN and tensorflow after"
sleep 2
