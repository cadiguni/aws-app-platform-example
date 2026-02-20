# App (Node.js + Express)

Aplicacao minima para validar health check e logs no ECS Fargate.

## Endpoints

- `GET /health` -> `200` com `{ "status": "ok" }`
- `GET /` -> `200` com `{ "app": "...", "version": "..." }`

## Variaveis de ambiente

- `PORT` (default: `8080`)
- `APP_NAME` (default: `aws-app-platform`)
- `APP_VERSION` (default: `dev`)

## Rodar local com Docker

```bash
docker build -t aws-app-platform:local ./app
docker run --rm -p 8080:8080 aws-app-platform:local
```

Teste:

```bash
curl http://localhost:8080/health
curl http://localhost:8080/
```
