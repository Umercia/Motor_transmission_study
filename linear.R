library(ggplot2)
library(GGally)


ggpairs(data = mtcars)


summary(lm(mpg~am,data = mtcars))$coefficient

summary(lm(mpg~.,data = mtcars))$coefficient

summary(lm(mpg~ cyl + wt+am,data = mtcars))$coefficient


#ANOVA

fit1 <- lm(mpg ~wt, data = mtcars)
fit2 <- lm(mpg ~wt+cyl, data = mtcars)
fit3 <- lm(mpg ~wt+cyl+am, data = mtcars)
fit4 <- lm(mpg ~wt+cyl+am+disp, data = mtcars)
fit5 <- lm(mpg ~wt+cyl+disp+am+hp, data = mtcars)

anova(fit1,fit2,fit3,fit4,fit5)

# step-wise saerch using BIC
fit <- lm( mpg ~ cyl + disp + hp  + wt + am, data = mtcars)
step(fit, k = log(nrow(mtcars)))