library(cluster)
library(factoextra)
library(tidyverse)
df = USArrests
?USArrests
head(df)
str(df)
library(psych)
quickView(df)
df = na.omit(df)
str(df)
distance = get_dist(df)
?get_dist
fviz_dist(distance, gradient = list(low = "red", mid= "white", high ="blue"))
View(df)
k2 = kmeans(df, centers = 2, nstart = 25)
str(k2)
fviz_cluster(k2, data = df)
?kmeans
k3 = kmeans(df, centers = 3, nstart = 25)
fviz_cluster(k3 , data= df)
p1 = fviz_cluster(k2, geom = "point" , data = df)+ ggtitle("k=2")
p1
library(gridExtra)
p2 = fviz_cluster(k3, geom = "point" , data = df)+ ggtitle("k=3")
p2
grid.arrange(p1,p2)
set.seed(123)
fviz_nbclust(df, kmeans,method =  "wss")
fviz_nbclust(df, kmeans,method =  "silhouette")
final  =kmeans(df, 4 , nstart = 25)
final



#new 
us_arrests = USArrests
sus_arrests = scale(us_arrests)
?scale
View(us_arrests)
sus_arrests
summary(sus_arrests)
dist_data = dist(sus_arrests , method = "euclidean")
hdata = hclust(dist_data, "complete")
plot(hdata)
abline(h=3.8, lty =2)
kus_arrests= kmeans(sus_arrests , centers = 4, nstart = 50)
plot(x= sus_arrests[,1],y= sus_arrests[,2], col = kus_arrests$cluster)
library(cluster)
clusplot(sus_arrests, kus_arrests$cluster, color = T, labels = 2, main =  "cluster plot")

pamus_arrests = pam(sus_arrests ,4)
clusplot(sus_arrests,pamus_arrests$clustering, color = T, labels = 2, main =  "cluster plot")
