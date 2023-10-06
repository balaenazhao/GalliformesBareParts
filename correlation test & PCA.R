library(corrplot)

############### pairwise correlation test ###########
data<- read.csv("sexually_selected_traits.csv",header=T,row.names = 1)
cor<- cor(data[,1:5],method = "spearman")
round(cor, 3)


data_env <- read.csv("environmental_variables.csv",header=T)
res <- cor(data_env[,5:16],method = "pearson")
round(res, 3)
corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)

response<- read.csv("responses_bare_parts.csv",header=T)
test<- cor(response[,2:7],method = "spearman")
round(test, 3)
corrplot(test, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)


############### PCA of environmental variables ###########
pca1<- prcomp(data_env[,3:5]) # altitude
pca2<- prcomp(data_env[,6:8]) # NDVI
pca3<- prcomp(data_env[,9:11]) # Solar
pca4<- prcomp(data_env[,12:14]) # temp


############### validation of data set ###########
Buchholz <- read.csv("Buchholz data.csv",header=T)
cor1<- cor.test(Buchholz[,4],Buchholz[,5],method = "spearman")
cor2<- cor.test(Buchholz[43:234,4],Buchholz[43:234,5],method = "spearman")
cor3<- cor.test(Buchholz[90:234,4],Buchholz[90:234,5],method = "spearman")

Smith <- read.csv("Smith data.csv",header=T)
cor1<- cor.test(Smith[,5],Smith[,7],method = "spearman")
cor2<- cor.test(Smith[1:30,5],Smith[1:30,7],method = "spearman")





