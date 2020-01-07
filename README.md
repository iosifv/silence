# silence - a tool for safely backing up your ssh keys

Tool for safely backing up ssh keys in an git repository.
The main idea of this is: to save a zipped and encrypted file on one of your *private* repositories

### Usage

##### Fork repo
After forking this repository and making it private for your

##### Generate Backup

- run backup.sh

This will create a file locally which will be encrypted

##### gitignore

You will have to modify .gitignore so that you can save the generated encrypted file in git

##### Use the backup
Enter one of the folders, then

- run unpack.sh
- run overwrite.sh

## Todo:

- Replicate current behaviour to save AWS credentials
- Replicate current behaviour to save rClone credentials
- Replicate current behaviour to save Lastpass credentials