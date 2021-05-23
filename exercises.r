# Exercise 1
randomNumber <- sample(0:101, 1, replace=FALSE)
humanInput <- -1
numberOfGuesses <- 1

while (randomNumber != humanInput) {
    humanInput <- readline("Guess my number! ")  
    humanInput <- as.numeric(humanInput)

    # Error handling
    if (is.na(humanInput)) {
        humanInput <- 0
        print("You just hit the Return key! Assuming you've meant 0.")
    }
  
    if (humanInput == randomNumber) {
        message(sprintf("You guessed it! It took you %s guesses. Highscore was 1 so far! :)", numberOfGuesses))
        break
    } else if (humanInput < randomNumber) {
        print("Your number is too low.")
    } else if (humanInput > randomNumber) {
        print("Your number is too high.")
    }
    numberOfGuesses = numberOfGuesses + 1
}

# Exercise 2
# Analyse the esoph dataset. Can you derive some useful statements 
# from it? Use data() to see all available datasets.

# import tidyverse package
library(tidyverse)

# Show all datasets
data()

# Summary of esoph dataset 
summary(esoph)

# effects of alcohol, tobacco and interaction, age-adjusted
# Source: https://stat.ethz.ch/R-manual/R-patched/library/datasets/html/esoph.html
glm(cbind(ncases, ncontrols) ~ agegp + tobgp * alcgp,
              data = esoph, family = binomial())
anova(model1)


esoph %>% 
    group_by("Age group" = agegp) %>% 
    summarise(Number = n(), Cases = sum(ncases), Controls = sum(ncontrols), Share = (Cases/Controls)*100) %>% 
    View()
# A tibble: 6 x 5
#   `Age group` Number Cases Controls  Share
#   <ord>        <int> <dbl>    <dbl>  <dbl>
# 1 25-34           15     1      115  0.870
# 2 35-44           15     9      190  4.74 
# 3 45-54           16    46      167 27.5  
# 4 55-64           16    76      166 45.8  
# 5 65-74           15    55      106 51.9  
# 6 75+             11    13       31 41.9 


esoph %>% 
    group_by("Age group" = agegp, "Tobacco consumption group" = tobgp) %>% 
    summarise(Number = n(), Cases = sum(ncases), Controls = sum(ncontrols), Share = (Cases/Controls)*100)  %>% 
    View()
# A tibble: 24 x 6
# Groups:   Age group [6]
#    `Age group` `Tobacco consumption group` Number Cases Controls  Share
#    <ord>       <ord>                        <int> <dbl>    <dbl>  <dbl>
#  1 25-34       0-9g/day                         4     0       70   0   
#  2 25-34       10-19                            4     1       18   5.56
#  3 25-34       20-29                            3     0       11   0   
#  4 25-34       30+                              4     0       16   0   
#  5 35-44       0-9g/day                         4     2      107   1.87
#  6 35-44       10-19                            4     4       42   9.52
#  7 35-44       20-29                            4     3       24  12.5 
#  8 35-44       30+                              3     0       17   0   
#  9 45-54       0-9g/day                         4    14       90  15.6 
# 10 45-54       10-19                            4    13       44  29.5 
# 11 45-54       20-29                            4     8       25  32   
# 12 45-54       30+                              4    11        8 138.  
# 13 55-64       0-9g/day                         4    25       92  27.2 
# 14 55-64       10-19                            4    23       42  54.8 
# 15 55-64       20-29                            4    12       26  46.2 
# 16 55-64       30+                              4    16        6 267.  
# 17 65-74       0-9g/day                         4    31       68  45.6 
# 18 65-74       10-19                            4    12       26  46.2 
# 19 65-74       20-29                            4    10       10 100   
# 20 65-74       30+                              3     2        2 100   
# 21 75+         0-9g/day                         4     6       20  30   
# 22 75+         10-19                            4     5        6  83.3 
# 23 75+         20-29                            1     0        3   0   
# 24 75+         30+                              2     2        2 100 

esoph %>% 
    group_by("Age group" = agegp, "Alcohol consumption group" = alcgp) %>% 
    summarise(Number = n(), Cases = sum(ncases), Controls = sum(ncontrols), Share = (Cases/Controls)*100) %>%
    View()
# A tibble: 24 x 6
# Groups:   Age group [6]
#    `Age group` `Alcohol consumption group` Number Cases Controls  Share
#    <ord>       <ord>                        <int> <dbl>    <dbl>  <dbl>
#  1 25-34       0-39g/day                        4     0       61   0   
#  2 25-34       40-79                            4     0       45   0   
#  3 25-34       80-119                           3     0        5   0   
#  4 25-34       120+                             4     1        4  25   
#  5 35-44       0-39g/day                        4     1       88   1.14
#  6 35-44       40-79                            4     4       76   5.26
#  7 35-44       80-119                           4     0       20   0   
#  8 35-44       120+                             3     4        6  66.7 
#  9 45-54       0-39g/day                        4     1       77   1.30
# 10 45-54       40-79                            4    20       61  32.8 
# 11 45-54       80-119                           4    12       27  44.4 
# 12 45-54       120+                             4    13        2 650   
# 13 55-64       0-39g/day                        4    12       77  15.6 
# 14 55-64       40-79                            4    22       62  35.5 
# 15 55-64       80-119                           4    24       19 126.  
# 16 55-64       120+                             4    18        8 225   
# 17 65-74       0-39g/day                        4    11       60  18.3 
# 18 65-74       40-79                            3    25       28  89.3 
# 19 65-74       80-119                           4    13       16  81.2 
# 20 65-74       120+                             4     6        2 300   
# 21 75+         0-39g/day                        3     4       23  17.4 
# 22 75+         40-79                            4     4        8  50   
# 23 75+         80-119                           2     2        0 Inf   
# 24 75+         120+                             2     3        0 Inf   

