__mosquitto + websockets @ rpi__  
Mostly based on: http://blog.thingstud.io/recipes/how-to-make-your-raspberry-pi-the-ultimate-iot-hub/  

__Type into your shell__
```Shell
sudo apt-get update  
sudo apt-get install libssl-dev # instead of sudo apt-get install openssl-dev  

# install cmake if neccessary  
sudo apt-get build-dep cmake  
sudo apt-get install libc-ares-dev  
sudo apt-get install uuid-dev  
sudo apt-get install daemon  

# install latest stable libwebsockets
wget http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot/libwebsockets-1.4-chrome43-firefox-36.tar.gz
tar zxvf libwebsockets*  
cd libwebsockets*  

mkdir build  
cd build  

cmake ..  
sudo make install  
sudo ldconfig  

# Change directory to home  
cd ~  

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

# add at least the followinf lines:  
listener 9001  
protocol websockets  

#or see mosquitto.conf_example in this folder.  

// add a user for mosquitto  
sudo adduser mosquitto  

# copy the mosquitto init script from this folder to  
/etc/init.d/mosquitto  

# make it executable  
sudo chmod +x /etc/init.d/mosquitto  

# set it to run at system start
```Shell
sudo update-rc.d mosquitto defaults
# maybe try this: sudo update-rc.d /etc/init.d/mosquitto defaults
```

__test it__  
Replace with the ip of your pi
```Shell
mosquitto_pub -h 192.168.178.1 -p 1883 -t test/message/01 -m "Läuft"  
mosquitto_sub -h 192.168.178.1 -p 1883 -t test/+/01  
```

To test the Websockets try: https://github.com/JOxBERGER/IoT-Intro/tree/master/web/MQTT_minimal
