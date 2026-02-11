# ETL Pipeline

Este diretório contém os scripts de construção dos datasets (`.RData`) usados no projeto.

## Execução única (orquestrador)

Para executar todas as rotinas ETL de uma vez:

```r
Rscript etl/etl.R
```

O orquestrador:

- executa cada script no seu diretório (resolvendo caminhos relativos corretamente);
- valida os arquivos `.RData` esperados após cada execução;
- informa quais `.RData` em `tspredit/` não têm script correspondente em `etl/`.

Princípio de reprodutibilidade adotado:

- a geração de `data/*.RData` é autocontida no repositório;
- nenhum script ETL faz download de dados em tempo de execução;
- toda origem externa é documentada nos comentários (`Origin`) e nos `README.md`.

Exceção controlada (`stocks`):

- `etl/stocks/01-extract_transform_load-stocks.R` usa cache local por padrão (`etl/stocks/source/stocks.RData`);
- para recarregar do Yahoo Finance, defina `TSPREDBENCH_STOCKS_REFRESH=true`;
- a recarga não é padrão e atualiza o cache local.

## Mapa de scripts ETL

| Script | Saída (`tspredit/`) |
|---|---|
| `etl/bioenergy/01-extract_transform_load-bioenergy.R` | `bioenergy.RData` |
| `etl/cats/01-extract_load-cats.R` | `CATS.RData` |
| `etl/climate/01-extract_transform_load-climate.R` | `climate.RData` |
| `etl/emissions/01-extract_transform_load-emissions.R` | `emissions.RData` |
| `etl/eunite-loads/01-extract_load-eunite-loads.R` | `EUNITE.Loads.RData` |
| `etl/eunite-reg/01-extract_load-eunite-reg.R` | `EUNITE.Reg.RData` |
| `etl/eunite-temp/01-extract_load-eunite-temp.R` | `EUNITE.Temp.RData` |
| `etl/fertilizers/01-extract_transform_load-fertilizers.R` | `fertilizers.RData` |
| `etl/gdp/01-extract_transform_load-gdp.R` | `gdp.RData` |
| `etl/ipeadata-d/01-extract_load-ipeadata-d.R` | `ipeadata.d.RData` |
| `etl/ipeadata-m/01-extract_load-ipeadata-m.R` | `ipeadata.m.RData` |
| `etl/m1/01-extract_transform_load-m1.R` | `m1.RData` |
| `etl/m3/01-extract_transform_load-m3.R` | `m3.RData` |
| `etl/m4/01-extract_transform_load-m4.R` | `m4.RData` |
| `etl/nn3/01-extract_load-nn3.R` | `NN3.RData` |
| `etl/nn5/01-extract_load-nn5.R` | `NN5.RData` |
| `etl/pesticides/01-extract_transform_load-pesticides.R` | `pesticides.RData` |
| `etl/santafe-a/01-extract_load-santafe-a.R` | `SantaFe.A.RData` |
| `etl/santafe-d/01-extract_load-santafe-d.R` | `SantaFe.D.RData` |
| `etl/stocks/01-extract_transform_load-stocks.R` | `stocks.RData` |

## Documentação dos scripts ETL

Todos os scripts `01-extract*_*.R` possuem documentação de cabeçalho no próprio código
(`Purpose`, `Input`, `Output`, `Origin`), além de `README.md` por domínio.
O arquivo `etl/etl.R` complementa essa documentação com a visão de orquestração ponta a ponta.


