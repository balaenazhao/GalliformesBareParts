size_change <- setNames(data[,"SIZE_CHANGE"],rownames(data))
SC_ER<-ace(size_change,tree,model="ER",type="discrete")
SC_SYM<-ace(size_change,tree,model="SYM",type="discrete")
SC_ARD<-ace(size_change,tree,model="ARD",type="discrete")
SC_ER$loglik
SC_SYM$loglik
SC_ARD$loglik  ##### best

MaleMax <- setNames(data[,"Male_FS"],rownames(data))
MM_ER<-ace(MaleMax,tree,model="ER",type="discrete")
MM_SYM<-ace(MaleMax,tree,model="SYM",type="discrete")
MM_ARD<-ace(MaleMax,tree,model="ARD",type="discrete")
MM_ER$loglik
MM_SYM$loglik
MM_ARD$loglik 

MaleFlaccid <- setNames(data[,"flaccidFS"],rownames(data))
MF_ER<-ace(MaleFlaccid,tree,model="ER",type="discrete")
MF_SYM<-ace(MaleFlaccid,tree,model="SYM",type="discrete")
MF_ARD<-ace(MaleFlaccid,tree,model="ARD",type="discrete")
MF_ER$loglik
MF_SYM$loglik
MF_ARD$loglik 

Female <- setNames(data[,"Female_FS"],rownames(data))
Female_ER<-ace(Female,tree,model="ER",type="discrete")
Female_SYM<-ace(Female,tree,model="SYM",type="discrete")
Female_ARD<-ace(Female,tree,model="ARD",type="discrete")
Female_ER$loglik
Female_SYM$loglik
Female_ARD$loglik 

Dimor_Max <- setNames(data[,"DIMOR_MF"],rownames(data))
DM_ER<-ace(Dimor_Max,tree,model="ER",type="discrete")
DM_SYM<-ace(Dimor_Max,tree,model="SYM",type="discrete")
DM_ARD<-ace(Dimor_Max,tree,model="ARD",type="discrete")
DM_ER$loglik
DM_SYM$loglik
DM_ARD$loglik 

Dimor_flaccid <- setNames(data[,"DIMOR_flaccid"],rownames(data))
DF_ER<-ace(Dimor_flaccid,tree,model="ER",type="discrete")
DF_SYM<-ace(Dimor_flaccid,tree,model="SYM",type="discrete")
DF_ARD<-ace(Dimor_flaccid,tree,model="ARD",type="discrete")
DF_ER$loglik
DF_SYM$loglik
DF_ARD$loglik 

protrusion <- setNames(data[,"protrusion"],rownames(data))
PR_ER<-ace(protrusion,tree,model="ER",type="discrete")
PR_SYM<-ace(protrusion,tree,model="SYM",type="discrete")
PR_ARD<-ace(protrusion,tree,model="ARD",type="discrete")
PR_ER$loglik
PR_SYM$loglik
PR_ARD$loglik 
