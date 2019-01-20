rm(list=ls())
cat("\014")

library(tidyverse)
library(tidyr)
library(ggplot2)
library(tabplot)
library(GGally)
library(dummies)
library(mice)
library(Hmisc)


##Carga de datos
data <- read.csv("..//Black_Friday/BlackFriday.csv", header = TRUE, na.strings = "")
friday <- as_tibble(data)


##Evaluación de Datos

str(friday)

Factores <- matrix( c(length(unique(friday$User_ID)), length(unique(friday$Occupation)), length(unique(friday$Marital_Status)),  length(unique(friday$Product_Category_1)),length(unique(friday$Product_Category_2)), length(unique(friday$Product_Category_3)), length(unique(friday$Purchase))),
                    nrow = 1, ncol = 7)
dimnames(Factores) <- list("Factores", c("User_ID", "Occupation", "Marital_Status", "Product_Category_1", "Product_Category_2", "Product_Category_3", "Purchase"))

knitr::kable(Factores, caption = "Factores")

#Convertimos a factores las variables: Occupation, Marital_Status, Product_Category1, Product_Category2 y Product_Category3

friday$Purchase_cat <- cut(friday$Purchase, breaks = 3, labels = c("Bajo", "Medio", "Alto"))

friday_cat <- dummy.data.frame(data.frame(friday), names = c("Age"), sep = ".")

friday_comb <- gather(friday,
                      key = "ProductCat",
                      value = "ProductType",
                      Product_Category_1, Product_Category_2, Product_Category_3)
view(friday_comb)

columns <- c("Product_Category_2", "Product_Category_3")

imputed_data <- mice(friday[,names(friday) %in% columns],
                     m=2,
                     maxit = 10,
                     method = "pmm",
                     seed = 42)

imputed_arg <- aregImpute(~Product_Category_2 + Product_Category_3, data = friday, n.impute = 5)



friday %>%
  mutate(friday, friday$Occupation == factor(friday$Occupation)) %>%
  mutate(friday, friday$Marital_Status == factor(friday$Marital_Status)) -> friday_f

friday_f <- mutate_at(friday, vars(unique(friday$Occupation)), as.factor)

str(friday)

a <- group_by(friday, Product_ID, Product_Category_1, Product_Category_2, Product_Category_3)

view(a)
# Todos al menos compraron un tipo de producto
nrow(filter(friday, is.na(friday$Product_Category_2) & is.na(friday$Product_Category_3) & is.na(friday$Product_Category_1)))

sd(friday$Purchase, na.rm = TRUE)

nrow(filter(friday, friday$Purchase == 0))

head(sort(Purchase, decreasing = TRUE))
tail(sort(Purchase, decreasing = TRUE))

mean(friday$Product_Category_2, na.rm = TRUE)

head(friday$Product_Category_2, 20)
length(unique(friday$Occupation))
unique(friday$Age)


?filter

sum(is.na(friday[,11]))
data1 <- friday[,1]
view(data1)
friday[is.na(friday$User_ID),]

# Propiedades del set de datos
summary(friday)
str(friday)

#Consistencia de los datos
#sum(is.na(friday))

require(tabplot)
tableplot(friday)

#Correlacion
#Mutate a nuevas columnas y evaluar la correlaciĂ³n
ggcorr(friday)

df1 <- data.frame(friday$Gender, friday$Age)
df1_tib <- as_tibble(df1)
view(df1_tib)

tableplot(df1)
ggcorr


##Limpieza de Datos

#Tema 1
#Missing data
friday.na <- c()
for(j in 1:length(friday)){
  v <- sum(is.na(friday[,j]))
  friday.na[j] <- v
}
friday.na

#Limpieza total
friday.cleaned <- na.omit(friday)

i#Ouliers

#Duplicate data



## Partición de Datos

set.seed(42) # semilla

train.size = dim(friday)[1] * 0.7 
train = sample(1:dim(friday)[1], train.size)
test = -train
datos.train = friday[train, ]
datos.test = friday[test, ]

