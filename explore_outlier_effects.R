library(ape)
library(phytools)
library(nlme)
library(geiger)
library(mvMORPH)
library(vegan)
library(ggplot2)
library(ggfortify)
library(gridExtra)

tree<- read.tree(file="Galliformes_phylogeny.tre")


######### data with grouses, species without bare parts dropped ########
tree<- drop.tip(tree,"Anas_platyrhynchos", trim.internal = TRUE)
data<- read.csv("comparative_analyses.csv",header=T,row.names = 1)
name.check(tree,data)
source(file="noBarePart.txt")
data_BP <- data[data$erect != "No_FS",]
BPtree<- drop.tip(tree,noBarePart,trim.internal = TRUE)
is.rooted(BPtree)
name.check(BPtree,data_BP)

source(file="BP_nophas.txt")
phas_BP <- data_BP[data_BP$group == "Phasianidae",]
BP_phas_tree <- drop.tip(BPtree,nophas,trim.internal = TRUE)
is.rooted(BP_phas_tree)
name.check(BP_phas_tree,phas_BP)


########## plot distribution #########

p1<- ggplot(data_BP,aes(x=Altitude,y=SizeChange,color=data_BP$outlier)) +
  geom_point(position=position_jitter(h=0.2),alpha =1, size = 4) 
alt<- p1 + scale_color_manual(values=c("#B2182B", "#FF7F00", "#F4A582", 'pink2', "#A6CEE3",'#965F8A',"#B2DF8A",  "#2166AC"))

p2<- ggplot(data_BP,aes(x=Temp,y=SizeChange,color=data_BP$outlier)) + 
  geom_point(position=position_jitter(h=0.2),alpha = 1, size = 4)
tem<- p2 + scale_color_manual(values=c("#B2182B", "#FF7F00", "#F4A582", 'pink2', "#A6CEE3",'#965F8A',"#B2DF8A",  "#2166AC"))

p3<- ggplot(data_BP,aes(x=Solar,y=SizeChange,color=data_BP$outlier)) + 
  geom_point(position=position_jitter(h=0.2),alpha = 1, size = 4)
sol<- p3 + scale_color_manual(values=c("#B2182B", "#FF7F00", "#F4A582", 'pink2', "#A6CEE3",'#965F8A',"#B2DF8A",  "#2166AC"))

pdf(file = "alt.pdf", width = 6, height = 4)
alt
dev.off()

pdf(file = "tem.pdf", width = 6, height = 4)
tem
dev.off()

pdf(file = "sol.pdf", width = 6, height = 4)
sol
dev.off()


