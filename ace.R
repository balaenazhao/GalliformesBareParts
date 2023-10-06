setwd("/Users/balaena/Downloads/postdoc/GalliformesFS/running/Ancestral reconstructions/")
library(ape)
library(phytools)
library(nlme)
library(geiger)

tree<- read.tree(file="../21Sep20_chrono_gall_cor.new")
tree<- drop.tip(tree,"Anas_platyrhynchos", trim.internal = TRUE)
data<- read.csv("data_ace.csv",header=T,row.names = 1)

##### continuous trait mapping
MM <- data$Male_FS
names(MM) <- rownames(data)
MM_bm <- anc.ML(tree, MM, 100, "BM")
MM_eb <- anc.ML(tree, MM, 100, "EB")
MM_ou <- anc.ML(tree, MM, 100, "OU")
MM_bm$logLik
MM_eb$logLik
sink("MM_output.txt")
print(MM_bm)
print(MM_eb)
print(MM_OU)
sink()

MF <- data$flaccidFS
names(MF) <- rownames(data)
MF_bm <- anc.ML(tree, MF, 100, "BM")
MF_eb <- anc.ML(tree, MF, 100, "EB")
MF_bm$logLik
MF_eb$logLik
MF_ou <- anc.ML(tree, MF, 100, "OU")
sink("MF_output.txt")
print(MF_bm)
print(MF_eb)
print(MF_OU)
sink()

FF <- data$Female_FS
names(FF) <- rownames(data)
FF_bm <- anc.ML(tree, FF, 100, "BM")
FF_eb <- anc.ML(tree, FF, 100, "EB")
FF_bm$logLik
FF_eb$logLik
FF_ou <- anc.ML(tree, FF, 100, "OU")
sink("FF_output.txt")
print(FF_bm)
print(FF_eb)
print(FF_OU)
sink()

SDMax <- data$DIMOR_MF
names(SDMax) <- rownames(data)
SDMax_bm <- anc.ML(tree, SDMax, 100, "BM")
SDMax_eb <- anc.ML(tree, SDMax, 100, "EB")
SDMax_bm$logLik
SDMax_eb$logLik
SDMax_ou <- anc.ML(tree, SDMax, 100, "OU")
sink("SDMax_output.txt")
print(SDMax_bm)
print(SDMax_eb)
print(SDMax_OU)
sink()

SDfla <- data$DIMOR_flaccid
names(SDfla) <- rownames(data)
SDfla_bm <- anc.ML(tree, SDfla, 100, "BM")
SDfla_eb <- anc.ML(tree, SDfla, 100, "EB")
SDfla_bm$logLik
SDfla_eb$logLik
SDfla_ou <- anc.ML(tree, SDfla, 100, "OU")
sink("SDfla_output.txt")
print(SDfla_bm)
print(SDfla_eb)
print(SDfla_OU)
sink()

SC <- data$SIZE_CHANGE
names(SC) <- rownames(data)
SC_bm <- anc.ML(tree, SC, 100, "BM")
SC_eb <- anc.ML(tree, SC, 100, "EB")
SC_bm$logLik
SC_eb$logLik
SC_ou <- anc.ML(tree, SC, 100, "OU")
sink("SC_output.txt")
print(SC_bm)
print(SC_eb)
print(SC_OU)
sink()

sink("EB_output.txt")
print(MM_eb)
print(MF_eb)
print(FF_eb)
print(SDMax_eb)
print(SDfla_eb)
print(SC_eb)
sink()


# continuous, done, try marginal reconstruction on discrete data

source(file="fitdata.R") ### ace marginal reconstruction
1-pchisq(2*abs(SC_ARD$loglik - SC_SYM$loglik), 1)
1-pchisq(2*abs(MM_ARD$loglik - MM_SYM$loglik), 1)
1-pchisq(2*abs(MF_ARD$loglik - MF_SYM$loglik), 1)
1-pchisq(2*abs(Female_ARD$loglik - Female_SYM$loglik), 1)
1-pchisq(2*abs(DM_ARD$loglik - DM_SYM$loglik), 1)
1-pchisq(2*abs(DF_ARD$loglik - DF_SYM$loglik), 1)
1-pchisq(2*abs(PR_ARD$loglik - PR_SYM$loglik), 1)


SC_SIM <- make.simmap(tree,size_change,model="ARD",nsim=100)
SC<- summary(SC_SIM,plot=FALSE)
MM_SIM <- make.simmap(tree,MaleMax,model="ARD",nsim=100)
MM<- summary(MM_SIM,plot=FALSE)
MF_SIM <- make.simmap(tree,MaleFlaccid,model="ARD",nsim=100)
MF<- summary(MF_SIM,plot=FALSE)
FF_SIM <- make.simmap(tree,Female,model="ARD",nsim=100)
FF<- summary(FF_SIM,plot=FALSE)
DM_SIM <- make.simmap(tree,Dimor_Max,model="ARD",nsim=100)
DM<- summary(DM_SIM,plot=FALSE)
DF_SIM <- make.simmap(tree,Dimor_flaccid,model="ARD",nsim=100)
DF<- summary(DF_SIM,plot=FALSE)
PR_SIM <- make.simmap(tree,protrusion,model="ARD",nsim=100)
PR<- summary(PR_SIM,plot=FALSE)


DM_ARD$lik.anc #### marginal ancestral states, aka the 'empirical Bayesian posterior probabilities.'
PR$ace #### probabilities obtained by sampling from the joint (rather than marginal) probability distribution for the ancestral states


### get node number for each family
getMRCA(tree, tip = c("Megapodius_tenimberensis", "Leipoa_ocellata")) # Megapoiidae 266
getMRCA(tree, tip = c("Lerwa_lerwa", "Caloperdix_oculeus")) # Phasianidae 318
getMRCA(tree, tip = c("Ptilopachus_petrosus", "Odontophorus_guttatus")) # Odontiphoridae 287
getMRCA(tree, tip = c("Numida_meleagris", "Agelastes_niger")) # Numididae 477
getMRCA(tree, tip = c("Pipile_pipile", "Ortalis_guttata")) # Cracidae 482
getMRCA(tree, tip = c("Megapodius_tenimberensis", "Lerwa_lerwa")) # Galliformes 265
phasianidae <- extract.clade(tree, node=318, root.edge = 1e-6)
Megapoiidae <- extract.clade(tree, node=266, root.edge = 1e-6)
Odontiphoridae <- extract.clade(tree, node=287, root.edge = 1e-6)
Numididae <- extract.clade(tree, node=477, root.edge = 1e-6)
Cracidae <- extract.clade(tree, node=482, root.edge = 1e-6)

