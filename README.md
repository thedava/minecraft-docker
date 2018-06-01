# minecraft-docker

A simple wrapper around [itzg/minecraft-server](https://github.com/itzg/dockerfiles) mainly used for hosting own minecraft instances of myself.

Provides some basic features like a backup mechanism


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


## Requirements

- docker-compose (tested with version 1.17)
- docker (tested with version 17.12)
- pbzip2
- tar
- rsync
