# 🔧 GUIA DE INSTALAÇÃO - Sistema de Disparos WhatsApp

Seu ambiente apresentou problema na instalação automática do npm. Segue as soluções:

## ⚠️ Problema Detectado
- npm precisa de Git para instalar algumas dependências
- Git não foi encontrado no seu sistema

## 📦 Solução 1: Instalar Git (RECOMENDADO)

### Windows:
1. Baixe Git em: https://git-scm.com/download/win
2. Execute o instalador e escolha as opções padrão
3. Reinicie o terminal PowerShell
4. Execute:
```powershell
cd "c:\Users\DPCS\Desktop\disparos square baileys"
npm install
```

## 📦 Solução 2: Instalar via Chocolatey (Se Admin)

```powershell
# Abra PowerShell como ADMINISTRADOR
choco install git -y
# Reinicie o PowerShell
npm install
```

## 📦 Solução 3: Instalar Dependências. Manualmente

Se nenhuma das soluções acima funcionar, instale uma por uma:

```powershell
cd "c:\Users\DPCS\Desktop\disparos square baileys"

npm install express
npm install cors  
npm install qrcode-terminal
npm install qrcode
npm install firebase-admin
npm install @whiskeysockets/baileys
```

## ✅ Verificar Instalação

Após instalar, verifique se funcionou:

```powershell
npm list
```

Você deve ver algo como:
```
disparos-baileys-square@1.0.0
├── @whiskeysockets/baileys@6.5.0
├── firebase-admin@12.0.0
├── express@4.18.2
├── cors@2.8.5
├── qrcode-terminal@0.12.0
└── qrcode@1.5.3
```

## 🚀 Iniciar o Servidor

Após instalar com sucesso:

```powershell
npm start
```

Você verá:
```
Backend rodando na porta 3000
```

## 🌐 Testar Localmente

1. Abra o navegador: `http://localhost:3000/qrcode`
2. Digitalize o QR Code com seu WhatsApp
3. Aguarde a conexão (30-60 segundos)

## 📝 Dependências do Projeto

```json
{
  "@whiskeysockets/baileys": "6.5.0",
  "firebase-admin": "12.0.0",
  "express": "4.18.2",
  "cors": "2.8.5",
  "qrcode-terminal": "0.12.0",
  "qrcode": "1.5.3"
}
```

---

**Precisa de ajuda?** Entre em contato!
