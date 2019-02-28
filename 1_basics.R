#===============================================================================
# R PROGRAMMING WORKSHOP - 01-March-2019
#===============================================================================
# THE BASICS
# * RStudio
# * Data formats: scalar, vector, matrix, data frame
# * Subsetting vectors
# * Date classes: number, string/character, boolean/logical
# * Setting the working directory + listing local files
# * Getting help
#===============================================================================


#-------------------------------------------------------------------------------
# Data formats: scalars and vectors
#-------------------------------------------------------------------------------
# Vectors are simple lists with each item being of the same type.
# Scalars are really just vectors with a single item.
# Some useful vectors are 'built' into R:
# (place the cursor any where in a line of code and press Ctrl-Enter to execute
# the code / Cmd-Enter on a Mac)
# Results / output will appear in the 'Console' window below
letters
LETTERS
month.abb
month.name

# Vectors can be generated using the c() function:
c(14, 6, 2016)

# Usually data are stored in named VARIABLES
# * Variables can be long
# * Variables CANNOT contain spaces
# * Variables CANNOT start with a number (but numbers can appear elsewhere in the name)
v1 <- c(14, 6, 2016)

# Use 'print()' or 'cat()' command to display the contents of a variable:
# Output from 'print()' is preceded by row numbers in square brackets:
print(v1)

# Just the variable is equivalent to 'print()'
v1

# Output from 'cat()' has no row numbers:
cat(v1)

# The 'View()' function opens a new tab and mostly used to inspect large tables:
View(v1)

# A vector containing text:
v2 <- c("Hello", "world", "!")
print(v2)

# Vector items can be 'glued' together using the paste() function:
paste(v1, collapse="-")
paste(v2, collapse=" ")

# It's easy to generate simply series of numbers:
v3 <- 1:12
print(v3)

# Vector items can have names:
names(v3) <- month.abb
print(v3)
names(v3)

#-------------------------------------------------------------------------------
# Subsetting vectors
#-------------------------------------------------------------------------------
# You can select items from within a vector using square brackets + indices ...
# A single index number...
LETTERS[10]
# ... or a vector of numbers ...
LETTERS[c(8,5,12,12,15)]

# You can also refer to vector items by name, if defined ...
v3["Nov"]
# Using a vector of names:
v3[c("Jan", "Mar")]
# ... or using bolean/logical values (TRUE/FALSE):
v4 <- 1:3
v4[c(TRUE, FALSE, TRUE)]

# Boolean/logical values are often generated through 'equal' or
# 'greather/lesser than' (<==>) operations:
10 > 2
2 > 10
3 == 3.0
# The following generates a vector of boolean values:
v5 <- 1:10 >= 5
names(v5) <- 1:10
print(v5)

is.logical(v5)
is.logical(letters)
typeof(letters)
typeof(1:10)
typeof(1.2)


#-------------------------------------------------------------------------------
# Matrices are 2-dimensional arrays/tables where each item has to be of the
# same data type:
#-------------------------------------------------------------------------------
mx1 <- matrix(1:24, ncol=6)
print(mx1)

mx2 <- matrix(LETTERS[1:24], nrow=6)
print(mx2)

#-------------------------------------------------------------------------------
# One of the great things about vectors and matrices in R is that they can be
# modified with simple code:
#-------------------------------------------------------------------------------
print(v3)
v3 * 100

print(mx1)
mx1 + 1000

#-------------------------------------------------------------------------------
# Data frames are the most common container used to store data in R.
# Each column can be a different data type:
#-------------------------------------------------------------------------------
df1 <- data.frame(Name=c("Jane", "Jack", "Jaim"),
                  Age=c(5, 12, 30),
                  Female=c(TRUE, FALSE, FALSE))
print(df1)

#-------------------------------------------------------------------------------
# Working directory
#-------------------------------------------------------------------------------
# ** In RStudio you can set the working using the 'Session' menu >
#    'Set working directory'.

# ** The best way of setting the correct working directory is to work with
#    RStudio 'projects' (which is what we are doing for this workshop!):
#    RStudio autmatically sets the working directory to the folder that contains
#    the project file.
#    Info: https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects

# ** Usually you set the working directory programmatically using the setwd()
#    function (the example code will not work on your screen):
setwd("~/Dropbox/SGUL_Teaching/SGUL_Workshops/2017_Programming_Workshop")

# You can get the current working directory using the getwd() function:
getwd()

# Use list.files() to see the contents of the current working directory:
list.files()

#-------------------------------------------------------------------------------
# Packages
#-------------------------------------------------------------------------------
# Packages extend the basic repertoire of R with new functions.
# There are three main depositories for R packages: CRAN, Bioconductor and github
# Packages from CRAN are installed as follows, e.g.:
install.packages("magrittr")

# To install a package from Bioconductor, find the package's page through a
# Google search or at http://bioconductor.org;
# then copy the installation code and paste into your script

# Packages are then _loaded_ using the library() or require() functions:
# library(magrittr)
# library(Biostrings)

# FOR GEEKS:
# To avoid downoading an already installed package, use this code in your scripts:
# (If the package is already installed, it will only be loaded; otherwise it will
# be installed)
# if (!require(wordcloud2)) install.packages("wordcloud2"); library(wordcloud2)

#-------------------------------------------------------------------------------
# Getting help
#-------------------------------------------------------------------------------
# (1) To get help on a specific function the first option usually is to use the
#     'Help' tab in RStudio

# (2) Help is also available through code:
help(sd)
?median

??variance

# (3) Sometimes the same function name is used by different packages. To get help
#     on a function from a specific package, use:
help(sd, package="stats")

# (4) For most functions, there are code examples:
example(persp)

# (5) To see a list of help files for _all_ functions from a specific package, use:
help(package="stats")

# (6) For some (not all) packages, so-called 'vignettes' are available - articles that explain
#     packages with code examples that show how to work through a typical problem. If no
#     vignette is available from within R, go to the package's page on CRAN or Bioconductor
#     respectively.
vignette("magrittr")

# (7) Programmers spend a lot of time searching for help on Google, mostly looking
#     for search hits on the stackoverflow web site:
#     https://stackoverflow.com/documentation/r
#     https://stackoverflow.com/documentation/r/topics

# (8) To stay up-to-date on R consider subscribing to r-bloggers:
#     * https://www.r-bloggers.com/
#     * https://feeds.feedburner.com/RBloggers

#-------------------------------------------------------------------------------
# ********************************  EXERCISE!!  ********************************
#-------------------------------------------------------------------------------
# For the vector v6 below calculate:
# mean/average
# median
# variance
# standard deviation
# standard error of the mean

v6 <- c(-0.18, 0.61, -0.12, 1.02, 1.69, 0.41, 0.3, -0.07, -0.51, 0.84,
        0.69, -0.24, -1.17, 0.02, -0.81, 0.83, -0.62, -1.46, 0.44, -0.65,
        -0.37, 1.56, -0.33, -0.4, -1.22, -1.29, -2.34, -0.61, -0.26,
        -0.2, -1.48, 1.01, 0.27, 0.06, 0.79, 1.35, -2.01, -0.16, -1.45,
        -0.49, -0.35, 1.39, -0.65, -0.2, -0.31, -0.66, -0.31, -1.2, -0.28,
        -0.58)
