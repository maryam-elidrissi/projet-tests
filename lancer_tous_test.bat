@echo off
echo Lancement de tous les tests...

call lancer_test_unitaires.bat
if errorlevel 1 exit /b 1

call lancer_test_api.bat
if errorlevel 1 exit /b 1

call lancer_test_ihm.bat
if errorlevel 1 exit /b 1

echo Tous les tests se sont exécutés correctement.
pause