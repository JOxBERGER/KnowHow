__rsync__  
rsync -avh --progress --stats --ignore-existing from/folder to/folder   // local copy without compression
rsync -avzhe --progress --stats --ignore-existing ssh from/folder root@192.168.0.100:/to/folder
http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/

__copy via scp__  
§ scp -ra /path/to/local/storage user@remote.host:/path/to/copy  
$ scp user@homeip:/path/to/file /local/path/  

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
find . -name ".\*" -exec rm -rf {\} \; // find files & folders mathing the pattern and delete them. Example will delete Mac sys files.  
find /startpoint -type f -name "\*something\*"  

__find & delete & unmount__  
find . -type f -name ".\*" -exec rm -rf {\} \;  
diskutil unmountDisk /dev/disk1  

__querry version of linux__  
cat /etc/os-release  
uname -a

__start stop services linux__
/etc/init.d/ <service> start
/etc/init.d/ <service> stop

GitBasics
=========

### Comiting
Add and commit all changes with one command

	git commit -am "descriptive text etc"

### Branches
Delete Remote Branch

	git push origin --delete <branchName>p

Delete Lokal branch

	git branch -D <branchName>

Reset to Remote Branch

	git fetch origin master
	git reset --hard FETCH_HEAD
	git clean -df

Delete untracked and igrored folders

	git clean -f -d -X

Force a merge
Prefere own stuff

	git merge branch -X ours

Prefere other stuff

	git merge -X theirs <branchB>

### Tagging
Tag with note

	git tag -a <tag name> -m "comment etc."

push all tags

	git push origin --tags


### LINKS:
Some sshagent magic, useful to avoid multiple typing Passwords during each Session. http://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent
