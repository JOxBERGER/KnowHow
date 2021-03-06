__mosquitto + websockets @ rpi__  
Mostly based on: http://blog.thingstud.io/recipes/how-to-make-your-raspberry-pi-the-ultimate-iot-hub/  
For plain Ubuntu with __Upstart__ startup might be handeld different see: http://qiita.com/aquaviter/items/cb3051cf42a3a3c4a4d9 & https://wiki.ubuntuusers.de/Upstart  

__Type into your shell__

SSH into your PI.

```Shell
# Generate a new folder and enter the folder
mkdir tmp
cd tmp

sudo apt-get update  
sudo apt-get install libssl-dev # instead of sudo apt-get install openssl-dev  

# install cmake if neccessary  
(sudo apt-get build-dep cmake)
sudo apt-get install cmake

# install the following tools    
sudo apt-get install libc-ares-dev  
sudo apt-get install uuid-dev  
sudo apt-get install daemon  

# install latest stable libwebsockets
wget https://libwebsockets.org/git/libwebsockets/snapshot/libwebsockets-1.4-chrome43-firefox-36.tar.gz
tar zxvf libwebsockets*  
cd libwebsockets*  

mkdir build  
cd build  

cmake ..  
sudo make install  
sudo ldconfig  

# leave folder
cd ../..

# mosquitto-1.4.5. is tested. Check for newer versions.
wget http://mosquitto.org/files/source/mosquitto-1.4.5.tar.gz
tar zxvf mosquitto-1.4.1.tar.gz  
cd mosquitto*  
```

edit config in nano editor:  
```Shell
nano config.mk  
```
Set  
```
WITH_WEBSOCKETS:=no  
```
to  
```
WITH_WEBSOCKETS:=yes  
```

exit nano and make + install
```Shell
make  
sudo make install  

# move the mosquitto bin to /usr/sbin/mosquitto so we can use our autostart script  
mv /usr/local/sbin/mosquitto /usr/sbin/mosquitto  

sudo mkdir /etc/mosquitto  
sudo cp mosquitto.conf /etc/mosquitto  

# edit the mosquitto.conf  
nano /etc/mosquitto/mosquitto.conf
```

add at least the following lines, or see mosquitto.conf_example in this folder:  
```
listener 9001  
protocol websockets  
```
save & exit.

```Shell
// add a user for mosquitto  
sudo adduser mosquitto  

# copy the mosquitto init script from this folder to  
/etc/init.d/mosquitto  

# make it executable  
sudo chmod +x /etc/init.d/mosquitto  

# set it to run at system start

sudo update-rc.d mosquitto defaults
# maybe try this: sudo update-rc.d /etc/init.d/mosquitto defaults
```

__test it__  
Replace with the IP of your pi
```Shell
mosquitto_pub -h 192.168.178.1 -p 1883 -t test/message/01 -m "Läuft"  
mosquitto_sub -h 192.168.178.1 -p 1883 -t test/+/01  
```

To test the Websockets try: https://github.com/JOxBERGER/IoT-Intro/tree/master/web/MQTT_minimal
To Setup TLS see: https://mosquitto.org/tag/tls/
