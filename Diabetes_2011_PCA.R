health_indicators<-read.csv("/Users/alexahoynacke/Desktop/CWRUBootcamp/Final Project/2011_Updated.csv")
dim(health_indicators)

health_indicators = data.frame(health_indicators)

numerical_features = health_indicators[,c("HTM4","WTKG3","X_BMI5","X_FRUTSUM","X_VEGESUM")]

pca_result = prcomp(numerical_features, scale = TRUE)
dim(pca_results$x)
