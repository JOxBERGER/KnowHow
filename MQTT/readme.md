__mosquitto + websockets @ rpi__  
see: http://blog.thingstud.io/recipes/how-to-make-your-raspberry-pi-the-ultimate-iot-hub/  

__Type into your shell__
sudo apt-get update  
sudo apt-get install libssl-dev // instead of sudo apt-get install openssl-dev  

// install cmake if neccessary  
sudo apt-get build-dep cmake  
sudo apt-get install libc-ares-dev  
sudo apt-get install uuid-dev  
sudo apt-get install daemon  

tar zxvf libwebsockets*  
cd libwebsockets*  

mkdir build  
cd build  

cmake ..  
sudo make install  
sudo ldconfig  

// Change directory to home  
cd ~  

wget http://mosquitto.org/files/source/mosquitto-1.4.1.tar.gz  
tar zxvf mosquitto-1.4.1.tar.gz  
cd mosquitto*  

//open:  
nano config.mk  
//edit:  
WITH_WEBSOCKETS:=no  
//to  
WITH_WEBSOCKETS:=yes  
// exit nano and make  
make  
sudo make install  

sudo mkdir /etc/mosquitto  
sudo cp mosquitto.conf /etc/mosquitto  

// edit the mosquitto.conf  
nano /etc/mosquitto/mosquitto.conf  
//add at least the followinf lines:  
listener 9001  
protocol websockets  

or see mosquitto.conf_example in this folder.
