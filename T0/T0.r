install.packages("readr")
 install.packages("ggplot2")
 install.packages("tidyr")
 install.packages("GGally")
 install.packages("corrplot")
 install.packages( "reshape2")

 library(reshape2)
 library(readr)
 library(ggplot2)
 library(tidyr)
 library(GGally)
 library(corrplot)
 
 # Link para os dados
 url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"
 
 # Carregar o dataset diretamente da internet
 wine <- read_csv(url, col_names = FALSE)
 
 # Nomear as colunas com base na documentação do UCI
 colnames(wine) <- c("Class", "Alcohol", "Malic_acid", "Ash", "Alcalinity_of_ash", 
                     "Magnesium", "Total_phenols", "Flavanoids", "Nonflavanoid_phenols", 
                     "Proanthocyanins", "Color_intensity", "Hue", 
                     "OD280_OD315_of_diluted_wines", "Proline")
 
 # Verifique se carregou corretamente:
 head(wine)
 
 #QUESTAO A
 # Média
 colMeans(wine[ , -1])  # Ignora a coluna "Class"
 # Desvio padrão
 sapply(wine[ , -1], sd)
 
 
 
 #QUESTAO B
 # Média por tipo
 aggregate(. ~ Class, data = wine, FUN = mean)
 # Desvio padrão por tipo
 aggregate(. ~ Class, data = wine, FUN = sd)
 
 
 
 #QUESTAO C
 # Transformar em formato longo (long format)
 wine_long <- pivot_longer(wine, cols = -Class, names_to = "Attribute", values_to = "Value")
 # Gráfico de densidade
 ggplot(wine_long, aes(x = Value, fill = factor(Class))) +
   geom_density(alpha = 0.5) +
   facet_wrap(~ Attribute, scales = "free", ncol = 4) +
   theme_minimal() +
   labs(fill = "Wine Type", title = "Distribuição de Densidade por Atributo")
 
 
 
 #QUESTAO D
 ggplot(wine_long, aes(x = factor(Class), y = Value, fill = factor(Class))) +
   geom_boxplot() +
   facet_wrap(~ Attribute, scales = "free", ncol = 4) +
   theme_minimal() +
   labs(x = "Wine Type", y = "Value", fill = "Wine Type", title = "Boxplot por Atributo")
 
 
 
 
 #QUESTAO E
 ggplot(wine, aes(x = Alcohol, y = Flavanoids, color = Class)) +
   geom_point(alpha = 0.7) +
   labs(title = "Dispersão: Álcool vs. Flavonoides", x = "Álcool", y = "Flavonoides") +
   theme_minimal()
 
 ggplot(wine, aes(x = Color_intensity, y = Hue, color = Class)) +
   geom_point(alpha = 0.7) +
   labs(title = "Dispersão: Intensidade da Cor vs. Matiz (Hue)", x = "Color Intensity", y = "Hue") +
   theme_minimal()
 
 ggplot(wine, aes(x = Flavanoids, y = OD280_OD315_of_diluted_wines, color = Class)) +
   geom_point(alpha = 0.7, size = 2) +
   labs(title = "Dispersão: Flavonoides vs. OD280/OD315", x = "Flavonoides", y = "OD280/OD315") +
   theme_minimal()
 
 ggplot(wine, aes(x = Alcohol, y = Proline, color = Class)) +
   geom_point(alpha = 0.7, size = 2) +
   labs(title = "Dispersão: Álcool vs. Prolina", x = "Álcool", y = "Prolina") +
   theme_minimal()
 
 #QUESTAO F
 # Matriz de correlação
 cor_matrix <- cor(wine[ , -1])
 # Gráfico de correlação
 corrplot(cor_matrix, method = "color", type = "upper", tl.cex = 0.7, title = "Correlação dos Atributos", mar = c(0,0,1,0))
 
 
 
 #QUESTAO G
 # Coordenadas paralelas
 ggparcoord(data = wine, columns = 2:14, groupColumn = 1, scale = "uniminmax", alphaLines = 0.5) +
   theme_minimal() +
   labs(title = "Gráfico de Coordenadas Paralelas", color = "Wine Type")
 

 #QUESTAO H
# Padronizar os dados (sem a coluna de classe)
wine_scaled <- as.data.frame(scale(wine[,-1]))

# Adicionar a coluna da classe de volta
wine_scaled$Class <- wine$Class

# Transformar para formato longo (long format) para visualização
wine_long <- melt(wine_scaled, id.vars = "Class")

# Criar um identificador de observação para o eixo y
wine_long$Observation <- rep(1:(nrow(wine)), times = ncol(wine_scaled) - 1)

# Plotar o gráfico
ggplot(wine_long, aes(x = variable, y = Observation, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  labs(title = "Gráfico de Orientação por Pixel",
       x = "Atributo",
       y = "Observação") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))