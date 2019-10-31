




# libraries #######  
if (!require("pacman")) install.packages("pacman"); 
library(pacman)
p_load(tidyverse)        


# importation ########
nm_18 <- read_csv("C:/Users/h.asim/Desktop/year_to_year_visualization_testing/00_y2y/nm_2018.csv", guess_max = 5000)
nm_19 <- read_csv("C:/Users/h.asim/Desktop/year_to_year_visualization_testing/00_y2y/nm_2019.csv")




# finding graph types for each column  #########


df <- mutate_if(nm_18, is.character, as.factor)
# tst1 <- data.frame(t(names(nm_18)))

tst2 <- data.frame(sapply(df, class))

flipped_nm_18 <- gather(tst2, key = "column name", value = "class") %>%
    distinct(`column name`,class) %>% 
  rename(col_name = `column name`)

factors <- flipped_nm_18 %>% 
  filter(class == "factor") %>% 
  select(`column name`) %>% 
  filter(!is.na(`column name`)) %>% 
  unlist() %>% 
  unname()  

 nm_levels <-  select(df, one_of(factors)) 
 
 
# factor_detection lets us know how many levels everything has, to determin whether it is categorical. 
 factor_detection <- data.frame("name"=names(df),"Levels"=sapply(df,nlevels)) %>% 
   left_join(flipped_nm_18, by = c("name" = "col_name"))

  













