# Handy Tips in R

# # command/ctrl + shift + F10 # In Rstudio, restart the R session
getwd() # Get the working directory
ls()    # list the objects in the current workspace/ R.data
list.files() # list the files in the cwd
setwd("c:/docs/mydir")  # Set the current working directory **note / instead of \ in windows
history() # display last 25 commands
history(max.show=Inf) # display all previous commands
savehistory(file="myfile") # # save your command history default is ".Rhistory" 
loadhistory(file="myfile") # # recall your command history default is ".Rhistory"
save.image("File_Name.RData") # save the workspace to the file .RData in the cwd 

# # Viewing and deleting data ---------------------------------------------

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


# # To view VARIABLE Properties -------------------------------------------

mode() #shows data is numeric or string ie. how tha data is stored
class() # shows if data is Matrix, Data frame, list, factor etc
str() # show further details attribute of the data i.e. STRUCTURE
summary() # shows most information with max, min, etc.
unique(unlist(x), use.names=FALSE) # shows only the unique values of an variable

# Reading Excel files -----------------------------------------------------

require(xlsx)
require(xlsxjars) # not always needed
read.xlsx(file="File_name.xlsx", sheetIndex=1, sheetName=NULL, rowIndex=NULL,
          startRow=NULL, endRow=NULL, colIndex=NULL,
          as.data.frame=TRUE, header=TRUE)

# Writing file to external formats ----------------------------------------

#Writing to csv file 
write.table(data,file="output_filename", sep=",",row.names=FALSE)

# Writing list opbjects in output files
as.matrix(MannKendall.table)
capture.output(MannKendall.table, file = "MannKendalAutoCorrelation.txt")