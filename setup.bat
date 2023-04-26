@ECHO OFF
TITLE SETUP VGM-STT
ECHO "Setting up application, please wait..."
wsl /bin/bash -ic "curl -s https://raw.githubusercontent.com/kennytat/generate-subtitles/customise/setup.sh | sudo bash"
ECHO "Setup application done, please close this windows and run run.bat"
PAUSE