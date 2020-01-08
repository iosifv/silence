![silence](./shh.png)

# silence - a tool for safely backing up your ssh keys

Tool for safely backing up ssh keys in an git repository.
The main idea of this is: to save a zipped and encrypted file on one of your **private** repositories

![screenshot](./screenshot.png)

## Usage

##### Fork repo
After forking this repository and making it private for your

##### Generate Backup

- run `./ssh/backup.sh`
- or run the interactive menu `./ssh-menu.sh`

This will create a file locally which will be encrypted

##### gitignore

You will have to modify .gitignore so that you can save the generated encrypted file in git

##### Use the backup
Enter one of the folders, then

- run `./ssh/unpack.sh` && `./ssh/overwrite.sh`
- or run the interactive menu `./ssh-menu.sh`

## FAQ:

**Q:** OMG! Are you serious, do you understand how bad it is to store ssh keys online?

**A:** Yes, I get it, it's bad practice, but I preffer this over the pain of setting up my keys on each new machine I use.
##


**Q:** I don't trust you, are there better solutions?

**A:** Yes, try this: [SSH with Lastpass CLI](https://devopsheaven.com/ssh/security/lastpass/devops/2018/06/13/ssh-lastpass-cli.html)
##

## Todo:

- Create better diagnostics info
- Delete "ssh-vault" folder after overwriting
- Replicate current behaviour to save AWS credentials
- Replicate current behaviour to save rClone credentials
- Replicate current behaviour to save Lastpass credentials