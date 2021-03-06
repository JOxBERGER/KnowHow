## Linux Shell

### rsync
```Shell
rsync -avh --progress --stats --ignore-existing from/folder to/folder   # local copy without compression
rsync -avzhe --progress --stats --ignore-existing ssh from/folder root@192.168.0.100:/to/folder # copy to remote with compression
```
http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/  

### copy via scp  
```Shell
scp -rv /path/to/local/folderA user@remote.host:/path/to/folderB  # copy folderA to folderB recursively
scp -v user@homeip:/path/to/file /local/path/file # copy just file  
```

### apt get
```Shell
apt-get update # update source list  
apt-get upgrade # upgrade all installed packages  
apt-cache search <search_term> # find a package by name
apt-get build-dep <package_name> # Causes apt-get to install/remove packages in an attempt to satisfy the build dependencies for a source package.  
apt-get install <package_name> # install a new package  
apt-get remove <package_name> # remove a package
```

### find
```Shell
find . -name ".\*" -exec rm -rf {\} \; # find files & folders mathing the pattern and delete them. Example will delete Mac sys files.  
find /startpoint -type f -name "\*something\*"  # find files and print the results.
```

### find & delete & unmount
Helpful to clean a Disk from Mac Sys files before ejecting it. Finds Files & Folders  
```Shell
find .  -name ".\*" -exec rm -rf {\} \;  
diskutil unmountDisk /dev/disk1  
```

### querry version of linux  
```Shell
cat /etc/os-release  
uname -a
```

### start stop services linux
```Shell
/etc/init.d/ <service> start
/etc/init.d/ <service> stop
```

### list all user in linux
```Shell
cut -d: -f1 /etc/passwd
```

### list groups a user is part of
```Shell
groups root
```

### add group  
```Shell
groupadd {developers}
```

### add existing user to group existing group
```Shell
usermod -a -G {group} {user}
```

### make Folder writable to group
```Shell
chown -R {group} /some/folder/*
```

### Get the absolute Path to the shell script in a shell script
```Shell
# cd into the Folder of the Script  
cd `dirname $0`  
# Store Path in variable  
SCRIPTPATH=${PWD}  
```

## GitBasics

### Comiting
Add and commit all changes with one command

```Shell
git commit -am "descriptive text etc"
```
### Branches
Delete Remote Branch
```Shell
git push origin --delete <branchName>p
```

Delete Lokal branch
```Shell
git branch -D <branchName>
```

Reset to Remote Branch
```Shell
git fetch origin master
git reset --hard FETCH_HEAD
git clean -df
```
Delete untracked and igrored folders
```Shell
git clean -f -d -X
```

Force a merge
Prefere own stuff
```Shell
git merge branch -X ours
```
Prefere other stuff
```Shell
git merge -X theirs <branchB>
```
### Tagging
Tag with note
```Shell
git tag -a <tag name> -m "comment etc."
```

push all tags
```Shell
git push origin --tags
```

### LINKS:
Some sshagent magic, useful to avoid multiple typing Passwords during each Session. http://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent
