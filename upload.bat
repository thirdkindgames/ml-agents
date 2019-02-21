@echo off
pushd "%~dp0"

rem Push the training server to the repository
docker push thirdkindgames/mlagent-training
