# 🔑 Como Gerar firebase-key.json

## Suas Credenciais Atuais

Você tem a configuração **Web SDK**:
```javascript
{
  apiKey: "AIzaSyAPj4Ch8c9P9N629LZWdVpn2r27mYZqhnM",
  authDomain: "igmbinstituto.firebaseapp.com",
  projectId: "igmbinstituto",
  storageBucket: "igmbinstituto.firebasestorage.app",
  messagingSenderId: "542892369227",
  appId: "1:542892369227:web:fd48852b2faacbef8b3e3c"
}
```

**Projeto:** `igmbinstituto`

---

## Passo a Passo para Gerar firebase-key.json

### 1. Acesse Firebase Console
👉 https://console.firebase.google.com/

### 2. Selecione o Projeto
- Clique em **igmbinstituto**

### 3. Vá para "Configurações do Projeto"
- Clique em ⚙️ (engrenagem) → **Configurações do Projeto**

### 4. Acesse "Contas de Serviço"
- Clique na aba **"Contas de serviço"**

### 5. Gere Nova Chave Privada
- Clique no botão **"Gerar nova chave privada"**
- Clique em **"Gerar"** (vai fazer download automático)
- Um arquivo `igmbinstituto-*.json` será baixado

### 6. Rename e Coloque no Projeto
```bash
# Renomeie o arquivo para firebase-key.json
# Coloque na raiz do seu projeto:
# c:\Users\DPCS\Desktop\disparos square baileys\firebase-key.json
```

---

## ✅ Verificar se Funcionou

```bash
cd "c:\Users\DPCS\Desktop\disparos square baileys"
npm start
```

Você verá:
```
✅ Firebase configurado com sucesso
Backend rodando na porta 3000
```

---

## 📊 Estrutura da Coleção `envios_concluidos`

O servidor **cria automaticamente** os documentos assim:

```json
{
  "contato": "11999999999",
  "id_campanha": "convidados_2024",
  "data": "2026-03-26T10:30:45.123Z",
  "status": "sucesso"
}
```

**Campos:**
- `contato` (string) - Número de WhatsApp
- `id_campanha` (string) - ID único da campanha
- `data` (timestamp) - Quando foi enviado
- `status` (string) - Sempre "sucesso" por enquanto

---

## 🚀 Testar Após Configurar

### 1. Iniciar Servidor
```bash
npm start
```

### 2. Autenticar WhatsApp
```
http://localhost:3000/qrcode
```
Digitalize o QR Code com seu celular.

### 3. Disparar Mensagens de Teste
```bash
curl -X POST http://localhost:3000/disparar \
  -H "Content-Type: application/json" \
  -d '{
    "campanhaId": "teste_inicial",
    "contatos": ["11999999999"],
    "mensagem": "Olá! Teste de API"
  }'
```

### 4. Verificar no Firestore
- https://console.firebase.google.com/
- Selecione **igmbinstituto**
- Vá para **Firestore Database**
- Veja a coleção **envios_concluidos**

---

## ⚠️ Importante

✅ **NUNCA** compartilhe o arquivo `firebase-key.json`
✅ **JÁ ESTÁ** no `.gitignore` do seu projeto
✅ **SEGURO** compartilhar as credenciais do Web SDK

