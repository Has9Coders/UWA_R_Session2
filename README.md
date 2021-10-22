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
library(tidyverse)
rep(paste("hello", "world"), 5)
## [1] "hello world" "hello world" "hello world" "hello world" "hello world"
"hello" %>% paste("world") %>% rep(5)
## [1] "hello world" "hello world" "hello world" "hello world" "hello world"
```
The idea of adding geoms in ggplot2 is rather like the dplyr pipe. ggplot2 predates dplyr, and Hadley Wickham has had a progression of ideas. It will probably be possible to use %>% instead of + in some successor to ggplot2 in the not too distant future.

### 2.2. Getting the data

The msleep (mammals sleep) data set contains the sleeptimes and weights for a set of mammals and is available in the dagdata repository on github. This data set contains 83 rows and 11 variables.
![Mammals_Sleep](https://github.com/Has9Coders/UWA_R_Session2/blob/main/Image/avg_mammals_sleep_total.jpg)

Download (if you have not already) the msleep data set in CSV format from the Data folder, and then load into R. This is something you can do in many ways, using GUI or 1 line of code or combining both.

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


Alternatively, you can load the data directly from github source using the following code: 
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

### 2.3. dplyr verbs in action
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

#### Selecting rows using filter()
Filter the rows for mammals that sleep a total of more than 16 hours.
```r
filter(msleep, sleep_total >= 16)

# QUIZ: Filter the rows for mammals that sleep a total of more than 16 hours and have a body weight of greater than 1 kilogram.


# Filter the rows for mammals in the Perissodactyla and Primates taxonomic order

filter(msleep, order %in% c("Perissodactyla", "Primates"))
# You can use the boolean operators (e.g. >, <, >=, <=, !=, %in%) to create the logical tests.
```

#### Pipe operator: %>%

Here’s an example you have seen:

`head(select(msleep, name, sleep_total))`

Now in this case, we will pipe the msleep data frame to the function that will select two columns (name and sleep_total) and then pipe the new data frame to the function head() which will return the head of the new data frame.
```r
msleep %>% 
    select(name, sleep_total) %>% 
    head
```
You will soon see how useful the pipe operator is when we start to combine many functions.

#### Back to dplyr verbs in action
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

# Something slightly more complicated: same as above, except arrange the rows in the sleep_total column in a descending order. For this, use the function desc()

msleep %>% 
    select(name, order, sleep_total) %>%
    arrange(order, desc(sleep_total)) %>% 
    filter(sleep_total >= 16)
```
#### Create new columns using mutate()
The mutate() function will add new columns to the data frame. Create a new column called rem_proportion which is the ratio of rem sleep to total amount of sleep.

```r
msleep %>% 
    mutate(rem_proportion = sleep_rem / sleep_total) %>%
    head

# QUIZ: You can create many new columns using mutate (separated by commas). Add a second column called bodywt_grams which is the bodywt column in grams.
```

#### Create summaries of the data frame using summarise()
The summarise() function will create summary statistics for a given column in the data frame such as finding the mean. For example, to compute the average number of hours of sleep, apply the mean() function to the column sleep_total and call the summary value avg_sleep.

```r
msleep %>% 
    summarise(avg_sleep = mean(sleep_total))

# There are many other summary statistics you could consider such sd(), min(), max(), median(), sum(), n() (returns the length of vector), first() (returns first value in vector), last() (returns last value in vector) and n_distinct() (number of distinct values in vector).

msleep %>% 
    summarise(avg_sleep = mean(sleep_total), 
              min_sleep = min(sleep_total),
              max_sleep = max(sleep_total),
              total = n())
```

#### Group operations using group_by()
The group_by() verb is an important function in dplyr. As we mentioned before it’s related to concept of “split-apply-combine”. We literally want to split the data frame by some variable (e.g. taxonomic order), apply a function to the individual data frames and then combine the output.

Let’s do that: split the msleep data frame by the taxonomic order, then ask for the same summary statistics as above. We expect a set of summary statistics for each taxonomic order.
```r
msleep %>% 
    group_by(order) %>%
    summarise(avg_sleep = mean(sleep_total), 
              min_sleep = min(sleep_total), 
              max_sleep = max(sleep_total),
              total = n())
```
### 2.4. Converting long and wide data using `tidyr`

You can represent the same underlying data in multiple ways. The example below shows the same data organised in four different ways. Each dataset shows the same values of four variables country, year, population, and cases, but each dataset organises the values in a different way.

Explore some data and notice how the rows, columns and cells are organized.
```r
table1
table2
table3
table4a
table4b
```
These are all representations of the same underlying data, but they are not equally easy to use. One dataset, the tidy dataset, will be much easier to work with inside the tidyverse.

