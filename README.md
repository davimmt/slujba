# Slujba

Uma aplicação em Astro para gerar as partes variáveis da Divina Liturgia de acordo com a configuração do dia.

## Requisitos

* Docker
* GNU Make

## Executando

Construir e iniciar a aplicação:

```sh
make dev
```

A aplicação ficará disponível em:

```
http://localhost:4321
```

## Configuração

Edite o arquivo `config.json` na raiz do projeto para definir a liturgia do dia.

Exemplo:

```json
{
  "titulo": "4º Domingo após o Pentecostes",
  "tom": "2",
  "troparios_ids": [
    "d2",
    "zinaida_filonila"
  ],
  "kontakions_ids": [
    "d2",
    "zinaida_filonila",
    "protetora_cristaos"
  ],
  "prokimenos1_id": "d2",
  "prokimenos2_id": "sl115-15"
}
```

## Estrutura dos dados

Os textos litúrgicos estão organizados em arquivos JSON em `src/data/`:

```
src/data/
├── troparios.json
├── kondakions.json
└── prokimenos.json
```

Cada item é identificado por uma chave única, utilizada no `config.json`.

## Desenvolvimento

O projeto utiliza:

* Astro 5
* Tailwind CSS v4

## Licença

MIT.
