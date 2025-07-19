#link do IBX-50
#https://sistemaswebb3-listados.b3.com.br/indexPage/day/IBXL?language=pt-br

# Carregar bibliotecas
library(quantmod)
library(readxl)

carrega <- function() {
  ibx50 <- read_excel('ibx50.xlsx')
  dataset <- list()
  
  for (i in 1:nrow(ibx50)) {
    ticker_base <- ibx50$Code[i]
    ticker <- sprintf('%s.SA', ticker_base)
    cat('Baixando:', ticker, "\n")
    
    tryCatch({
      getSymbols(ticker, src = 'yahoo', from = as.Date('2000-01-01'), to = Sys.Date(), auto.assign = TRUE)
      prices <- get(ticker)
      dataset[[ticker_base]] <- data.frame(
        date = index(prices),
        open   = as.numeric(Op(prices)),
        high   = as.numeric(Hi(prices)),
        low    = as.numeric(Lo(prices)),
        close  = as.numeric(Cl(prices)),
        volume = as.numeric(Vo(prices))
      )
    }, error = function(e) {
      cat('Erro em ', ticker, ':', conditionMessage(e), '\n')
    })
  }
  
  return(dataset)
}

stocks <- carrega()
data_dir <- '../../data'
if (!dir.exists(data_dir))
  dir.create(data_dir, recursive = TRUE)
save(stocks, file = file.path(data_dir, 'stocks.RData'))
#write.csv(stocks, file = file.path(data_dir, 'stocks.csv'), row.names = FALSE)