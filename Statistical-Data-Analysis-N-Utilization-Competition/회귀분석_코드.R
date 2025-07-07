setwd('C:/Users/kim ji eun/Desktop/공모전 조지기/공모전_회귀분석 설명변수')
df<- read.csv('dfY_X최종1.csv',header=T,,fileEncoding = 'euc-kr')
head(df)
tail(df)

Y <- df[,1]
X1 <- df[,2]
X2 <- df[,3]
X3 <- df[,4]
X4 <- df[,5]
X5 <- df[,6]
X6 <- df[,7]
X7 <- df[,8]

#상관관계 구하기
df_cor<- cor(df)
df_cor
round(df_cor,2)


#히트맵 그리기
install.packages("ggcorrplot")
library(ggcorrplot)
ggcorrplot(df_cor)


#Full_model 모델 그리기
Full_model <- lm(Y ~ X1+ X2 +X3 +X4+X5+ X6 +X7)
summary(Full_model)


#full model에 대한 다중공선성
install.packages('car')
par(mfrow=c(2,2))
library("car")
vif(Full_model)

#Reduced model
Reduced_model<- lm(Y ~ X1+X2+ X4+ X6+ X7) #X3,X5제거한 모델
Reduced_model
summary(Reduced_model)

#reduced model에 대한 다중공선성
vif(Reduced_model)
par(mfrow=c(2,2))
plot(Reduced_model)

#인구통계학적 요인 model
Reduced_model123<-lm(Y ~X1 + X2 + X3)
plot(Reduced_model123)

#경제학적 요인 model
Reduced_model45 <- lm(Y ~ X4 + X5)
plot(Reduced_model45)

#환경적 요인 model
Reduced_model67 <- lm(Y ~ + X6 + X7)
plot(Reduced_model67)


#summary
summary(Reduced_model123)
summary(Reduced_model45)
summary(Reduced_model67)


#Y
Final_model <- lm(Y~X1+X2 +X4 +X6+X7)
par(mfrow=c(2,2))
plot(Final_model)
summary(Final_model)
Final_model

##############################################################################

#회귀모형의 선택

# SST, SSE, SSR
SST <- sum((df$'합계출산율'-mean(df$'합계출산율'))^2)
SSE <- sum(resid(Final_model)^2)
SSR <- SST-SSE

#PRESS
#SSE값
Final_model <- lm(sqrt(Y)~ X1 +X2 +X4 +X6+X7)
sum(resid(Final_model)^2)

#PRESS 값
press<- sum((resid(Final_model)/(1-hatvalues(Final_model)))^2)
press

# R2 vs R2_predic
1-(SSE/SST)
1-(press/SST)


Final_model

#표준화 회귀계수
#X1,X2,X4,X6,X7
Y_std <- (Y-mean(Y))/sqrt(sum((Y-mean(Y))^2))
X1_std <- (X1-mean(X1))/sqrt(sum((X1-mean(X1))^2))
X2_std <- (X2-mean(X2))/sqrt(sum((X2-mean(X2))^2))
#X3_std <- (X3-mean(X3))/sqrt(sum((X3-mean(X3))^2))
X4_std <- (X4-mean(X4))/sqrt(sum((X4-mean(X4))^2))
#X5_std <- (X5-mean(X5))/sqrt(sum((X5-mean(X5))^2))
X6_std <- (X6-mean(X6))/sqrt(sum((X6-mean(X6))^2))
X7_std <- (X7-mean(X7))/sqrt(sum((X7-mean(X7))^2))

model_std <- lm(Y_std ~ X1_std+ X2_std+X4_std + X6_std + X7_std)
summary(model_std)
model_std
options(scipen=999)
