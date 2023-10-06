setwd("/Users/balaena/Downloads/postdoc/GalliformesFS/resubmission/rerun/")
library(ape)
library(phytools)
library(nlme)
library(geiger)
library(vegan)
library(ggplot2)
library(dplyr)
library(dotwhisker)

###################################################################################
################# generate dataset and associated tree ############################
tree<- read.tree(file="Galliformes_phylogeny.tre")
tree<- drop.tip(tree,"Anas_platyrhynchos", trim.internal = TRUE)
data <- read.csv("comparative_analyses.csv",header=T,row.names = 1)
is.rooted(tree)
name.check(tree,data)

#### normalized data ####
data_scale<- data %>% mutate_at(c("Altitude", "Plumage_dim_sum","BSD","NDVI","Solar","Temp","ParentalCare"), ~(scale(.) %>% as.vector))

#### generate Phasianidae tree and data ####
getMRCA(tree, tip = c("Lerwa_lerwa", "Caloperdix_oculeus"))
phasianidae <- extract.clade(tree, node=318, root.edge = 1e-6)
data_phas <- data[105:264,]
name.check(phasianidae,data_phas)
is.rooted(phasianidae)
data_phas_scale<- data_phas %>% mutate_at(c("Altitude", "Plumage_dim_sum","BSD","NDVI","Solar","Temp","ParentalCare"), ~(scale(.) %>% as.vector))
name.check(phasianidae,data_phas_scale)

#### generate data and tree that remove two sage grouse ####
sage<- c("Centrocercus_urophasianus","Centrocercus_minimus")
tree2<- drop.tip(tree,sage, trim.internal = TRUE)
data2<- data[!(row.names(data) %in% sage),]
is.rooted(tree2)
data2_scale<- data2 %>% mutate_at(c("Altitude", "Plumage_dim_sum","BSD","NDVI","Solar","Temp","ParentalCare"), ~(scale(.) %>% as.vector))
name.check(tree2,data2_scale)

tree3<- drop.tip(phasianidae,sage, trim.internal = TRUE)
data3<- data_phas[!(row.names(data_phas) %in% sage),]
is.rooted(tree3)
data3_scale<- data3 %>% mutate_at(c("Altitude", "Plumage_dim_sum","BSD","NDVI","Solar","Temp","ParentalCare"), ~(scale(.) %>% as.vector))
name.check(tree3,data3_scale)

source("forest plot.R")

# galliformes all data
dwplot(list(male_OU1,female_OU1,dimor_OU1,SizeChange_OU1))
# phasianidae all data
dwplot(list(male_OU3,female_OU3,dimor_OU3,SizeChange_OU3))
# galliformes sage grouse removed
dwplot(list(male_OU2,female_OU2,dimor_OU2,SizeChange_OU2))
# phasianidae sage grouse removed
dwplot(list(male_OU4,female_OU4,dimor_OU4,SizeChange_OU4))


###################################################################################
##################### running PGLS on different models ############################
source("PGLS_Galliformes.r")
source("PGLS_Phasianidae.r")


############## run PGLS on size change, exclude ones without bare part ############
source(file="noBarePart.txt")
data_BP <- data[data$erect != "No_FS",]
BPtree<- drop.tip(tree,noBarePart,trim.internal = TRUE)
is.rooted(BPtree)
name.check(BPtree,data_BP)

phas_BP <- data_BP[data_BP$group == "Phasianidae",]
source(file="BP_nophas.txt")
BP_phas_tree <- drop.tip(BPtree,nophas,trim.internal = TRUE)
is.rooted(BP_phas_tree)
name.check(BP_phas_tree,phas_BP)

data2_BP <- data2[data2$erect != "No_FS",]
BPtree2<- drop.tip(tree2,noBarePart,trim.internal = TRUE)
is.rooted(BPtree2)
name.check(BPtree2,data2_BP)

phas2_BP <- data3[data3$group == "Phasianidae",]
source(file="BP_nophas.txt")
phas2_tree <- drop.tip(tree3,nophas,trim.internal = TRUE)
is.rooted(phas2_tree)
name.check(phas2_tree,phas2_BP)

source(file="PGLS_sizeChange.R")






