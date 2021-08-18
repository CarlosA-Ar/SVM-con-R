# Este archivo nos permite generar los archivos que usaremos para el tutorial

library(openxlsx)
library(readxl)

# Cargamos las base
info <-
  read.csv(
    "https://raw.githubusercontent.com/CarlosA-Ar/SVM-con-R/main/csvs/speed_gender_height.csv"
  )

# La "limpiamos"
info <- info[,-1]
info$gender <- as.factor(info$gender)
info <- na.omit(info)

# Creamos dos conjuntos nuevos
info[, "train"] <- ifelse(runif(nrow(info)) < .8, 1, 0)
trainset <- info[info$train == 1,]
testset <- info[info$train == 0,]

trainColNum <- grep("train", names(info))
trainset <- trainset[,-trainColNum]
testset <- testset[,-trainColNum]

# Creamos las tres tablas

write.csv(info, file = "C:/Users/carlo/OneDrive/Documentos/Facultad de Ciencias/Ciencia de Datos/Exposiciones/SVM-con-R/csvs/info.csv", row.names = FALSE)
write.csv(trainset, file = "C:/Users/carlo/OneDrive/Documentos/Facultad de Ciencias/Ciencia de Datos/Exposiciones/SVM-con-R/csvs/trainset.csv", row.names = FALSE)
write.csv(testset, file = "C:/Users/carlo/OneDrive/Documentos/Facultad de Ciencias/Ciencia de Datos/Exposiciones/SVM-con-R/csvs/testset.csv", row.names = FALSE)
