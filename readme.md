__rsync__  
```Shell
rsync -avh --progress --stats --ignore-existing from/folder to/folder   // local copy without compression
rsync -avzhe --progress --stats --ignore-existing ssh from/folder root@192.168.0.100:/to/folder
```
http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/  

__copy via scp__  
```Shell
scp -ra /path/to/local/storage user@remote.host:/path/to/copy  
scp user@homeip:/path/to/file /local/path/  
```

__apt get__  
```Shell
apt-get update # update source list  
apt-get upgrade # upgrade all installed packages  
apt-cache search <search_term> # find a package by name
apt-get build-dep <package_name> # Causes apt-get to install/remove packages in an attempt to satisfy the build dependencies for a source package.  
apt-get install <package_name> # install a new package  
apt-get remove <package_name> # remove a package
```

__find__  
```Shell
find . -name ".\*" -exec rm -rf {\} \; # find files & folders mathing the pattern and delete them. Example will delete Mac sys files.  
find /startpoint -type f -name "\*something\*"  # find files and print the results.
```

__find & delete & unmount__  
Helpful to clean a Disk from Mac Sys files before ejecting it. Finds Files & Folders  
```Shell
find .  -name ".\*" -exec rm -rf {\} \;  
diskutil unmountDisk /dev/disk1  
```
__querry version of linux__  
```Shell
cat /etc/os-release  
uname -a
```

__start stop services linux__
```Shell
/etc/init.d/ <service> start
/etc/init.d/ <service> stop
```

GitBasics
=========

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
