@echo off
setlocal
set "TEMP=D:\.temp\pico"
set "TMP=D:\.temp\pico"
set "PIP_CACHE_DIR=D:\.cache\pico\pip"
set "PYTHONPYCACHEPREFIX=D:\.cache\pico\pycache"
for /f "usebackq tokens=1,* delims==" %%A in ("D:\Projects\pico-main\.env") do (
  if /I "%%A"=="PICO_DEEPSEEK_API_BASE" set "PICO_DEEPSEEK_API_BASE=%%~B"
  if /I "%%A"=="PICO_DEEPSEEK_API_KEY" set "PICO_DEEPSEEK_API_KEY=%%~B"
)
cd /d "D:\Projects\pico-main"
"D:\Projects\pico-main\.venv\Scripts\python.exe" -B -m pico %* --provider deepseek --model deepseek-flash
endlocal
