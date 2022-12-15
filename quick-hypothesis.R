# Lots of basic hypothesis testing in base R
set.seed(5)
a = rnorm(100,75,3)
b = rnorm(100,76,3)
c = rnorm(100,74,3)

t.test(a,mu=5) # One Sample
t.test(a,b) # Two Sample
t.test(c(1:50),c(2:51),mu=1) # Changing Alternate hypothesis

t.test(x,c(y,5),paired=T) # 2 group paired

summary(aov(a~b,data.frame(a,b,c))) # anova
summary(aov(a~b+c,data.frame(a,b,c))) # two way

x = c(8, 7, 8, 4, 5, 6, 9)
y = c(5, 9, 4, 6, 4, 9)

wilcox.test(x,y) # rank sum
wilcox.test(x,c(y,5),paired=T) # signed rank

z1 = data.frame(c(rep(6,5),rep(6.3,5),rep(6.6,5)))
z2 = matrix(c(6,1,4,3), nrow = 2)

chisq.test(z2) # chi sq
fisher.test(z2) # fisher exact

chisq.test(c(1,2,3,4),p = c(10,23,33,41),rescale.p=T)

mcnemar.test(z2)

prop.test(542,1000,.5) #1p
binom.test(542,1000,.5) #exact
prop.test(z2,p=c(.5,.4)) #2p
