#===============================================================================
# PROGRAMMING WORKSHOP - PART 2: R
#===============================================================================
# LOADING DATA FROM FILES
# ** reading lines of text
# ** Reading words into a vector
# ** Saving a text vector in a file
# ** Counting elements in a vector
# ** Plotting a word cloud
# ** Exercise
#===============================================================================

#-------------------------------------------------------------------------------
# Check working directory
#-------------------------------------------------------------------------------
getwd()
# "/homedirs26/sghms/bms/users/anohturf/_workshops/r_workshop_2019_03_01"

#-------------------------------------------------------------------------------
# Tell R where packages are stored:
#-------------------------------------------------------------------------------
lib.loc <- "/homedirs8/workshops/190301-R/packages_3_5_0"
.libPaths(lib.loc)
list.files(lib.loc)

#-------------------------------------------------------------------------------
# Load some packages:
#-------------------------------------------------------------------------------
library(magrittr, lib.loc=lib.loc)
library(wordcloud2, lib.loc=lib.loc)

#-------------------------------------------------------------------------------
# Check what packages have been installed for this workshop:
#-------------------------------------------------------------------------------
installed.packages(lib.loc=lib.loc) %>% row.names()


#-------------------------------------------------------------------------------
# Reading data from files using 'readLines()': reading lines of text
# (not used much in Bioinformatics really)
#-------------------------------------------------------------------------------
# You can select a file programmatically [e.g. by copying from the console after
# list.files() ]
my.file <- "data/green_eggs_and_ham.txt"
# Or you can choose a file interactively with file.choose() :
my.file <- file.choose(new=FALSE)
print(my.file)

txt <- readLines(con=my.file, n=10)
txt

# To print the text in the console with linefeeds (newlines) re-inserted,
# use cat(); the 'sep' argument tells R to separate items with newline ("\n)
# characters:
cat(txt, sep="\n")

#-------------------------------------------------------------------------------
# Reading individual words into a vector (scan() command):
#-------------------------------------------------------------------------------
txt <- scan(file="green_eggs_and_ham.txt", what=character())
txt
class(txt)
length(txt) # 778
unique(txt)
sort(txt)

# Functions can be called inside other functions - "nesting":
length(unique(txt)) # 73

# Unix/Linux-like pipes have become more popular -
# the '%>%' command from the magrittr package sends the result of one command
# on to the next
txt %>% unique
txt %>% unique %>% sort
txt %>% toupper %>% unique %>% sort
txt %>% toupper %>% unique %>% length # 53

# The results of a pipe can of course be stored in a variable:
txt.up <- txt %>% toupper
print(txt.up)
txt.lo <- txt %>% tolower
print(txt.lo)

#-------------------------------------------------------------------------------
# Saving a text vector in a file:
#-------------------------------------------------------------------------------
# First check that you are in the right working directory:
getwd()
# (use setwd() or the Session menu to change the working directory)
cat(txt, sep="\n", file="newfile.txt")

# Check whether the file has really been created:
list.files()

#-------------------------------------------------------------------------------
# Counting elements in a vector:
#-------------------------------------------------------------------------------
# The 'table' function counts how often each element occurs in a vector:
df <- txt %>% toupper %>% table
df

# 'as.data.frame' generates an R data.frame, which looks like a table in Excel:
df <- txt %>% toupper %>% table %>% as.data.frame %>% magrittr::set_colnames(c("word", "count")) %>% dplyr::arrange(-count)
df

# A nicer way to look at data frames:
View(df)

# Generate a barplot:
barplot(table(txt.lo), horiz=TRUE, las=1)

# Most people these days use the ggplot2 package to generate plots in R
# Just an example - ggplot2 requires an advanced workshop...
library(ggplot2, lib.loc=lib.loc)
ggplot(data=head(df, 10), aes(x=word, y=count)) +
  geom_bar(stat="identity", color="black", fill="lightgreen") +
  coord_flip() +
  labs(
    title="Frequency of some words: GREEN EGGS AND HAM",
    subtitle="by Dr Seuss")

#-------------------------------------------------------------------------------
# Plotting a word cloud:
#-------------------------------------------------------------------------------
wordcloud2(data = df)
wordcloud2(df, minRotation = -pi/6, maxRotation = -pi/6, minSize = 10, rotateRatio = 1)

#-------------------------------------------------------------------------------
# Save wordcloud as PDF:
#-------------------------------------------------------------------------------
# save it in html
library("htmlwidgets", lib=lib.loc)
my_cloud <- wordcloud2(data = df)
my_cloud
htmlwidgets::saveWidget(my_cloud,"tmp.html",selfcontained = F)


#-------------------------------------------------------------------------------
# ********************************  EXERCISE!!  ********************************
#-------------------------------------------------------------------------------
# Create a text file with 'file.edit' and analyze your own poem or other text:
file.edit("my_poem.txt")
