#  IPRP Deploy Server Scripts
## [runBackendNative](https://git.dergeorg.at/dergeorg/Iprp-DeployServer/src/branch/master/runBackendNative.sh)
* Ladet aktuellen dev release von [Github](https://github.com/IPRP/Peer-Review-Platform-Backend) und startet diesen. 
* Logs werden in [LOGS](log.inno.dergeorg.at) angezeigt
* Es wird ein richtig konfiguriertes Rocket.toml benötigt

## [setupEnv](https://git.dergeorg.at/dergeorg/Iprp-DeployServer/src/branch/master/setupEnv.sh)
##### Bearbeitet die Datei [unittests.py](https://github.com/IPRP/Peer-Review-Platform-Frontend/blob/backend/tests/unittests.py)
* Ändert BASE_URL von localhost:8081 auf iprp.dergeorg.at
* Ändert [geckodriver](https://git.dergeorg.at/dergeorg/Iprp-DeployServer/src/branch/master/geckodriver) von der Windows auf die Linux64 version
* Fügt --headless als Firefox arg hinzu 

##### Startet die Selenium tests
* Output kommt in ~/iprpLog/selenium.log
* Wenn die letzte Zeile FAILED enthält --> exit error code 123 --> unstable Jenkins Build
* Wenn kein FAILD enthalten ist --> Stable Jenkins Build


## [geckodriver](https://git.dergeorg.at/dergeorg/Iprp-DeployServer/src/branch/master/geckodriver)
Linux web driver

## [Dockerfile](https://git.dergeorg.at/dergeorg/Iprp-DeployServer/src/branch/master/Dockerfile)
Erste versuche backend in Docker laufen zu lassen

## [Jenkins](https://jenkins.dergeorg.at)
* [Job inno](https://jenkins.dergeorg.at/job/InnoFrontend/) [![Build Status](https://jenkins.dergeorg.at/job/InnoFrontend/badge/icon)](https://jenkins.dergeorg.at/job/InnoFrontend/)

