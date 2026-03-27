# ⚡ COMEÇAR AGORA - Guia Rápido

## 3 Passos para Rodar Localmente

### 1. Obter Firebase Key

1. Acesse: https://console.firebase.google.com/
2. Selecione seu projeto
3. **Configurações do Projeto** → **Contas de serviço**
4. Clique em **Gerar nova chave privada (JSON)**
5. Salve como `firebase-key.json` na raiz do projeto

### 2. Iniciar Servidor

```bash
npm start
```

Verá: `Backend rodando na porta 3000` ✅

### 3. Autenticar WhatsApp

Abra: http://localhost:3000/qrcode
- Digitalize o QR Code com seu celular
- Aguarde "Conexão aberta com sucesso!"

---

## ✅ Testar API

### Status (verificar conexão)
```bash
curl http://localhost:3000/status
```

### Enviar Mensagens
```bash
curl -X POST http://localhost:3000/disparar \
  -H "Content-Type: application/json" \
  -d '{
    "campanhaId": "teste123",
    "contatos": ["11999999999"],
    "mensagem": "Olá! Teste de API"
  }'
```

---

## 🌥️ Deploy no Square Cloud

1. **Adicionar variáveis de ambiente** na dashboard:
   ```
   FIREBASE_PROJECT_ID=seu-id
   FIREBASE_PRIVATE_KEY_ID=seu-key-id
   FIREBASE_PRIVATE_KEY=sua-private-key
   FIREBASE_CLIENT_EMAIL=seu-email
   FIREBASE_CLIENT_ID=seu-client-id
   FIREBASE_AUTH_URI=https://accounts.google.com/o/oauth2/auth
   FIREBASE_TOKEN_URI=https://oauth2.googleapis.com/token
   FIREBASE_AUTH_PROVIDER_CERT_URL=https://www.googleapis.com/oauth2/v1/certs
   FIREBASE_DATABASE_URL=https://seu-projeto.firebaseio.com
   ```

2. **Fazer Push do Código**
   ```bash
   git push squarecloud main
   ```

3. **Acessar**
   ```
   https://seu-projeto.squarecloud.app/status
   ```

---

## 📋 Dependências Instaladas ✅

| Pacote | Versão | Função |
|--------|--------|--------|
| `@whiskeysockets/baileys` | 6.5.0 | WhatsApp API |
| `firebase-admin` | 12.0.0 | Backend Firebase |
| `express` | 4.18.2 | Servidor Web |
| `cors` | 2.8.5 | CORS Headers |
| `qrcode-terminal` | 0.12.0 | QR no Terminal |
| `qrcode` | 1.5.3 | QR HTML |
| `dotenv` | Latest | Variáveis de Ambiente |

---

## 🔐 Segurança

**NUNCA** faça commit de:
- ❌ `firebase-key.json`
- ❌ `.env` com dados reais

Seu `.gitignore` já está configurado ✅

---

## 📞 Suporte

- **Erro Firebase?** → Ver [CONFIGURACAO.md](CONFIGURACAO.md)
- **Erro WhatsApp?** → Rescaneie o QR Code
- **Erro Memory?** → Aumentar memoria em `squarecloud.app`

