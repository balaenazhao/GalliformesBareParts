male_OU1<- gls(Male ~ Altitude+NDVI+Solar+Temp+ParentalCare
               +Plumage_dim_sum+MatingSystem+BSD,
               correlation=corMartins(1,phy=tree),data=data_scale, method="ML")
summary(male_OU1)
male_OU2<- gls(Male ~ Altitude+NDVI+Solar+Temp+ParentalCare
               +Plumage_dim_sum+MatingSystem+BSD,
               correlation=corMartins(1,phy=tree2),data=data2_scale, method="ML")
summary(male_OU2)
male_OU3<- gls(Male ~ Altitude+NDVI+Solar+Temp+ParentalCare
               +Plumage_dim_sum+MatingSystem+BSD,
               correlation=corMartins(1,phy=phasianidae),data=data_phas_scale, method="ML")
summary(male_OU3)
male_OU4<- gls(Male ~ Altitude+NDVI+Solar+Temp+ParentalCare
               +Plumage_dim_sum+MatingSystem+BSD,
               correlation=corMartins(1,phy=tree3),data=data3_scale, method="ML")
summary(male_OU4)


female_OU1<- gls(Female ~ Altitude+NDVI+Solar+Temp+ParentalCare
                 +Plumage_dim_sum+MatingSystem+BSD,
                 correlation=corMartins(1,phy=tree),data=data_scale, method="ML")
summary(female_OU1)
female_OU2<- gls(Female ~ Altitude+NDVI+Solar+Temp+ParentalCare
                 +Plumage_dim_sum+MatingSystem+BSD,
                 correlation=corMartins(1,phy=tree2),data=data2_scale, method="ML")
summary(female_OU2)
female_OU3<- gls(Female ~ Altitude+NDVI+Solar+Temp+ParentalCare
                 +Plumage_dim_sum+MatingSystem+BSD,
                 correlation=corMartins(1,phy=phasianidae),data=data_phas_scale, method="ML")
summary(female_OU3)
female_OU4<- gls(Female ~ Altitude+NDVI+Solar+Temp+ParentalCare
                 +Plumage_dim_sum+MatingSystem+BSD,
                 correlation=corMartins(1,phy=tree3),data=data3_scale, method="ML")
summary(female_OU4)


dimor_OU1<- gls(Dimor ~ Altitude+NDVI+Solar+Temp+ParentalCare
                +Plumage_dim_sum+MatingSystem+BSD,
                correlation=corMartins(1,phy=tree),data=data_scale, method="ML")
summary(dimor_OU1)
dimor_OU2<- gls(Dimor ~ Altitude+NDVI+Solar+Temp+ParentalCare
                +Plumage_dim_sum+MatingSystem+BSD,
                correlation=corMartins(1,phy=tree2),data=data2_scale, method="ML")
summary(dimor_OU2)
dimor_OU3<- gls(Dimor ~ Altitude+NDVI+Solar+Temp+ParentalCare
                +Plumage_dim_sum+MatingSystem+BSD,
                correlation=corMartins(1,phy=phasianidae),data=data_phas_scale, method="ML")
summary(dimor_OU3)
dimor_OU4<- gls(Dimor ~ Altitude+NDVI+Solar+Temp+ParentalCare
                +Plumage_dim_sum+MatingSystem+BSD,
                correlation=corMartins(1,phy=tree3),data=data3_scale, method="ML")
summary(dimor_OU4)


SizeChange_OU1<- gls(SizeChange ~ Altitude+NDVI+Solar+Temp+ParentalCare
                     +Plumage_dim_sum+MatingSystem+BSD,
                     correlation=corMartins(1,phy=tree),data=data_scale, method="ML")
summary(SizeChange_OU1)
SizeChange_OU2<- gls(SizeChange ~ Altitude+NDVI+Solar+Temp+ParentalCare
                     +Plumage_dim_sum+MatingSystem+BSD,
                     correlation=corMartins(1,phy=tree2),data=data2_scale, method="ML")
summary(SizeChange_OU2)
SizeChange_OU3<- gls(SizeChange ~ Altitude+NDVI+Solar+Temp+ParentalCare
                     +Plumage_dim_sum+MatingSystem+BSD,
                     correlation=corMartins(1,phy=phasianidae),data=data_phas_scale, method="ML")
summary(SizeChange_OU3)
SizeChange_OU4<- gls(SizeChange ~ Altitude+NDVI+Solar+Temp+ParentalCare
                     +Plumage_dim_sum+MatingSystem+BSD,
                     correlation=corMartins(1,phy=tree3),data=data3_scale, method="ML")
summary(SizeChange_OU4)
