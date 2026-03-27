# 🔧 Guia Completo de Configuração

## ✅ Status Atual
- ✅ Node.js 18+ verificado
- ✅ Todas as dependências instaladas:
  - `@whiskeysockets/baileys` v6.5.0
  - `firebase-admin` v12.0.0
  - `express` v4.18.2
  - `cors` v2.8.5
  - `qrcode-terminal` v0.12.0
  - `qrcode` v1.5.3

---

## 🚀 RODAR LOCALMENTE

### 1️⃣ Obter Credenciais Firebase

1. Acesse [Firebase Console](https://console.firebase.google.com/)
2. Selecione seu projeto ou crie um novo
3. Vá para **Configurações do Projeto** → **Contas de serviço**
4. Clique em **Gerar nova chave privada** (JSON)
5. Salve o arquivo como `firebase-key.json` **na raiz do projeto**

### 2️⃣ Configurar Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto com:

```env
PORT=3000
```

⚠️ **IMPORTANTE**: Seu arquivo `firebase-key.json` deve estar no `.gitignore`

### 3️⃣ Iniciar o Servidor Localmente

```bash
npm start
```

Você verá:
```
Backend rodando na porta 3000
```

### 4️⃣ Autenticar WhatsApp

1. Abra seu navegador: `http://localhost:3000/qrcode`
2. Digitalize o código QR com seu smartphone
3. Aguarde a mensagem "Conexão aberta com sucesso!"

### 5️⃣ Testar a API

**Obter Status:**
```bash
curl http://localhost:3000/status
```

Resposta esperada:
```json
{
  "conectado": true,
  "processando": false,
  "numero": "5511999999999@s.whatsapp.net"
}
```

**Disparar Mensagens:**
```bash
curl -X POST http://localhost:3000/disparar \
  -H "Content-Type: application/json" \
  -d '{
    "campanhaId": "teste_001",
    "contatos": ["11999999999", "11888888888"],
    "mensagem": "Olá! Este é um teste."
  }'
```

---

## 🌥️ DEPLOY NO SQUARECLOUD

### 1️⃣ Configuração do Arquivo `squarecloud.app`

Seu arquivo já está configurado:
```
MAIN=server.js
MEMORY=512
```

Para aumentar memória se necessário:
```
MAIN=server.js
MEMORY=1024
```

### 2️⃣ Configurar Variáveis no Square Cloud

Na dashboard do Square Cloud, defina as variáveis de ambiente:

```
PORT=3000
```

### 3️⃣ Adicionar Credenciais Firebase

⚠️ **MELHOR PRÁTICA**: Configure as credenciais do Firebase como **variáveis de ambiente** seguras no Square Cloud.

**NÃO** coloque `firebase-key.json` no repositório!

Edite seu `server.js` para usar variáveis:

```javascript
// Em vez de:
// const serviceAccount = require("./firebase-key.json");

// Use variáveis de ambiente:
const serviceAccount = {
  type: process.env.FIREBASE_TYPE,
  project_id: process.env.FIREBASE_PROJECT_ID,
  private_key_id: process.env.FIREBASE_PRIVATE_KEY_ID,
  private_key: process.env.FIREBASE_PRIVATE_KEY.replace(/\\n/g, '\n'),
  client_email: process.env.FIREBASE_CLIENT_EMAIL,
  client_id: process.env.FIREBASE_CLIENT_ID,
  auth_uri: process.env.FIREBASE_AUTH_URI,
  token_uri: process.env.FIREBASE_TOKEN_URI,
  auth_provider_x509_cert_url: process.env.FIREBASE_AUTH_PROVIDER_CERT_URL,
  client_x509_cert_url: process.env.FIREBASE_CLIENT_X509_CERT_URL
};
```

### 4️⃣ fazer Deploy

```bash
# 1. Criar repositório Git (se não tiver)
git init
git add .
git commit -m "Deploy inicial"

# 2. Conectar ao Square Cloud
git remote add squarecloud <seu-repositorio-url>

# 3. Fazer push
git push squarecloud main
```

Ou use a dashboard do Square Cloud para conectar seu repositório GitHub/GitLab.

### 5️⃣ Acessar sua API em Produção

Após deploy, sua URL será algo como:
```
https://seu-projeto.squarecloud.app
```

---

## 🔐 SEGURANÇA

### ✅ Arquivo `.gitignore` Necessário

Certifique-se que seu `.gitignore` contém:
```
firebase-key.json
.env
node_modules/
auth_info_baileys/
```

### ✅ Proteção de Credenciais

Nunca commit:
- ❌ `firebase-key.json`
- ❌ `.env` com dados reais
- ❌ Chaves privadas

Use sempre variáveis de ambiente em produção.

---

## 📊 Endpoints Disponíveis

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| `GET` | `/status` | Status da conexão |
| `GET` | `/qrcode` | QR Code para autenticação |
| `POST` | `/disparar` | Inicia campanha de disparos |

---

## ❓ Troubleshooting

### Erro: "firebase-key.json não encontrado"
- ✅ Baixe do Console Firebase
- ✅ Coloque na raiz do projeto
- ✅ Reinicie o servidor

### Erro: "WhatsApp não conectado"
- Abra `/qrcode` e digitalize o código QR
- Aguarde a mensagem de sucesso

### Erro: "MEMORY exceeded"
- Aumente a memória no `squarecloud.app`
- Feche outras abas/apps

---

## 📝 Próximos Passos

1. ✅ Obter Firebase Credentials
2. ✅ Criar `.env` local
3. ✅ Testar localmente com `npm start`
4. ✅ Autenticar WhatsApp
5. ✅ Fazer deploy no Square Cloud
6. ✅ Testar endpoints em produção

---

**Dúvidas?** Consulte o [README.md](README.md) ou verifique logs no Square Cloud.