There are **three interrelated rules** which make a dataset tidy:

***
1. Each variable must have its own column.
2. Each observation must have its own row.
3. Each value must have its own cell.
***

The figure below shows the rules graphically
![tidyDataRules](https://github.com/Has9Coders/UWA_R_Session2/blob/main/Image/tidyData-Rules.png)

### Making wide data long

A common problem is a dataset where some of the column names are not names of variables, but values of a variable. Take table4a: the column names 1999 and 2000 represent values of the year variable, the values in the 1999 and 2000 columns represent values of the cases variable, and each row represents two observations, not one.

```
table4a
#> # A tibble: 3 x 3
#>   country     `1999` `2000`
#> * <chr>        <int>  <int>
#> 1 Afghanistan    745   2666
#> 2 Brazil       37737  80488
#> 3 China       212258 213766
```

To tidy a dataset like this, we need to pivot the offending columns into a new pair of variables. To describe that operation we need three parameters:

* The set of columns whose names are values, not variables. In this example, those are the columns 1999 and 2000.

* The name of the variable to move the column names to. Here it is year.

* The name of the variable to move the column values to. Here it’s cases.

![wideVsLong](https://github.com/Has9Coders/UWA_R_Session2/blob/main/Image/Wide_vs_long_data.png)

Together those parameters generate the call to `pivot_longer()`:

```r
table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")

#> # A tibble: 6 x 3
#>   country     year   cases
#>   <chr>       <chr>  <int>
#> 1 Afghanistan 1999     745
#> 2 Afghanistan 2000    2666
#> 3 Brazil      1999   37737
#> 4 Brazil      2000   80488
#> 5 China       1999  212258
#> 6 China       2000  213766

```
**QUIZ:** Use `pivot_longer()` to tidy `table4b` in a similar fashion. The only difference is the variable stored in the cell values. 
It should look like:

```r
#> # A tibble: 6 x 3
#>   country     year  population
#>   <chr>       <chr>      <int>
#> 1 Afghanistan 1999    19987071
#> 2 Afghanistan 2000    20595360
#> 3 Brazil      1999   172006362
#> 4 Brazil      2000   174504898
#> 5 China       1999  1272915272
#> 6 China       2000  1280428583
```

**CONGRATULATIONS, you have covered the basics of data wrangling in R**

*Source:*

*1. R for data Science, Hadley Wickham, et.al.*

*2. Tidy Data by Hadley Wickham, http://www.jstatsoft.org/v59/i10/paper*

## Part 3: Mapping in R
R has outstanding capacity of handling spatial and GIS data. It has come a long way from plotting some basic spatial data to very complex geo-statistical analysis as well as advanced remote sensing satellite data handling. This is a whole specialized domain and beyond the scope of this session, but anyone can take advantage of this amazing capability.

Today we will do a very basic map plotting using google map API and define our own area of interest. Please copy the following code in a script in R-Studio and follow the discussion

```r
library(dismo)
require(RgoogleMaps)

newmap <- GetMap(center = c(-31.980350610423013, 115.8186768018108), 
            zoom = 16, maptype="roadmap", 
            destfile = "newmap.png", 
                 size = c(840, 840))

PlotOnStaticMap(newmap)

mypolygon <- drawPoly()
summary(mypolygon)
```
The following figures shows R's mapping capacity, which is often better than many standard GIS software.

![PhD Study Site](https://github.com/Has9Coders/UWA_R_Session2/blob/main/Screenshots/Thesis_HasneinTareque_StudySite.pdf.png)

Figure: Study site map of my PhD research

![GW_Contours](https://github.com/Has9Coders/UWA_R_Session2/blob/main/Screenshots/Thesis_HasneinTareque_GWContours.pdf.png)

Figure: Combination of multiple sets of information in one figure (from my PhD thesis)

![BD research outputs](https://github.com/Has9Coders/UWA_R_Session2/blob/main/Screenshots/ThunderStormResults.png)

Figure: Results of Thunderstorm analysis in Bangladesh

![](https://github.com/Has9Coders/UWA_R_Session2/blob/main/Image/urban-animated.gif)

Figure: Animated map of world population
## Part 4: References and Next Steps

1. Vignette of any of the packages (google it or in R console run `vignette("package-name")`
2. One easy stop for learning R: [R for Data Science](https://r4ds.had.co.nz/index.html)
3. Use R! book series from library, free pdfs from google or buy from Amazon
4. For video classes, use Udemy, EdX or Data Science Bootcamp 
5. For plot/graph inspirations (with codes): [Visit R Graph Gallary](https://www.r-graph-gallery.com/)
6. Cheatsheets for particular package. Print and keep them handy in your desk.
