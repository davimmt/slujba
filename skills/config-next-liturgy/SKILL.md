---
name: config-next-liturgy
description: Configura as partes variáveis da Divina Liturgia Ortodoxa Russa (tropários, kondákios, prokímenos, aleluias, comunhão) no config.json e src/data a partir de saintjonah.org/lit com tradução para PT-BR. Use sempre que o usuário solicitar configurar a liturgia do próximo domingo/dia, atualizar hinos litúrgicos semanais, consultar ou cadastrar novos tropários, kondákios ou versos bíblicos.
---

# Configuração da Próxima Liturgia

Instruções para configurar as partes variáveis da Divina Liturgia Ortodoxa (tradição Russa / ROCOR) na aplicação Slujba.

## Fluxo de Trabalho

### 1. Obter os Textos Litúrgicos do Dia
1. Acesse `https://www.saintjonah.org/lit/` e localize a página da data da celebração (ex: `lit_august17_t4.htm`).
2. Extraia:
   - **Data e Título**: Domingo após Pentecostes, festas e santos comemorados.
   - **Tom do Domingo**: Tom 1 a 8.
   - **Tropários e Kondákios**: Ordem completa de entrada.
   - **Prokímeno(s)**: Tom, versículo principal e verso do leitor.
   - **Aleluia**: Tom(s) e versículos bíblicos.
   - **Megalinário**: Irmos e refrão da 9ª Ode se houver festa/pós-festa em vez de *É Digno em Verdade*.
   - **Verso da Comunhão**: Versículo(s) indicado(s).

### 2. Consultar as Referências dos Tons
Consulte a pasta `references/` para carregar rapidamente os textos e identificadores ressurrecionais de cada tom:
- [Tom 1](references/tom-1.md)
- [Tom 2](references/tom-2.md)
- [Tom 3](references/tom-3.md)
- [Tom 4](references/tom-4.md)
- [Tom 5](references/tom-5.md)
- [Tom 6](references/tom-6.md)
- [Tom 7](references/tom-7.md)
- [Tom 8](references/tom-8.md)
- [Mapeamento e Regras Litúrgicas](references/mapeamento-saintjonah.md)

### 3. Verificar e Inserir Textos em `src/data/`
Verifique se todas as chaves necessárias existem nos arquivos JSON de `src/data/`. Caso algum hino ou verso do saintjonah.org não exista, traduza para PT-BR e cadastre no respectivo arquivo:

- `src/data/troparios.json`:
  ```json
  "santo_exemplo": {
    "titulo": "ao Santo Mártir Exemplo",
    "tom": "4",
    "versos": "Texto em português / dividido em pausas litúrgicas // e cadência final."
  }
  ```
- `src/data/kondakions.json`:
  ```json
  "santo_exemplo": {
    "titulo": "ao Santo Mártir Exemplo",
    "tom": "2",
    "versos": "Texto em português / com as pausas litúrgicas // adequadas."
  }
  ```
- `src/data/prokimenos.json`:
  ```json
  "ref_id": {
    "tom": "4",
    "versos": { "1": "Primeira parte,", "2": "Segunda parte." },
    "ref": "Sl. XX,X"
  }
  ```
- `src/data/versos.json`:
  ```json
  "slXX-X": {
    "ref": "Sl. XX,X",
    "verso": "Texto do verso bíblico."
  }
  ```
- `src/data/megalinarios.json` (quando aplicável):
  ```json
  "festa_id": {
    "tom": "1",
    "refrao": "Refrão...",
    "irmos": "Irmos..."
  }
  ```
- `src/data/versos-comunhao.json` (quando aplicável):
  ```json
  "chave_comunhao": "Texto do verso da comunhão // Aleluia, Aleluia, Aleluia!"
  ```

> **Padrão Litúrgico de Pontuação**:
> - Use ` / ` para separar hemistíquios (versículos).
> - Use ` // ` antes da cláusula final de aclamação.

### 4. Atualizar `config.json`
Preencha o arquivo `config.json` na raiz do projeto com o esquema esperado por `src/pages/index.astro`:

```json
{
  "titulo": "13º Domingo após Pentecostes / Mártir Míron de Cízico / Pós-festa da Dormição",
  "tom": "4",
  "antifonas_ids": [],
  "troparios_ids": ["d4", "dormicao", "zinaida_filonila"],
  "kontakions_ids": ["d4", "zinaida_filonila", "miron_cizico", "dormicao"],
  "prokimeno1_id": "d4",
  "prokimeno_verso_id": "sl103-1",
  "prokimeno2_id": "lc1-46",
  "aleluia1": { "id": "sl44-5", "tom": "4" },
  "aleluia2": { "id": "sl44-8", "tom": "4" },
  "aleluia3": { "id": "sl131-8", "tom": "2" },
  "megalinario": "dormicao",
  "versos_comunhao_id": "louvai_tomarei_calice"
}
```

#### Regras de Ordem dos Hinos:
- **Tropários**: Ressurreição (`d<tom>`) → Festa/Pós-festa → Templo/Padroeiro → Santos do dia.
- **Kondákios**: Ressurreição (`d<tom>`) → Templo/Padroeiro → Santos do dia (*Glória ao Pai...* no penúltimo) → Festa/Theotokion (*E agora e sempre...* no último).
- Se não houver Kondákio festivo no final, utilize `"admiravel_protetora"`.

### 5. Validação
Confira se:
1. Todas as chaves em `config.json` correspondem exatamente a entradas existentes em `src/data/*.json`.
2. O tom e a concordância dos hinos estão corretos.
3. Não há erros de sintaxe JSON.
