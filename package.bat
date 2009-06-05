@echo off
if not "%1"=="release" goto skip
call vim -o install.rdf chrome\content\danbooruup\contents.rdf
:skip
del /f danbooruup.xpi > nul
del /f chrome\danbooruup.jar > nul
cd chrome
zip -9r danbooruup.jar . -x .cvsignore
cd ..
zip -9r danbooruup.xpi chrome.manifest install.rdf chrome\danbooruup.jar defaults
copy /y components\danbooru\_xpidlgen\danbooruac.xpt components
zip -9r danbooruup.xpi components\danbooruUpHelper.js components\danbooruTagHistoryService.js components\*.xpt
