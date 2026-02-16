#!/bin/bash

sh scripts/apt-update.sh

sh scripts/apt-zsh.sh

sh scripts/vscode.sh

sh scripts/git.sh

sh scripts/docker.sh

sh scripts/make.sh

sh scripts/docker-compose.sh

sh scripts/python.sh

sh scripts/vim.sh

echo "Once the repo has been clone, run 'sudo chmod 777 -R .git/' to avoid problems with git"
