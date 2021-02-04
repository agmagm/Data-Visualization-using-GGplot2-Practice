#load package and data set
library(dplyr)
library(ggplot2)

mydata <- read.csv("conidia_length.csv")
View(mydata)# you can see the  strange numeric in strains, so we can remove using fileEncoding = 'UTF-8-BOM'#

mydata <- read.csv("conidia_length.csv",fileEncoding = 'UTF-8-BOM')

dim(mydata)
class(mydata)
glimpse(mydata)
list(mydata$Strains)
class(mydata$Strains)
levels(mydata$Strains)


#change Species "chr" to factor,
mydata$Strains <- as.factor(mydata$Strains) 

#create plot
testplot <-ggplot(mydata,aes(x=Strains,y=Conidia.Length))+
  geom_point(aes(color=Strains),size=1,alpha=1)

#add boxplot
testplot+geom_boxplot(alpha=0.1)

#add axis line,remove background, order item variable in line x
testplot+geom_boxplot(alpha=0.1)+ theme(axis.line=element_line(),
                                        panel.background = element_blank())+
  scale_x_discrete(limits=c("wt","m1","m3","m4","m8","m9","m13","m17","m18"))

##Exercise1## reordering items in legend wt,m1,m3,m4,m8,m9,m13,m17,18 

##Exercise2## remaking bacground and panel gridline

#Exercise3## making title in plot"

#save your plot
ggsave("plot.tiff", width=10, height=10, units="cm",dpi=300)