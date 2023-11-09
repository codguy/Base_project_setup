@echo off
title Creating a new project

set /p project_name= Enter the name of the project : 
set project_name=%project_name: =_%

:select_type
echo.
set /p type= Do you want to make a new project with Basic configuration (b) or Custom configuration (c) (b/c) ? 

if %type% == b goto :basic_setup
if %type% == c goto :custom_setup else goto :wrong_type


:basic_setup
md %project_name%
cd ./%project_name%
:: Setup the project in another CMD window
start cmd.exe /c "npm init -y"
echo.
echo Press any key once the project setup is completed &pause>nul
echo.
:: . in the commnad bellow is used to show the current project directory
xcopy ./basic_project_files/*.* . /i /e
echo.
:: installing dependencies
start cmd.exe /c "npm install express nodemon ejs mongoose body-parser"
echo Press any key once all the dependencies are installed &pause>nul

echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "talking.vbs
echo speech.speak "project setup completed press any key to continue...." >> "talking.vbs"
start talking.vbs
:: open the project in VScode
code .
pause
del talking.vbs
exit

:custom_setup
md %project_name%
cd ./%project_name%
start cmd.exe /c "npm init"
pause
code .
exit

:wrong_type
echo You have entered a wrong project type configuration. Please select a right one.
echo.
goto :select_type