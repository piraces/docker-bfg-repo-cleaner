# docker-bfg-repo-cleaner

[![Publish Docker image](https://github.com/piraces/docker-bfg-repo-cleaner/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/piraces/docker-bfg-repo-cleaner/actions/workflows/docker-publish.yml)
[![CI Dive Check](https://github.com/piraces/docker-bfg-repo-cleaner/actions/workflows/dive-check.yml/badge.svg)](https://github.com/piraces/docker-bfg-repo-cleaner/actions/workflows/dive-check.yml)
<a href="https://github.com/piraces/docker-bfg-repo-cleaner/pkgs/container/bfg-repo-cleaner/"><img src="https://img.shields.io/badge/GH%20Docker%20Image-latest-blue" alt="Docker GitHub"></a>
<a href="https://hub.docker.com/r/piraces/bfg-repo-cleaner/"><img src="https://img.shields.io/docker/pulls/piraces/bfg-repo-cleaner.svg?style=flat-square&logo=docker" alt="Docker Pulls"></a>


A docker image for [BFG Repo-Cleaner (by rtyley)](https://rtyley.github.io/bfg-repo-cleaner/).

# How is built

- Actually is built using the [openjdk](https://hub.docker.com/_/openjdk/) official image only with JRE ([openjdk:8-jre-slim](https://hub.docker.com/_/openjdk/?tab=tags&page=1&name=8-jre-slim)).
- The actual `.jar` file is in this repo, managed with `Git LFS`. You can check the checksum from the original published `.jar` [available here](https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar).
- In order to be able to execute the command `bfg` as it is, a little trick is made by specifying a ['Shebang'](https://bash.cyberciti.biz/guide/Shebang) and the `.jar` file content in an executable in the `/bin` folder of the container.

# How to use it

It only requires you to mount the repository you want to use with `bfg` and perform the command you want.

For example to remove `.env` files in my repository using `bfg`:

```bash
docker run --rm -v /c/DEV:/usr/src/myrepo -w /usr/src/myrepo piraces/bfg-repo-cleaner:latest bfg --delete-files .env /usr/src/myrepo/exercise-remove-commit-history.git # Using Docker Hub image

docker run --rm -v /c/DEV:/usr/src/myrepo -w /usr/src/myrepo ghcr.io/piraces/bfg-repo-cleaner:latest bfg --delete-files .env /usr/src/myrepo/exercise-remove-commit-history.git # Using GitHub Docker image (no pull limits)
```

Make sure to specify the correct path to mount and the working directory.
