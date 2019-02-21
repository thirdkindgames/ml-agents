@echo off
pushd "%~dp0"

if "%~1"=="" (
    echo Usage: training-monitor.bat start^|stop
    echo   start - Starts the training monitor
    echo   stop - Shuts down the training monitor
    exit /b -1
)

rem Stop and remove any previous monitors
echo Stopping any previous runs...
docker stop mlagent-training-monitor >nul 2>&1
docker rm mlagent-training-monitor >nul 2>&1

rem Finish now if 'stop' was passed on the command line
if "%~1"=="stop" (
    exit /b -1
)

if "%~1"=="start" (
    rem Run the monitor
    echo Running training monitor...
    echo Once the server is running, navigate to http://localhost:6006 to view the dashboard...
    start docker run --name "mlagent-training-monitor" --mount type=bind,source="%cd%"/unity-volume,target=/unity-volume -p 6006:6006 --entrypoint="tensorboard" thirdkindgames/mlagent-training:latest --docker-target-name=unity-volume --logdir=/unity-volume/summaries
)
