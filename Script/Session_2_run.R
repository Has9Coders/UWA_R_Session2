# Part 1: Data common checks ----------------------------------------------

# To see the matcars data execute
mtcars
? mtcars #  it says "what is mtcars?". Applicable for any R default functions/data
car_data <- mtcars # saving the data in local R environment 
car_data
car_data[,2] 
car_data[1:8,8]
edited_data <- car_data[1:8,2:8]



getwd() # Get the working directory
ls()    # list the objects in the current workspace/ R.data
list.files() # list the files in the cwd
setwd("c:/docs/mydir")  # Set the current working directory **note / instead of \ in windows
# Several options for setting working directory in R studio. One is from menu "Session>Set Working Directory>"
history() # display last 25 commands
history(max.show=Inf) # display all previous commands
savehistory(file="myfile") # # save your command history default is ".Rhistory" 
loadhistory(file="myfile") # # recall your command history default is ".Rhistory"
save.image("CarDataImport.RData") # save the workspace to the file .RData in the cwd 


ctrl+L #Clear the console
head(car_data)  #Lists the first part of the object.
tail(object)  #Lists the last part of the object.
length(car_data)  #Number of elements/components.
dim(car_data)  #Dimensions of an object.
rm(list=ls()) # remove most objects from workspace
rm(edited_data)
fix(data) # open data in editable format i.e. notepad. good to see list objects
new=old[,-n]            #drop the nth column
car_partial<-car_data[,-8]
new=old[-n,]             #drop the nth row
new=subset(old,logical) #select those cases that meet the logical condition
new_car <-subset(car_data, car_data$wt<=2.0)
complete = subset(data.df,complete.cases(data.df)) #find those cases with no missing values
new=old[n1:n2,n3:n4]    #select the n1 through n2 rows of variables n3 through n4)
which.max(object) # gives the index of the hightest value


mode(car_data) #shows data is numeric or string ie. how tha data is stored
class(car_data) # shows if data is Matrix, Data frame, list, factor etc
str(car_data) # show further details attribute of the data i.e. STRUCTURE
summary(car_data) # shows most information with max, min, etc.
unique(unlist(car_data$gear), use.names=FALSE) # shows only the unique values of an variable
# To see all the colors in R in one line of code
scales::show_col(colours(), cex_label = .4)

# Part2 ----
library(tidyverse)
rep(paste("hello", "world"), 10)
## [1] "hello world" "hello world" "hello world" "hello world" "hello world"
"hello" %>% paste("world") %>% rep(10)
## [1] "hello world" "hello world" "hello world" "hello world" "hello world"

library(readr)
urlfile <- "https://raw.githubusercontent.com/Has9Coders/UWA_R_Session2/main/Data/msleep_ggplot2.csv"
msleep <- read.csv(url(urlfile))
head(msleep)
msleep

library(tidyverse)
sleepData <- select(msleep, name, sleep_total)
head(sleepData)

#To select all the columns except a specific column, use the “-“ (subtraction) operator (also known as negative indexing)

head(select(msleep, -name))

# To select a range of columns by name, use the “:” (colon) operator

head(select(msleep, name:order))

# To select all columns that start with the character string “sl”, use the function starts_with()

head(select(msleep, starts_with("sl")))


filter(msleep, sleep_total >= 16)

# QUIZ: Filter the rows for mammals that sleep a total of more than 16 hours and have a body weight of greater than 1 kilogram.
filter(msleep, sleep_total >= 16, bodywt>1)

# Filter the rows for mammals in the Perissodactyla and Primates taxonomic order

filter(msleep, order %in% c("Perissodactyla", "Primates"))
# You can use the boolean operators (e.g. >, <, >=, <=, !=, %in%) to create the logical tests.

name_slTotal <- msleep %>% 
  select(name, sleep_total) %>% 
  head

msleep %>% arrange(order) %>% head

# Now, we will select three columns from msleep, arrange the rows by the taxonomic order and then arrange the rows by sleep_total. Finally show the head of the final data frame

msleep %>% 
  select(name, order, sleep_total) %>%
  arrange(order, sleep_total) %>% 
  head

# Same as above, except here we filter the rows for mammals that sleep for 16 or more hours instead of showing the head of the final data frame

msleep %>% 
  select(name, order, sleep_total) %>%
  arrange(order, sleep_total) %>% 
  filter(sleep_total >= 16)

# Something slightly more complicated: same as above, except arrange the rows in the sleep_total column in a descending order. For this, use the function desc()

msleep %>% 
  select(name, order, sleep_total) %>%
  arrange(order, desc(sleep_total)) %>% 
  filter(sleep_total >= 16)

msleep %>% 
  mutate(rem_proportion = sleep_rem / sleep_total) %>%
  head

# QUIZ: You can create many new columns using mutate (separated by commas). Add a second column called bodywt_grams which is the bodywt column in grams.

msleep %>% 
  summarise(avg_sleep = mean(sleep_total))

# There are many other summary statistics you could consider such sd(), min(), max(), median(), sum(), n() (returns the length of vector), first() (returns first value in vector), last() (returns last value in vector) and n_distinct() (number of distinct values in vector).

msleep %>% 
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total),
            max_sleep = max(sleep_total),
            total = n())


msleep %>% 
  group_by(order) %>%
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total), 
            max_sleep = max(sleep_total),
            total = n())

library(dismo)
require(RgoogleMaps)

newmap <- GetMap(center = c(-31.980350610423013, 115.8186768018108), 
                 zoom = 16, maptype="roadmap", 
                 destfile = "newmap.png", 
                 size = c(840, 840))

PlotOnStaticMap(newmap)

mypolygon <- drawPoly()
summary(mypolygon)
