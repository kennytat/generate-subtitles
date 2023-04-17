@ECHO OFF
TITLE VGM-STT
ECHO "Starting application, please wait..."
wsl /bin/bash -ic "if lsof -t -i:3000;then kill -9 $(lsof -t -i:3000);fi"
wsl /bin/bash -ic "source ~/miniconda3/bin/activate && npm run start --prefix ~/generate-subtitles & sleep 3 && BROWSER='/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe' sensible-browser http://localhost:3000"
PAUSE