@ECHO OFF
TITLE SETUP VGM-STT
ECHO "Setting up application, please wait..."
wsl /bin/bash -ic "curl -s https://gist.githubusercontent.com/kennytat/91a377e487c5c34f33e2ec18c97a3ae2/raw/161775b013db0613a280863b57a9583ee43d86dd/stt-wsl-setup.sh | sudo bash"
ECHO "Setup application done, please close this windows and run run.bat"
PAUSE