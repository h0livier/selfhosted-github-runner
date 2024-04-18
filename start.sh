#!/bin/bash

REPO=$REPO
ACCESS_TOKEN=$TOKEN

# Get token for repo action
REG_TOKEN=$(curl -X POST -H "Authorization: token ${ACCESS_TOKEN}" -H "Accept: application/vnd.github+json" https://api.github.com/repos/${REPO}/actions/runners/registration-token | jq .token --raw-output)

# Launch runner
cd /home/docker/actions-runner
./config.sh --url https://github.com/${REPO} --token ${REG_TOKEN}
./run.sh

# Clean up config if SIGINT or SIGTERM is raised
cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${REG_TOKEN}
}
trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM