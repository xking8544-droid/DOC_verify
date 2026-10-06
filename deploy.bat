@echo off
echo Deploying DocuVerify to Tomcat...
set TOMCAT_DIR=C:\apache-tomcat-9.0.97
if not exist "%TOMCAT_DIR%" set TOMCAT_DIR=C:\apache-tomcat-9
if defined CATALINA_HOME set TOMCAT_DIR=%CATALINA_HOME%
set TOMCAT_WEBAPPS=%TOMCAT_DIR%\webapps
xcopy /E /Y /I "web" "%TOMCAT_WEBAPPS%\DocuVerify"
echo Deployment complete!
echo Access at: http://localhost:8080/DocuVerify/
pause
