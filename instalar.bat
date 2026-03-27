@echo off
REM Script para instalar dependências do projeto

echo.
echo ======================================
echo Instalando dependências do projeto...
echo ======================================
echo.

REM Limpar cache do npm
echo Limpando cache do npm...
call npm cache clean --force

REM Instalar dependências
echo.
echo Instalando pacotes...
call npm install

echo.
echo ======================================
if %ERRORLEVEL% EQU 0 (
    echo ✅ Instalação concluída com sucesso!
    echo.
    echo Para iniciar o servidor, execute:
    echo npm start
) else (
    echo ❌ Erro na instalação
    echo Verifique se Git está instalado em seu sistema
)
echo ======================================

pause
