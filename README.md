# Comparative Analysis for Bare Parts in Galliformes
R scripts and relevant data that were used for the study *Bare parts in the Galliformes: the evolution of a multifunctional structure*

## Correlation Tests
The CorrelationTests folder contains R scripts **correlation test & PCA.R** and data file to perform Pearson/Spearman correlation tests.
### Test auto-correlation among variables
Since some variables may be highly correlated with each other, we performed pairwise correlation tests for the predictor and responses variables.
### Validation of bare part scores
We validated our bare part size scores by comparing them with two independent datasets (Smith 2014 & Buchholz 1991).

## Phylogenetic Generalized Least Squares (PGLS)
The PGLS folder contains the scripts for running individual PGLS models for Galliformes and Phasianidae. The main working project **comparative_analyses.R** reads in the Galliformes phylogeny, prunes the outgroup tip and transforms the phylogeny to a ultrametric tree. It also creates subsets for Phasianidae, Galliformes excluding sage-grouse, Phasianidae excluding sage-grouse, and the datasets that excludes species without bare parts.
The current scripts **PGLS_Phasianidae.r** and **PGLS_Galliformes.r** are for the response variable Sexual Dimorphism. For running the same tests for Male Size and Female Size, just replace "Dimor" with "Male" and "Female" respectively.
For Male Size Change, because we removed the species without bare parts from the dataset, it's been running in a separate file **PGLS_sizeChange.R**. We listed the species that have no bare part in **noBarePart.txt**, and the non-Phasianidae species that have bare part in **BP_nophas.txt**.

## Ancestral State Reconstruction (ace)
The ace folder containts scripts for running ancestral state reconstruction for four response variables.

## Plotting figures (Figure)
The Figure folder has scripts for plotting out Figure 2 (Galliformes phylogeny with four response variables mapped onto the tree), Figure 3 (histgrams for male and female sizes in Phasianidae and non-Phasianidae species), Figure 4 (effect sizes of each predictor predicting a bare part trait in the full PGLS model for Galliformes and Phasianidae), and Figure 5 (scatter plot of male size change vs. altitude). These scripts should be accessed through the main working project **comparative_analyses.R** so that the phylogeny and data used will be available for plotting.
