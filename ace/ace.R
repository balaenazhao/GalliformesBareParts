library(ape)
library(phytools)
library(nlme)
library(geiger)

tree<- read.tree(file="Galliformes_phylogeny.tre")
tree<- drop.tip(tree,"Anas_platyrhynchos", trim.internal = TRUE)
data<- read.csv("data_ace.csv",header=T,row.names = 1)

size_change <- setNames(data[,"SIZE_CHANGE"],rownames(data))
SC_ER<-ace(size_change,tree,model="ER",type="discrete")
SC_SYM<-ace(size_change,tree,model="SYM",type="discrete")
SC_ARD<-ace(size_change,tree,model="ARD",type="discrete")
SC_ER$loglik
SC_SYM$loglik
SC_ARD$loglik  ##### best

SC_SIM <- make.simmap(tree,size_change,model="ARD",nsim=100)
SC<- summary(SC_SIM,plot=FALSE)
