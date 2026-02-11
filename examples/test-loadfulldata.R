library(tspredit)

# 1) EUNITE.Loads
data(EUNITE.Loads)
EUNITE.Loads <- loadfulldata(EUNITE.Loads)

# 2) EUNITE.Reg
data(EUNITE.Reg)
EUNITE.Reg <- loadfulldata(EUNITE.Reg)

# 3) EUNITE.Temp
data(EUNITE.Temp)
EUNITE.Temp <- loadfulldata(EUNITE.Temp)

# 4) ipeadata.d
data(ipeadata.d)
ipeadata.d <- loadfulldata(ipeadata.d)

# 5) ipeadata.m
data(ipeadata.m)
ipeadata.m <- loadfulldata(ipeadata.m)

# 6) NN3
data(NN3)
NN3 <- loadfulldata(NN3)

# 7) NN5
data(NN5)
NN5 <- loadfulldata(NN5)

# 8) CATS
data(CATS)
CATS <- loadfulldata(CATS)

# 9) SantaFe.A
data(SantaFe.A)
SantaFe.A <- loadfulldata(SantaFe.A)

# 10) SantaFe.D
data(SantaFe.D)
SantaFe.D <- loadfulldata(SantaFe.D)

# 11) bioenergy
data(bioenergy)
bioenergy <- loadfulldata(bioenergy)

# 12) climate
data(climate)
climate <- loadfulldata(climate)

# 13) emissions
data(emissions)
emissions <- loadfulldata(emissions)

# 14) fertilizers
data(fertilizers)
fertilizers <- loadfulldata(fertilizers)

# 15) gdp
data(gdp)
gdp <- loadfulldata(gdp)

# 16) m1
data(m1)
m1 <- loadfulldata(m1)

# 17) m3
data(m3)
m3 <- loadfulldata(m3)

# 18) m4
data(m4)
m4 <- loadfulldata(m4)

# 19) pesticides
data(pesticides)
pesticides <- loadfulldata(pesticides)

# 20) stocks
data(stocks)
stocks <- loadfulldata(stocks)

cat("Todos os datasets foram carregados via mini data + loadfulldata().\n")
