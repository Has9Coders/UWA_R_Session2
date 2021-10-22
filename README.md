# R Training for USBC: Session2
This repository is for the codes, data and tutorials for Session 2 of R Training for USBC. Please copy and paste the codes in a new script in R-Studio and follow the discussion.

## Part 1: Housekeeping and Handy tools for starting an R session
The following commands can be useful when starting a new R session. But first of all let's bring in some demo data.

### 1.1. Bring in some demo data
The `mtcars` data is a default built-in dataset that comes with standard R installation (under package 'car'). It is a data frame with 32 observations of car data on 11 variables.

![MazdaRX4](https://github.com/Has9Coders/UWA_R_Session2/blob/main/Image/MazdaRX4.jpg "MazdaRX4")

| Col No | Col Name | Description                              |
|:--------|:----------|:------------------------------------------|
| [, 1]  | mpg      | Miles/(US) gallon                        |
| [, 2]  | cyl      | Number of cylinders                      |
| [, 3]  | disp     | Displacement (cu.in.)                    |
| [, 4]  | hp       | Gross horsepower                         |
| [, 5]  | drat     | Rear axle ratio                          |
| [, 6]  | wt       | Weight (1000 lbs)                        |
| [, 7]  | qsec     | 1/4 mile time                            |
| [, 8]  | vs       | Engine (0 = V-shaped, 1 = straight)      |
| [, 9]  | am       | Transmission (0 = automatic, 1 = manual) |
| [,10]  | gear     | Number of forward gears                  |
| [,11]  | carb     | Number of carburetors                    |


*Source:
Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.*

```
# To see the matcars data execute
mtcars
? mtcars #  it says "what is mtcars?". Applicable for any R default functions/data
car_data <- mtcars # saving the data in local R environment 
```

### 1.2. Routine checks and saving R adata after starting a new R session
```R
getwd() # Get the working directory
ls()    # list the objects in the current workspace/ R.data
list.files() # list the files in the cwd
setwd("c:/docs/mydir")  # Set the current working directory **note / instead of \ in windows
history() # display last 25 commands
history(max.show=Inf) # display all previous commands
savehistory(file="myfile") # # save your command history default is ".Rhistory" 
loadhistory(file="myfile") # # recall your command history default is ".Rhistory"
save.image("File_Name.RData") # save the workspace to the file .RData in the cwd 
```
### 1.3. Viewing and Deleting data
```r
ctrl+L #Clear the console
head(object)  #Lists the first part of the object.
tail(object)  #Lists the last part of the object.
length(object)  #Number of elements/components.
dim(object)  #Dimensions of an object.
rm(list=ls()) # remove most objects from workspace
fix(data) # open data in editable format i.e. notepad. good to see list objects
new=old[,-n]            #drop the nth column
new=old[-n,]             #drop the nth row
new=subset(old,logical) #select those cases that meet the logical condition
complete = subset(data.df,complete.cases(data.df)) #find those cases with no missing values
new=old[n1:n2,n3:n4]    #select the n1 through n2 rows of variables n3 through n4)
which.max(object) # gives the index of the hightest value
```
### 1.4. To view VARIABLE Properties
```R
mode() #shows data is numeric or string ie. how tha data is stored
class() # shows if data is Matrix, Data frame, list, factor etc
str() # show further details attribute of the data i.e. STRUCTURE
summary() # shows most information with max, min, etc.
unique(unlist(x), use.names=FALSE) # shows only the unique values of an variable
# To see all the colors in R in one line of code
scales::show_col(colours(), cex_label = .35)
```

## Part 2: Data Wrangling and Tidy data
### 2.1 Introduction

>“Happy families are all alike; every unhappy family is unhappy in its own way.” –– Leo Tolstoy

>“Tidy datasets are all alike, but every messy dataset is messy in its own way.” –– Hadley Wickham

We are going to to use two packages here to learn some basic (advanced at the same time!) data wrangling and tidying using `dplyr` and `tidyr`.

![dplyr and tidyr](https://github.com/Has9Coders/UWA_R_Session2/blob/main/Image/dplyr_tidyr.jpg "dplyr and tidyr in action")

#### What is dplyr and tidyr?
dplyr and tidyr are powerful R-package to transform and summarize tabular data with rows and columns. For further explanation of dplyr and tidyr see the package vignette.

#### Why is it useful?
The packages contains a set of functions (or “verbs”) that perform common data manipulation operations such as filtering for rows, selecting specific columns, re-ordering rows, adding new columns and summarizing data.

#### How does it compare to using base functions R?
If you are familiar with R, you are probably familiar with base R functions such as split(), subset(), apply(), sapply(), lapply(), tapply() and aggregate(). Compared to base functions in R, the functions in dplyr are easier to work with, are more consistent in the syntax and are targeted for data analysis around data frames instead of just vectors.

#### Important basic concepts
>>**The pipe %>%**

We often want to string together a series of dplyr functions. This is achieved using dplyr’s pipe operator, %>%. This takes the value on the left, and passes it as the first argument to the function call on the right. So the previous summarization could be written:

`scoretab %>% group_by(grade) %>% summarize(count=n())`
%>% isn’t limited to dplyr functions. It’s an alternative way of writing any R code.

```r
rep(paste("hello", "world"), 5)
## [1] "hello world" "hello world" "hello world" "hello world" "hello world"
"hello" %>% paste("world") %>% rep(5)
## [1] "hello world" "hello world" "hello world" "hello world" "hello world"
```
The idea of adding geoms in ggplot2 is rather like the dplyr pipe. ggplot2 predates dplyr, and Hadley Wickham has had a progression of ideas. It will probably be possible to use %>% instead of + in some successor to ggplot2 in the not too distant future.

### 2.2. Getting the data

|  column name |              Description              |
|:------------:|:-------------------------------------|
| name         | common name                           |
| genus        | taxonomic rank                        |
| vore         | carnivore, omnivore or herbivore?     |
| order        | taxonomic rank                        |
| conservation | the conservation status of the mammal |
| sleep_total  | total amount of sleep, in hours       |
| sleep_rem    | rem sleep, in hours                   |
| sleep_cycle  | length of sleep cycle, in hours       |
| awake        | amount of time spent awake, in hours  |
| brainwt      | brain weight in kilograms             |
| bodywt       | body weight in kilograms              |
## Part 3: Mapping in R

## Part 4: References and Next Steps

1. Vignette of any of the packages (google it or in R console run `vignette("package-name")`
2. One easy stop for learning R: [R for Data Science](https://r4ds.had.co.nz/index.html)
3. Use R! book series from library, free pdfs from google or buy from Amazon
4. For video classes, use Udemy, EdX or Data Science Bootcamp 
5. For plot/graph inspirations (with codes): [Visit R Graph Gallary](https://www.r-graph-gallery.com/)
6. Cheatsheets for particular package. Print and keep them handy in your desk.
