# minecraft-docker

A simple wrapper around [itzg/minecraft-server](https://github.com/itzg/dockerfiles) (See on [Docker Hub](https://hub.docker.com/r/itzg/minecraft-server/)) mainly used for hosting own minecraft instances of myself.

Provides some basic features like a backup mechanism.

* Attach to container: `docker attach mc`
* Detach from container: `Ctrl + P` `Ctrl + Q`


## Start

Create a .env file and change the settings according to your needs. Use the `up.sh` (or simply `docker-compose up`) to start the server.



## Backup

The backup mechanism will synchronize the server data folder with another folder ("backups/_work") and will create an archive of that folder. The sychronization of the server will always be incremental but the archive will always contain a full backup of the server.

```sh
  # Create a backup
  ./auto_backup.sh

  # Create a backup and compress it into an archive (this is the default mode. bz2. will be used)
  ./auto_backup.sh archive
  
  # Create a separate backup directory
  ./auto_backup.sh folder
```


## Crontab example

Run a backup at 0:30, 6:30, 12:30, 18:30 and save the output to a log file. Also rotate that log file automatically once every week

```sh
  # m h  dom mon dow   command
  30 0,6,12,18 * * *      cd ~/root/minecraft-docker && ./auto_backup.sh >> backups/backups.log
  @weekly                 cd ~/root/minecraft-docker && savelog -t -q -n -c 7 backups/backups.log
```


## Requirements

- docker-compose (tested with version 1.17)
- docker (tested with version 17.12)
- pbzip2
- tar
- rsync
