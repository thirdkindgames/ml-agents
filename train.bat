@echo off
pushd "%~dp0"

rem Check parameters
if "%~1"=="" (
    echo Usage: train.bat ^<run-id^>
    echo   ^<run-id^> - A unique identifier for this training session
    exit /b -1
)

rem Stop and remove any previous training sessions
echo Stopping any previous runs...
docker stop mlagent-training >nul 2>&1
docker rm mlagent-training >nul 2>&1

rem Run training
echo Running training...
docker run --name "mlagent-training" --mount type=bind,source="%cd%"/unity-volume,target=/unity-volume -p 5005:5005 mlagent-training:latest --docker-target-name=unity-volume trainer_config.yaml --train --run-id=%1
