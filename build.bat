@echo off
pushd "%~dp0"

rem Build the training server
docker build -t mlagent-training .
