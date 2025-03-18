#!/bin/bash

# Update & install dependencies
sudo apt update && sudo apt install -y git python3 python3.12-venv screen

# Clone repository
git clone https://raw.githubusercontent.com/AldiGalang/Auto.git
cd Auto

# Setup virtual environment
python3 -m venv myenv
source myenv/bin/activate

# Install requirements
pip install -r requirements.txt

# Meminta input API keys dari pengguna
echo "Masukkan API Key Anda:"
read API_KEY

# Menyimpan API key ke file_api_keys.txt
echo "$API_KEY" > file_api_keys.txt

echo "API key telah disimpan di file_api_keys.txt."

# Jalankan bot dalam screen session
screen -dmS gaiabot python3 bot.py

echo "Bot sedang berjalan dalam screen session bernama 'gaiabot'. Gunakan 'screen -r gaiabot' untuk melihatnya."
