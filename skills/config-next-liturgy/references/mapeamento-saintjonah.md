# Guia de Mapeamento: Saint Jonah para Slujba

## 1. Localização no Saint Jonah
- Acesse `https://www.saintjonah.org/lit/` e localize a página do dia (ex: `lit_august17_t4.htm`).
- Identifique a data, o tom ressurrecional (`t1` a `t8`) e as comemorações do dia (festas, pós-festas, santos).

## 2. Estrutura do config.json e Mapeamento

| Seção Saint Jonah | Propriedade em `config.json` | Arquivo em `src/data/` | Convenção de ID |
| :--- | :--- | :--- | :--- |
| Cabeçalho / Título | `titulo` | - | Formato: `"[Nº]º Domingo após Pentecostes / [Santos] / [Festa]"` |
| Tom | `tom` | - | `"1"` a `"8"` |
| Antiphons / Beatitudes | `antifonas_ids` | `antifonas.json` | `[]` para Típicas/Bem-aventuranças, ou `["festa"]` se houver antífonas próprias |
| Troparia | `troparios_ids` | `troparios.json` | `["d<tom>", "<festa>", "<padroeiro>", "<santo>"]` |
| Kontakia | `kontakions_ids` | `kondakions.json` | `["d<tom>", "<padroeiro>", "<santo>", "<theotokion_ou_festa>"]` |
| Prokimenon 1 | `prokimeno1_id` | `prokimenos.json` | `"d<tom>"` (ou da festa) |
| Verso Prokímeno | `prokimeno_verso_id` | `versos.json` | `"sl<cap>-<verso>"` |
| Prokimenon 2 (opcional) | `prokimeno2_id` | `prokimenos.json` | Chave bíblica/santo (ex: `"lc1-46"`, `"sl115-15"`) ou `null` |
| Alleluia Verses | `aleluia1`, `aleluia2`, `aleluia3` | `versos.json` | `{"id": "sl<cap>-<verso>", "tom": "<tom>"}` |
| Zadostoinik / Megalynarion | `megalinario` | `megalinarios.json` | `"nome_festa"` ou `""` (vazio para "É Digno em Verdade") |
| Communion Verse | `versos_comunhao_id` | `versos-comunhao.json` | `"louvai"`, `"tomarei_calice"`, `"louvai_tomarei_calice"`, etc. |

## 3. Regras de Ordem Litúrgica (Typikon Russo / ROCOR)

### Tropários (após Pequena Entrada):
1. Tropário Ressurrecional do Tom (`d1` a `d8`).
2. Tropário da Festa ou Pós-festa (se houver).
3. Tropário do Templo (padroeiro da paróquia).
4. Tropário do(s) Santo(s) do dia.

### Kondákios:
1. Kondákio Ressurrecional do Tom (`d1` a `d8`).
2. Kondákio do Templo (padroeiro).
3. Kondákio do Santo do dia (antes dele é entoado *Glória ao Pai...* se for o penúltimo).
4. *E agora e sempre...*: Kondákio da Festa/Pós-festa, ou Theotokion / *"Ó admirável Protetora dos Cristãos"* (`admiravel_protetora`).

### Prokímenos e Aleluias:
- Aos domingos comuns: Prokímeno e Aleluia do Tom da Ressurreição.
- Havendo festa/santo maior com leitura própria de Epístola: canta-se o Prokímeno 1 (Ressurreição), Verso 1, seguido do Prokímeno 2 (Festa/Santo).

## 4. Inserção de Novos Dados em `src/data/`
Quando um texto do Saint Jonah ainda não existir em `src/data/`:
1. Traduzir fielmente para o Português (PT-BR) com estilo litúrgico solene.
2. Manter barras de pausa litúrgica: ` / ` para hemistíquios/versículos e ` // ` antes da cadência final.
3. Usar IDs padronizados em snake_case (ex: `joao_batista`, `dormicao`, `sl109-4`).
