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
# Several options for setting working directory in R studio. One is from menu "Session>Set Working Directory>"
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

The msleep (mammals sleep) data set contains the sleeptimes and weights for a set of mammals and is available in the dagdata repository on github. This data set contains 83 rows and 11 variables.

Download the msleep data set in CSV format from here, and then load into R:

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

```r
library(readr)
urlfile <- "https://raw.githubusercontent.com/Has9Coders/UWA_R_Session2/main/Data/msleep_ggplot2.csv"
msleep <- read.csv(url(urlfile))
head(msleep)
```
### Important `dplyr` verbs to remember:

| dplyr verbs |                            Description                           |
|:-----------:|:-----------------------------------------------------------------|
| `select()`  | select columns                                                   |
| `filter()`    | filter rows                                                      |
| `arrange()`   | re-order or arrange rows                                         |
| `mutate()`    | create new columns                                               |
| `summarise()` | summarise values                                                 |
| `group_by()`  | allows for group operations in the “split-apply-combine” concept |

### dplyr verbs in action
The two most basic functions are select() and filter() which selects columns and filters rows, respectively.

Selecting columns using select()
Select a set of columns: the name and the sleep_total columns.
```R
sleepData <- select(msleep, name, sleep_total)
head(sleepData)

#To select all the columns except a specific column, use the “-“ (subtraction) operator (also known as negative indexing)

head(select(msleep, -name))

# To select a range of columns by name, use the “:” (colon) operator

head(select(msleep, name:order))

# To select all columns that start with the character string “sl”, use the function starts_with()

head(select(msleep, starts_with("sl")))
```
Some additional options to select columns based on a specific criteria include

|                      dplyr select options                      |
|:---------------------------------------------------------------|
| ends_with() = Select columns that end with a character string  |
| contains() = Select columns that contain a character string    |
| matches() = Select columns that match a regular expression     |
| one_of() = Select columns names that are from a group of names |

### Selecting rows using filter()
Filter the rows for mammals that sleep a total of more than 16 hours.
```r
filter(msleep, sleep_total >= 16)

# QUIZ: Filter the rows for mammals that sleep a total of more than 16 hours and have a body weight of greater than 1 kilogram.


# Filter the rows for mammals in the Perissodactyla and Primates taxonomic order

filter(msleep, order %in% c("Perissodactyla", "Primates"))
# You can use the boolean operators (e.g. >, <, >=, <=, !=, %in%) to create the logical tests.
```

### Pipe operator: %>%

Here’s an example you have seen:

`head(select(msleep, name, sleep_total))`

Now in this case, we will pipe the msleep data frame to the function that will select two columns (name and sleep_total) and then pipe the new data frame to the function head() which will return the head of the new data frame.
```r
msleep %>% 
    select(name, sleep_total) %>% 
    head
```
You will soon see how useful the pipe operator is when we start to combine many functions.

### Back to dplyr verbs in action
Now that you know about the pipe operator (%>%), we will use it throughout the rest of this tutorial.

Arrange or re-order rows using arrange()
To arrange (or re-order) rows by a particular column such as the taxonomic order, list the name of the column you want to arrange the rows by

