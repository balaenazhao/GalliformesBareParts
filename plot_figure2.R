library(ape)
library(ggnewscale)
library(ggtree)
library(geiger)
library(ggplot2)

tree<- read.tree(file="Galliformes_phylogeny.tre")
tree<- drop.tip(tree,"Anas_platyrhynchos", trim.internal = TRUE)
data <- read.csv("plot figure2 data.csv",header=T,row.names = 1)
is.rooted(tree)
name.check(tree,data)

male_size <- as.matrix(data[,1])
rownames(male_size) <- rownames(data)
colnames(male_size)[1] <- "male_size"
col_male<- c("#eff3ff","#bdd7e7","#6baed6","#3182bd","#08519c")
breaks_male<- c("I","II","III","IV","V")

female_size <- as.matrix(data[,2])
rownames(female_size) <- rownames(data)
colnames(female_size)[1] <- "female_size"
col_female<- c("#feedde","#fdbe85","#fd8d3c","#d94701")
breaks_female<- c("I","II","III","IV")

dimorphism <- as.matrix(data[,3])
rownames(dimorphism) <- rownames(data)
colnames(dimorphism)[1] <- "dimorphism"
col_dimor<- c("#fcfbfd","#f2f0f7","#cbc9e2","#756bb1","#54278f")
breaks_dimor<- c("NI","Z","I","II","III")

size_change <- as.matrix(data[,4])
rownames(size_change) <- rownames(data)
colnames(size_change)[1] <- "size_change"
col_change<- c("#edf8e9","#c7e9c0","#a1d99b","#74c476","#41ab5d","#238b45","#005a32")
breaks_change<- c("I","I1.5","II","IV","V","VI","X")


circ <- ggtree(tree)
p1 <- gheatmap(circ, male_size, offset=0.02, width=.1, colnames = FALSE) +
  scale_color_manual(values = col_male, breaks = breaks_male) +
  scale_fill_manual(values = col_male, breaks = breaks_male,name="Male size", na.value = "light grey") 

p2 <- p1 + new_scale_fill()
p3 <- gheatmap(p2, female_size, offset=0.12, width=.1,colnames = FALSE) +
  scale_color_manual(values = col_female, breaks = breaks_female) +
  scale_fill_manual(values = col_female, breaks = breaks_female,name="Female size", na.value = "light grey") 

p4 <- p3 + new_scale_fill()
p5 <- gheatmap(p4, dimorphism, offset=0.22, width=.1,colnames = FALSE) +
  scale_color_manual(values = col_dimor, breaks = breaks_dimor) +
  scale_fill_manual(values = col_dimor, breaks = breaks_dimor,name="Sexual dimorphism", na.value = "light grey") 

p6 <- p5 + new_scale_fill()
p7 <- gheatmap(p6, size_change, offset=0.32, width=.1,colnames = FALSE) +
  scale_color_manual(values = col_change, breaks = breaks_change) +
  scale_fill_manual(values = col_change, breaks = breaks_change,name="Male size change", na.value = "light grey") 
p7
