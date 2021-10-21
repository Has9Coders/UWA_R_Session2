# R Training for UWA Bangladeshi Society: Session2
This repository is for the codes, data and tutorials for Session 2 of R for UWA Bangladeshi Society 
## Part 1: Housekeeping and Handy tools for starting a R session
The following commands can be useful when starting a new R session

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
## Part 2: Data Wrangling and Tidy data

## Part 3: Mapping in R
