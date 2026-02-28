# `xqhare.net`

The hub for my personal website.

This repository serves two purposes:

Firstly it holds scripts to manage all `xqhare.net` services.
Secondly it is used as part of the `xqhare.net` website structure.

## Scripts

There are two kind of scripts in this repo.

Scripts dealing with setting up, rebuilding and restarting the docker containers end in `_servers.sh`.

### `push_all.sh`

This convenience script is used to push new content to all services.

### `rollback.sh`

This script rolls back the content of all services to the previous state (if possible).

### `cleanup_data.sh`

This script cleans up the `data` directory of all services.
It always keeps the latest two versions of the content to ensure there is always a state to roll back to.

## Structure

The structure the scripts of this repo, as well as the repositories of the web services, expect a specific project structure to work properly.

-> [`xqhare.net/`](https://github.com/xqhare/xqhare.net)
  -> [`blog/`](https://github.com/xqhare/blog)
  -> [`profile/`](https://github.com/xqhare/profile)
  -> [`global_assets/`](https://github.com/xqhare/global_assets)
  -> [`main/`](https://github.com/xqhare/main)

For details on each service, please refer to its specific repository.

## Notes

Content is written and stored in markdown files inside the appropriate repositories for the service.
When pushed the content is converted to HTML and deployed onto the production server.

All data is produced and deployed using `bash` build scripts.

For fully automatic updates, I set up a `post-receive` hook on my `gitea` server, running the deployment on every push.
