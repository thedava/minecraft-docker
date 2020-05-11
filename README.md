# minecraft-docker

A simple wrapper around [itzg/minecraft-server](https://github.com/itzg/dockerfiles) (See on [Docker Hub](https://hub.docker.com/r/itzg/minecraft-server/)) mainly used for hosting own minecraft instances of myself.

Provides some basic features like a backup mechanism.

* Attach to container: `docker attach mc`
* Detach from container: `Ctrl + P` `Ctrl + Q`


## Start

Create a .env file and change the settings according to your needs. Use the `up.sh` (or simply `docker-compose up`) to start the server.


## Upgrade

### Minecraft

Just delete the *.jar file in your data directory and restart the container. A new server.jar will be downloaded

### Docker image

```sh
  # Pull latest image from repository
  docker pull itzg/minecraft-server

  # Start container
  ./up.sh
```



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


## Crontab examples


```sh
  # m h  dom mon dow   command

  # Run a backup at 0:30, 6:30, 12:30, 18:30 and save the output to a log file
  30 0,6,12,18 * * *      cd ~/root/minecraft-docker && ./auto_backup.sh >> backups/backups.log

  # Rotate that log file automatically once every week
  @weekly                 cd ~/root/minecraft-docker && savelog -t -q -n -c 7 backups/backups.log
```


```sh
  # m h  dom mon dow   command

  # Save semi-static data once a day
  @daily                          crontab -l > ~/root/minecraft-docker/data/_static/crontab
  @daily                          cd ~/root/minecraft-docker && cp -f .env data/_static/current.env

  # Create backup archive twice a day (0:30 / 12:30)
  30 0,12         * * *           cd ~/root/minecraft-docker && ./auto_backup.sh >> backups/backups.log

  # Sync backup folder only twice a day (12:30 / 18:30)
  30 6,18         * * *           cd ~/root/minecraft-docker && ./backup.sh >> backups/backups.log

  # Store the daily backup on external volume (13:00)
  0  13           * * *           cd ~/root/minecraft-docker/backups && date >> backups.log && cp -vf latest.tar.bz2 /mnt/backups/minecraft/ >> backups.log

  # Rotate backup log every week
  @weekly                         savelog -t -q -n -c 7 ~/root/minecraft-docker/backups/backups.log
```


## Requirements

- docker-compose (tested with version 1.17)
- docker (tested with version 17.12)
- pbzip2
- tar
- rsync
