#!/bin/bash
# Install Ubuntu updates
sudo apt update && sudo apt upgrade -y
sudo apt-get update && sudo apt-get upgrade -y
# Create folder for Gaia node
mkdir -p $HOME/gaia-node-103
# Install Gaia node
curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/install.sh' | bash -s -- --base $HOME/gaia-node-103
# Load new environment variables
source $HOME/.bashrc
# Initialize Gaia node
gaianet init --base $HOME/gaia-node-103 --config https://raw.githubusercontent.com/GaiaNet-AI/node-configs/main/qwen2-0.5b-instruct/config.json
gaianet config --base $HOME/gaia-node-103 --port 8103
gaianet init --base $HOME/gaia-node-103
# Kill any process using port 8103
sudo lsof -t -i:8103 | xargs kill -9
# Start Gaia node
gaianet start --base $HOME/gaia-node-103
# Get nodeID and deviceID
gaianet info --base $HOME/gaia-node-103
