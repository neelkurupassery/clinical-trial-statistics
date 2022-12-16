library(PowerTOST)

# Geometric ratio for relevant paramters (AUC, Cmax)
sampleN.TOST(alpha = 0.05, targetpower = 0.9, logscale = TRUE,
             theta0 = 1, theta1 = 0.8, theta2 = 1.25,
             CV = 0.3, design = '2x2', method = 'exact')

# +++++++++++ Equivalence test - TOST +++++++++++
#   Sample size estimation
# -----------------------------------------------
#   Study design: 2x2 crossover 
# log-transformed data (multiplicative model)
# 
# alpha = 0.05, target power = 0.9
# BE margins = 0.8 ... 1.25 
# True ratio = 1,  CV = 0.3
# 
# Sample size (total)
# n     power
# 40   0.909560 

## Difference in Means Test 
sampleN.TOST(alpha = 0.05, targetpower = 0.9, logscale = F,
                           theta0 = .1, theta1 = -0.25, theta2 = 0.25,
                           CV = 0.3, design = '2x2', method = 'exact')

# +++++++++++ Equivalence test - TOST +++++++++++
#   Sample size estimation
# -----------------------------------------------
#   Study design: 2x2 crossover 
# untransformed data (additive model)
# 
# alpha = 0.05, target power = 0.9
# BE margins = -0.25 ... 0.25 
# True diff. = 0.1,  CV = 0.3
# 
# Sample size (total)
# n     power
# 70   0.900351 


known.designs()
# no   design    df df2 steps  bk bknif       bkni                        name
# 1    0 parallel   n-2 n-2     2 4.0   1/1 1.00000000           2 parallel groups
# 2    1      2x2   n-2 n-2     2 2.0   1/2 0.50000000               2x2 crossover
# 3    1    2x2x2   n-2 n-2     2 2.0   1/2 0.50000000             2x2x2 crossover
# 4    2      3x3 2*n-4 n-3     3 2.0   2/9 0.22222222               3x3 crossover
# 5    3    3x6x3 2*n-4 n-6     6 2.0  1/18 0.05555556             3x6x3 crossover
# 6    4      4x4 3*n-6 n-4     4 2.0   1/8 0.12500000               4x4 crossover
# 7    5    2x2x3 2*n-3 n-2     2 1.5   3/8 0.37500000   2x2x3 replicate crossover
# 8    6    2x2x4 3*n-4 n-2     2 1.0   1/4 0.25000000   2x2x4 replicate crossover
# 9    7    2x4x4 3*n-4 n-4     4 1.0  1/16 0.06250000   2x4x4 replicate crossover
# 10   9    2x3x3 2*n-3 n-3     3 1.5   1/6 0.16666667   partial replicate (2x3x3)
# 11  10    2x4x2   n-2 n-2     4 8.0   1/2 0.50000000            Balaam's (2x4x2)
# 12  11   2x2x2r 3*n-2 n-2     2 1.0   1/4 0.25000000 Liu's 2x2x2 repeated x-over
# 13 100   paired   n-1 n-1     1 2.0   2/1 2.00000000                paired means

