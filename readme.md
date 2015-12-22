__rsync__  
rsync -avh --progress --stats --ignore-existing from/folder to/folder   // local copy without compression
rsync -avzhe --progress --stats --ignore-existing ssh from/folder root@192.168.0.100:/to/folder
http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/

__copy via scp__  
§ scp -ra /path/to/local/storage user@remote.host:/path/to/copy  
$ scp user@homeip:/path/to/file /local/path/  

__apt get__  
$ apt-get update // update source list  
$ apt-get upgrade // upgrade all installed packages  
$ apt-cache search <search_term> // find a package by name
$ apt-get install <package_name> // install a new package  
$ apt-get remove <package_name> // remove a package  


__find__  
find . -name ".*" -exec rm -rf {\} \; // find files & folders mathing the pattern and delete them. Example will delete Mac sys files.  
find /startpoint -type f -name "*something*"  

__find & delete & unmount__  
find . -type f -name ".*" -exec rm -rf {\} \;  
diskutil unmountDisk /dev/disk1  