```r
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
##                     name           order sleep_total
## 1          Big brown bat      Chiroptera        19.7
## 2       Little brown bat      Chiroptera        19.9
## 3   Long-nosed armadillo       Cingulata        17.4
## 4        Giant armadillo       Cingulata        18.1
## 5 North American Opossum Didelphimorphia        18.0
## 6   Thick-tailed opposum Didelphimorphia        19.4
## 7             Owl monkey        Primates        17.0
## 8 Arctic ground squirrel        Rodentia        16.6
Something slightly more complicated: same as above, except arrange the rows in the sleep_total column in a descending order. For this, use the function desc()

msleep %>% 
    select(name, order, sleep_total) %>%
    arrange(order, desc(sleep_total)) %>% 
    filter(sleep_total >= 16)
##                     name           order sleep_total
## 1       Little brown bat      Chiroptera        19.9
## 2          Big brown bat      Chiroptera        19.7
## 3        Giant armadillo       Cingulata        18.1
## 4   Long-nosed armadillo       Cingulata        17.4
## 5   Thick-tailed opposum Didelphimorphia        19.4
## 6 North American Opossum Didelphimorphia        18.0
## 7             Owl monkey        Primates        17.0
## 8 Arctic ground squirrel        Rodentia        16.6
Create new columns using mutate()
The mutate() function will add new columns to the data frame. Create a new column called rem_proportion which is the ratio of rem sleep to total amount of sleep.

msleep %>% 
    mutate(rem_proportion = sleep_rem / sleep_total) %>%
    head
##                         name      genus  vore        order conservation
## 1                    Cheetah   Acinonyx carni    Carnivora           lc
## 2                 Owl monkey      Aotus  omni     Primates         <NA>
## 3            Mountain beaver Aplodontia herbi     Rodentia           nt
## 4 Greater short-tailed shrew    Blarina  omni Soricomorpha           lc
## 5                        Cow        Bos herbi Artiodactyla domesticated
## 6           Three-toed sloth   Bradypus herbi       Pilosa         <NA>
##   sleep_total sleep_rem sleep_cycle awake brainwt  bodywt rem_proportion
## 1        12.1        NA          NA  11.9      NA  50.000             NA
## 2        17.0       1.8          NA   7.0 0.01550   0.480      0.1058824
## 3        14.4       2.4          NA   9.6      NA   1.350      0.1666667
## 4        14.9       2.3   0.1333333   9.1 0.00029   0.019      0.1543624
## 5         4.0       0.7   0.6666667  20.0 0.42300 600.000      0.1750000
## 6        14.4       2.2   0.7666667   9.6      NA   3.850      0.1527778
You can many new columns using mutate (separated by commas). Here we add a second column called bodywt_grams which is the bodywt column in grams.

msleep %>% 
    mutate(rem_proportion = sleep_rem / sleep_total, 
           bodywt_grams = bodywt * 1000) %>%
    head
##                         name      genus  vore        order conservation
## 1                    Cheetah   Acinonyx carni    Carnivora           lc
## 2                 Owl monkey      Aotus  omni     Primates         <NA>
## 3            Mountain beaver Aplodontia herbi     Rodentia           nt
## 4 Greater short-tailed shrew    Blarina  omni Soricomorpha           lc
## 5                        Cow        Bos herbi Artiodactyla domesticated
## 6           Three-toed sloth   Bradypus herbi       Pilosa         <NA>
##   sleep_total sleep_rem sleep_cycle awake brainwt  bodywt rem_proportion
## 1        12.1        NA          NA  11.9      NA  50.000             NA
## 2        17.0       1.8          NA   7.0 0.01550   0.480      0.1058824
## 3        14.4       2.4          NA   9.6      NA   1.350      0.1666667
## 4        14.9       2.3   0.1333333   9.1 0.00029   0.019      0.1543624
## 5         4.0       0.7   0.6666667  20.0 0.42300 600.000      0.1750000
## 6        14.4       2.2   0.7666667   9.6      NA   3.850      0.1527778
##   bodywt_grams
## 1        50000
## 2          480
## 3         1350
## 4           19
## 5       600000
## 6         3850
Create summaries of the data frame using summarise()
The summarise() function will create summary statistics for a given column in the data frame such as finding the mean. For example, to compute the average number of hours of sleep, apply the mean() function to the column sleep_total and call the summary value avg_sleep.

msleep %>% 
    summarise(avg_sleep = mean(sleep_total))
##   avg_sleep
## 1  10.43373
There are many other summary statistics you could consider such sd(), min(), max(), median(), sum(), n() (returns the length of vector), first() (returns first value in vector), last() (returns last value in vector) and n_distinct() (number of distinct values in vector).

msleep %>% 
    summarise(avg_sleep = mean(sleep_total), 
              min_sleep = min(sleep_total),
              max_sleep = max(sleep_total),
              total = n())
##   avg_sleep min_sleep max_sleep total
## 1  10.43373       1.9      19.9    83
Group operations using group_by()
The group_by() verb is an important function in dplyr. As we mentioned before it’s related to concept of “split-apply-combine”. We literally want to split the data frame by some variable (e.g. taxonomic order), apply a function to the individual data frames and then combine the output.

Let’s do that: split the msleep data frame by the taxonomic order, then ask for the same summary statistics as above. We expect a set of summary statistics for each taxonomic order.

msleep %>% 
    group_by(order) %>%
    summarise(avg_sleep = mean(sleep_total), 
              min_sleep = min(sleep_total), 
              max_sleep = max(sleep_total),
              total = n())

## Part 3: Mapping in R

## Part 4: References and Next Steps

1. Vignette of any of the packages (google it or in R console run `vignette("package-name")`
2. One easy stop for learning R: [R for Data Science](https://r4ds.had.co.nz/index.html)
3. Use R! book series from library, free pdfs from google or buy from Amazon
4. For video classes, use Udemy, EdX or Data Science Bootcamp 
5. For plot/graph inspirations (with codes): [Visit R Graph Gallary](https://www.r-graph-gallery.com/)
6. Cheatsheets for particular package. Print and keep them handy in your desk.
