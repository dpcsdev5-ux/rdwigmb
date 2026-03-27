# 🚀 Sistema de Disparo de Mensagens WhatsApp

Projeto integrado com Baileys, Firebase e deployed no SquareCloud.

## 📋 Pré-requisitos

- Node.js 18+ instalado
- Conta Firebase ativa
- Arquivo `firebase-key.json` configurado

## 🔧 Instalação Local

### 1. Instalar dependências
```bash
npm install
```

### 2. Configurar Firebase
- Baixe o arquivo `firebase-key.json` do Console Firebase
- Coloque na raiz do projeto (ao lado de `server.js`)

### 3. Executar localmente
```bash
npm start
```

O servidor rodará em `http://localhost:3000`

## 📱 Endpoints Disponíveis

### `GET /qrcode`
- Retorna a imagem do QR Code para autenticação WhatsApp
- Use para digitalizar no seu celular

### `GET /status`
- Verifica o status de conexão e se há processo em andamento
- Resposta: `{ conectado: boolean, processando: boolean, numero: string }`

### `POST /disparar`
- Inicia uma campanha de disparo
- Body:
```json
{
  "campanhaId": "id_unico",
  "contatos": ["11999999999", "11888888888"],
  "mensagem": "Sua mensagem aqui"
}
```

## 🌥️ Deploy no SquareCloud

### 1. Preparar o repositório Git
```bash
git init
git add .
git commit -m "First commit"
```

### 2. Conectar ao SquareCloud
- Faça upload do repositório para GitHub
- Acesse [SquareCloud Dashboard](https://squarecloud.app)
- Conecte seu repositório GitHub
- O arquivo `squarecloud.app` será detectado automaticamente

### 3. Configurar variáveis de ambiente
No dashboard do SquareCloud:
- Adicione as variáveis do `firebase-key.json`
- Ou faça upload do arquivo se permitido

### 4. Deploy
- Click em "Deploy"
- Aguarde a compilação e inicialização

## ⚙️ Configuração SquareCloud

O arquivo `squarecloud.app` já está pré-configurado:
```
MAIN=server.js
MEMORY=512
```

Você pode ajustar a memória conforme necessário.

## 🔑 Variáveis de Ambiente Importantes

**⚠️ NUNCA compartilhe seu `firebase-key.json`**

```
PORT=3000 (SquareCloud define automaticamente)
```

## 📝 Arquivo .gitignore

Arquivos críticos já estão no `.gitignore`:
- `firebase-key.json` - Chaves do Firebase
- `auth_info_baileys/` - Tokens de autenticação WhatsApp
- `.env` - Variáveis locais

## 🐛 Troubleshooting

**Erro "WhatsApp não conectado"**
- Digitalize o QR Code em `/qrcode`
- Aguarde 30-60 segundos para conectar

**Erro de Firebase**
- Verifique se `firebase-key.json` está na raiz
- Confira as permissões no Console Firebase

**Limpar autenticação**
- Delete a pasta `auth_info_baileys/`
- Digitalize o QR Code novamente

## 📦 Estrutura do Projeto

```
.
├── server.js                 # Servidor principal
├── firebase-key.json         # ⚠️ Não versionada (no .gitignore)
├── package.json              # Dependências
├── squarecloud.app           # Config SquareCloud
├── .env.example              # Exemplo de variáveis
├── .gitignore                # Arquivos ignorados
└── auth_info_baileys/        # ⚠️ Pasta gerada auto ( no .gitignore)
```

## 🚀 Próximos Passos

1. Instale as dependências: `npm install`
2. Adicione o `firebase-key.json`
3. Teste localmente: `npm start`
4. Deploy no SquareCloud via GitHub

---

**Suporte**: Entre em contato se tiver dúvidas!
