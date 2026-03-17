@echo off
title ChurnPredictionAI
echo.
echo  ================================================
echo    ChurnPredictionAI — Starting...
echo  ================================================
echo.

:: Check Python
python --version >nul 2>&1
if errorlevel 1 (
    echo  ERROR: Python not found.
    echo  Download from https://python.org/downloads
    echo  Make sure to tick "Add Python to PATH" during install.
    pause
    exit /b 1
)

:: Install deps
echo  Checking dependencies...
pip install numpy pandas openpyxl -q
echo  Dependencies OK.
echo.

:: Start backend
echo  Starting backend on http://localhost:8000 ...
cd /d "%~dp0backend"
start /b python main.py 8000
timeout /t 2 /nobreak >nul

:: Open frontend
echo  Opening frontend...
start "" "%~dp0frontend\index.html"

echo.
echo  ================================================
echo    Backend:  http://localhost:8000
echo    Frontend: open frontend\index.html in browser
echo.
echo    If you see "API offline" in the app:
echo    Go to http://localhost:8000/api/health
echo    in your browser to confirm the backend works.
echo.
echo    If browser blocks local files, run in a 2nd
echo    terminal:
echo      cd frontend
echo      python -m http.server 3000
echo    Then open http://localhost:3000
echo.
echo    Close this window to stop the server.
echo  ================================================
echo.
pause
