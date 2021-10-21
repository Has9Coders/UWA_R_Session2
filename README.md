# R Training for USBC: Session2
This repository is for the codes, data and tutorials for Session 2 of R Training for USBC. Please copy and paste the codes in a new script in R-Studio and follow the discussion.

## Part 1: Housekeeping and Handy tools for starting an R session
The following commands can be useful when starting a new R session. But first of all let's bring in some demo data.

### Bring in some demo data
The `mtcars` data is a default built-in dataset that comes with standard R installation (under package 'graphics'). It is a data frame with 32 observations of car data on 11 variables.
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


Source:

Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.

```
# To see the matcars data execute
mtcars
? mtcars #  it says "what is mtcars?". Applicable for any R default functions/data
car_data <- mtcars # saving the data in local R environment 
```

### Starting a new R session
```
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
### Viewing and Deleting data
```
ctrl+L #Clear the console
head(object)  #Lists the first part of the object.
tail(object)  #Lists the last part of the object.
length(object)  #Number of elements/components.
dim(object)  #Dimensions of an object.
rm(list=ls()) # remove most objects from workspace
fix(data) # open data in editable format i.e. notepad. good to see list objects
new=old[,-n]            #drop the nth column
new=old[n,]             #drop the nth row
new=subset(old,logical) #select those cases that meet the logical condition
complete = subset(data.df,complete.cases(data.df)) #find those cases with no missing values
new=old[n1:n2,n3:n4]    #select the n1 through n2 rows of variables n3 through n4)
which.max(object) # gives the index of the hightest value
```
### To view VARIABLE Properties
```
mode() #shows data is numeric or string ie. how tha data is stored
class() # shows if data is Matrix, Data frame, list, factor etc
str() # show further details attribute of the data i.e. STRUCTURE
summary() # shows most information with max, min, etc.
unique(unlist(x), use.names=FALSE) # shows only the unique values of an variable
```

## Part 2: Data Wrangling and Tidy data

## Part 3: Mapping in R
