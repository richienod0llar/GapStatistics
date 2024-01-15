#load the dataset
df1 <- rock
#take out nulll values-
df1 <- na.omit(df1)
#scale/standardize the data
df1 <- scale(df1)


library(cluster)
library(factoextra)
#calculate the distance 
distance1 <- get_dist(df1)
fviz_dist(distance1, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))


#computing Gap Statistic 
set.seed(123)
gap_stat1 <- clusGap(df1, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)

#printing the result
print(gap_stat1, method = "firstmax")
#plotting the gap statistic
fviz_gap_stat(gap_stat1)

#extract the results 
set.seed(123)
final <- kmeans(df1, 2, nstart = 25)
print(final)

#visualize the final result
fviz_cluster(final, data = df1)
