# Exercise 1
randomNumber <- sample(0:101, 1, replace=FALSE)
humanInput <- -1

while (randomNumber != humanInput) {
    humanInput <- readline("Guess my number! ")  
    humanInput <- as.numeric(humanInput)
  
    if (humanInput == randomNumber) {
        print("You guessed it!")
        break
    } else if (humanInput < randomNumber) {
        print("Your number is too low.")
    } else if (humanInput > randomNumber) {
        print("Your number is too high.")
    }
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


esoph %>% group_by(agegp) %>% summarise(count = n(), casesPerAgeGroup = sum(ncases), controlsPerAgeGroup = sum(ncontrols), share = (casesPerAgeGroup/controlsPerAgeGroup)*100)
# A tibble: 6 x 5
#  agegp count casesPerAgeGroup controlsPerAgeGroup  share
#  <ord> <int>            <dbl>               <dbl>  <dbl>
#1 25-34    15                1                 115  0.870
#2 35-44    15                9                 190  4.74 
#3 45-54    16               46                 167 27.5  
#4 55-64    16               76                 166 45.8  
#5 65-74    15               55                 106 51.9  
#6 75+      11               13                  31 41.9  


esoph %>% group_by(tobgp) %>% summarise(count = n(), casesPerTobaccoConsumption = sum(ncases), controlsPerTobaccoConsumption = sum(ncontrols), share = (casesPerTobaccoConsumption/controlsPerTobaccoConsumption)*100)
# A tibble: 4 x 5
#  tobgp    count casesPerTobaccoConsumption controlsPerTobaccoConsumption share
#  <ord>    <int>                      <dbl>                         <dbl> <dbl>
#1 0-9g/day    24                         78                           447  17.4
#2 10-19       24                         58                           178  32.6
#3 20-29       20                         33                            99  33.3
#4 30+         20                         31                            51  60.8

esoph %>% group_by(alcgp) %>% summarise(count = n(), casesPerAlcoholConsumption = sum(ncases), controlsPerAlcoholConsumption = sum(ncontrols), share = (casesPerAlcoholConsumption/controlsPerAlcoholConsumption)*100)
# A tibble: 4 x 5
#  alcgp     count casesPerAlcoholConsumpti… controlsPerAlcoholConsumpti…  share
#  <ord>     <int>                     <dbl>                        <dbl>  <dbl>
#1 0-39g/day    23                        29                          386   7.51
#2 40-79        23                        75                          280  26.8 
#3 80-119       21                        51                           87  58.6 
#4 120+         21                        45                           22 205. 

