@echo off
pushd "%~dp0"

rem Check parameters
if "%~1"=="" (
    echo Usage: train.bat ^<run-id^>
    echo   ^<run-id^> - A unique identifier for this training session
    exit /b -1
)

rem Run training
docker run --mount type=bind,source="%cd%"/unity-volume,target=/unity-volume -p 5005:5005 blockparty:latest --docker-target-name=unity-volume trainer_config.yaml --train --run-id=%1
