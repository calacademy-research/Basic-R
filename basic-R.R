#' ---
#' title: Basic R in One Script
#' ---
#' 
#' This document is an R *script*. 
#' R scripts are text files containing sets of commands and comments. 
#' Commands are instructions we ask R to follow. R follows those instructions by executing or *running* those commands.
#' Comments are text that R does not run as commands; these are meant for humans to keep track of information and details about the commands themselves. 
#' Comments are written with one or more # symbols. As we will see later, the ' after the # is not required but, has additional advantages (see 'compile report' below).
#' Scripts can be saved and used later to re-execute the saved commands and repeat potentially very large and complex sets of operations. 
#' Scripts can be edited and expanded to execute modified versions of the commands. 
#' Commands within scripts are executed in a sequence from top to bottom. 
#' Scripts will save you *countless hours*: they provide a complete record of what you did, such that anyone (including our future selves!) can easily replicate the analyses and results on their computer.
#' 
#' R is a computer language inspired by the S language for data analysis and visualization (developed at AT&T's Bell Labs), 
#' but is best thought of as an "environment" for analyzing and visualizing many kinds of data. 
#' R is extremely powerful and has several advantages over other computer languages, because
#' * it is "open-source" software (which for our purposes means that it can be freely downloaded);
#' * it is extensible, which means that procedures for analyzing or visualizing data that don't currently exist can be readily developed;
#' * it is supported by a huge community of developers, with innovations happening on a daily basis;
#' 
#' R is an object-oriented language, meaning R uses objects that include both the underlying data 
#' and the appropriate methods to manipulate the underlying data.
#' 
#' R has a fairly steep learning curve - this tutorial is designed to demistify the basics of R and get started with analyzing and visualizing data. 
#'
#' To get R on your computer, go to https://www.r-project.org/ and follow directions for your system
#' 
#' **R BASICS**
#' 
#' The console pane (the panel below this one) is the place where commands written in R can be typed and executed immediately by the computer. 
#' It is also where the results will be shown for commands that have been executed. 
#' You can type commands directly into the console and press `Enter` to execute those commands.
#' 
#' R works by entering commands at a prompt (like an operating system).
#' The prompt is the *>* symbol:
#' 
#' *>*
#' 
#' So, what commands can you type?
#' 
#' You can use R as a calculator, for example:
4 + 6 - 3 #' **note** that you can run this and all other commands (remember these are all the lines not starting with a #) by using the `Ctrl + Enter` shortcut (on Macs, `Cmd + Return`)
1 / 200 * 30
(59 + 73 + 2) / 3
#' 
#' You can create new objects with `<-` using the form `object_name <- value`, for example:
x <- 3 * 4
#' 
#' This is called an *assignment* and we read it like "object name gets value".
#' 
#' You can call R *functions* using the form `function_name(argument)`, for example: 
ls()
#' returns the names of the objects, data sets and functions a user has defined and which are available to R. 
#' Note that in this case the argument is 'empty' as no argument is required. 
#' 
#' Other functions require arguments, for example:
is.function(x)
#' answers the question "is this object a function?" by returning TRUE or FALSE.
#' 
#' Nore that, if we run `is.function()` without and argument, we get an error.
#' R is talking back to us saying there was an *error* in running the command: 0 arguments were passed to `is.function` when the function requires 1.
#' 
#' *Errors* are one of the types of messages the R console might return in response to a command. Errors are prefaced with "Error in." and indicate that the command could not be run.
#' The other types of messages from the console are *Warnings* and *Messages*. 
#' Warnings are generally returned if your command has been run, but with some caveats: things that you might want to keep track of or double-check on.
#' Messages are any other types of communications that are not errors or warnings; these generally do not stop your code from running and provide helpful diagnostics or information about commands.
#' 
#' To learn more about any function, you can type:
#' `?function_name`
#' at the prompt - it will teach you a lot!
#' 
#' Entering commands directly in the R console is effective and simple but, after you close your R session, they will be forgotten. 
#' Next time you will want to execute the same or a similar set of commands, you will have to re-enter them all again. 
#' This is likely to lead to errors and is very time-consuming. 
#' Fortunately, we can save all our commands in a script like this one and find a full record of what we did the next time we open R.
#' It is a good idea to save your scripts before closing your R session and regularly and to backing them up as well.
#' 
#' You can execute commands directly from the script editor using the `Ctrl + Enter` shortcut (on Macs, `Cmd + Return`). 
#' The command on the current line in the script (indicated by the cursor) or all of the commands in the currently selected text will be sent to the console and executed when you press Ctrl + Enter. 
#' Finally, you can run all commands inside a script by using the `Ctrl + Shift + S` (on Macs, `Cmd + Shift + S`) or clicking `Source` on the upper right of the script editor.
#' 
#' **DATA STRUCTURES**
#' 
#' Before analyzing data in R, it is useful to understand how R structures different data types.
#' 
#' The most basic data structure is atomic data (a single datum),  
#' this can be a character (any bit of text) or a numeric value. Characters, for instance, are specified in quotes:
"b"
#' Numbers, however, do not need quotes, for example:
1
#' is an integer and
0.01
#' is known as a `double` because it includes decimal places.  
#' 
#' In general, when we analyze data we will have multiple values over one or more variables. 
#' *Vectors* are sequences of values, which can be either numbers or characters. 
#' We can assign a series of values to a vector using the `c()` function.  
c(1,2)
c("a", "b")
#' 
#' We can use shortcuts for creating vectors of numbers: 
#' R does this by using a colon `:` between the first and last value of the series. For example:
1:10
#' returns a vector of all integers between 1 and 10
#' 
#' Other objects include rectangular arrays called a matrix:
matrix(data = 1:6, nrow = 2, ncol = 3) 
#'
#' A more general structure for data is called a data frame.
#' Data frames are the primary data structure for most tabular data, and what we
#' use for statistics and plotting.
#'
#'A data frame can be created by hand:
data.frame(matrix(data = 1:6, nrow = 2, ncol = 3))
#'
#' Data frames can include both character and numeric data:
mydataframe <- data.frame(some_characters = c("a", "b"), some_numbers = c(1, 2)) 
#' This command does not return anything in the console. This is because this time we have used an *assignment*; 
#' as mentioned before, an assignment assigns the object following the `<-` sign to the name before the `<-` sign.
#' Note also that the unquoted text before the `=` sign inside the data.frame command specifies the names of the columns including the corresponding values after the `=` sign.
#' To see what's inside `mydataframe` we have to input the object name at the prompt:
mydataframe
#' 
#' Data frames are the representation of data in the format of a table where the
#' columns are vectors that all have the same length. Because columns are
#' vectors, each column must contain a single type of data (e.g., characters, integers, factors). 
#' 
#' Navigating your data frames can be accomplished with subscripts (i.e. the position of the desired value) within square `[]` brackets, for example: 
mydataframe[1, ] 
#' returns the first ROW of mydataframe; rows are BEFORE the comma.
mydataframe[, 1] 
#' returns the first COLUMN of mydataframe; columns are AFTER the comma.
mydataframe[1, 1] 
#' returns the value on the first row in the first column
#' 
#' You can also identify values using the column name, instead of or together with subscripts. For example:
mydataframe[, "some_characters"]
#' returns the entire column named "some_characters"
mydataframe[2, "some_characters"]
#' returns the second value of the column named "some_characters"
#' Note that:
mydataframe[3, "some_characters"]
#' returns an error because the is no third value in the column named "some_characters"
#' 
#'You can also call a column or a row by using the `$` sign after the data frame name followed by the column name:
mydataframe$some_numbers
#'
#' Finally, navigating objects with square `[]` brackets also works for vectors. 
#' The column named "some_numbers" inside "mydataframe" is a vector (we created it originally using the `c()` command); we can select values within it using square brackets:
mydataframe$some_numbers[1]
#' returns the first value
mydataframe$some_numbers[2]
#' returns the second value
mydataframe$some_numbers[c(1, 2)]
#' returns both values
#' 
#' Although it can be handy to create data frames from scratch like we did above, most commonly, we will want to load 
#' data frames from larger datasets somewhere on our computer or online. 
#' Data frames you can *import* data from your hard drive using the
#' functions `read.csv()` (which defaults to reading comma-separated files) or `read.table()`. There are also corresponding functions
#' for *exporting* data `write.csv()` (which defaults to writing comma-separated files) and `write.table()`.
#' Let's see how those work.
#+ eval = FALSE
write.csv(mydataframe, file = "mydataframe.csv")
#' exports the object mydataframe to a file called "mydataframe" with a ".csv" extension (that is a comma-separated text file).
#' But *where* was the file exported to?
#' 
#' R has a powerful notion of the *working directory*. 
#' This is a subfolder on your hard drive where R will by default put any files that you ask it to export or save, and look for files that you ask it to import. 
#' To find out what you current working directory is, you can use the command `getwd()`:
#+ eval = FALSE
getwd()
#' You can change your working directory by using `setwd()` using the form `setwd(subfolder_path)` where subfolder_path is the path to the subfolder you want to use as the main place R uses to import and export files.
#' 
#' Given that we have now exported the file "mydataframe.csv" to our working directory, we can now import it using `read.csv`:
#+ eval = FALSE
mydataframe2 <- read.csv(file = "mydataframe.csv")
mydataframe2
#' Note that we have assigned the imported file to a new object called "mydataframe2". Had we assigned it to the already used name "mydataframe", this would have *overwritten* the object instead of creating a new one.
#' Given that "mydataframe2" is a newly imported version of the exported "mydataframe", the two data frames should be identical. We can check this using the function `identical()`:
#+ eval = FALSE
identical(mydataframe, mydataframe2)
#' Nice!
#' 
#' **THE POWER OF R**
#' 
#' R enables you to run simple to complex to highly complex and *replicable* data analyses.
#' This means that you can string together a (potentially very) long series of commands and re-execute them all in the same order many times at the push of a button or with a single function call.
#' 
#' As we have seen, scripts like this one are one way of doing so.
#' To create a new script just go to the `File` menu and select `New File > R script`.
#' Write your scripts with comments (this is a comment) to document your work.
#' Try things at the prompt, then copy and paste things into your script that work.
#' You can run your script line-by-line by hitting CTL-Enter (PC) or CMD-Enter (MAC), or 
#' you can also run (or *source*) the entire scripts from the console using the form `source("script_name.R")`
#' 
#' Another way to string together commands you want to repeat over and over again without copy-and-pasting is *functions*.
#' Functions are defined and saved as objects within R's environment (that is, you can see them 
#' listed when you type `ls()`).
#' 
#' Functions allow you to automate common tasks in a more powerful and general way than copy-and-pasting. Writing a function has three big advantages over using copy-and-paste:
#' 1.  You can give a function an evocative name that makes your code easier to understand.
#' 2.  As requirements change, you only need to update code in one place, instead of many.
#' 3.  You eliminate the chance of making incidental mistakes when you copy and paste (i.e. updating a variable name in one place, but not in another).
#' 
#' If you find yourself copy-and-pasting a lot within your script code, you could probably replace that with a function.
#'
#' Let's define a simple function, for example:
square_a_number <- function(number){ number * number }
#' There are three key steps to creating a new function:
#' 
#' 1.  You need to pick a *name* for the function. Here we've used `square_a_number` because this function squares the value it is given as an argument.
#' 2.  You list the inputs, or *arguments*, to the function inside `function`.
#' Here we have just one argument. If we had more the call would look like
#' `function(argument1, argument2, argument3)`.
#' 3. You place the code you have developed in the *body* of the function, a `{}` block that immediately follows `function(...)`.
#' 
#' Let's test our "square_a_number" function:
#+ eval = FALSE
square_a_number(3) 
#' It works!
#' 
#' Using a combination of Scripts and Functions and the basic functions found in the 
#' base R distribution (e.g. `c()`, `read.csv` or `identical()`) you probably can accomplish anything you want in the realm of data
#' analysis and graphical data exploration. But why reinvent the wheel when someone else may have already put together the series of commands you need for your analysis? 
#' One of the true powers of R is the huge community of developers behind it (that includes you now too!).
#' Anyone who thinks they may have put together a series of commands (for example, to run a certain type of widespread model or to create a commonly used type of plot) 
#' which may be useful for others too can package those up in an R package.
#' R packages extend the functionality of R by providing additional functions, data, and documentation to what can be found in the base R installation. 
#' And the beauty of it is that it is all free and open to all!
#' 
#' To use a package, you first have to know about it. Find out by searching for it oonline or going to the
#' Comprehensive R Archive Network (CRAN) site:
browseURL("https://cran.r-project.org")
#' You might prioritize information gleaned also from *stack-overflow* (https://stackoverflow.com/) or other programming related message board search results.
#'
#' Once you know the name of the package you want to use (or several) you must first *install*
#' the package using the install.packages() function
#+ eval = FALSE
install.packages("dplyr")
#' If the package is included on the Comprehensive R Archive Network (CRAN) site,
#' R will install it directly with the function install.packages(); importantly, R will also check for dependencies (those are additional R packages needed for your R package of interest to work)
#' and will install those as well.
#'
#' Once installed, you'll want to *load* the package using the `library` function:
#+ eval = FALSE
library("dplyr")
#' Loading a package is like opening an app on your phone. Packages are not loaded by default when you start R on your computer; you need to load each package you want to use every time you start R.
#'
#' To learn more about your favorite package, use the ? function:
#+ eval = FALSE 
?dplyr
#' Or the `help()` function:
#+ eval = FALSE 
help(package = "dplyr")
#' You get the various functions defined for the package.  You may also need to look for
#' a 'how-to' or 'vignette' on the package to get some practice.
#'
#' As you go about your work using R you'll want to be aware that there are amazing packages that provide great functionality for building
#' your own efforts in R - most of what you will want to do is possible in R and there is probably a package for it already!
#'
#' **THE POWER of R^2^**
#' 
#' By now, you should be convinced that R is worth your time.
#' But what is even more incredible about R is that many people have begun to build packages that employ new programming paradigms.
#' Their is even an highly advanced integrated development environment (IDE) built to harness R.
#' You can learn about it here:
browseURL("https://www.rstudio.com")
#' Don't let the .com domain scare you away, the packages are open source and the tools are 'free'
#' for Academics and not-for-profits.
#'
#'Three of the main benefits are:
#' 1. Using the R-studio IDE for programming with R, works for individuals or groups,
#' integrates code repositories like GitHub
#' 2. Amazing R Packages that have become state-of-the-art:
#' See e.g. ggplot2 
browseURL("https://ggplot2.tidyverse.org")
#' for amazing plots or tidyr 
browseURL("https://tidyr.tidyverse.org")
#' for a whole new (and fast) way to work with data
#' including data frames on steroids called 'tibbles'.
#' 3. Ease of publishing dynamic web applications integrating data, text and graphics Shiny()!
#' See more on these advanced, new environments built to do more on top of R!
browseURL("https://www.rstudio.com/products/rstudio/")
#'
#' Finally, the pesky ' after the # (in other words #') allow us to compile this script to be human readable.
#' So try out the following commands (copy and paste them to the terminal, why don't I want them to be active here *extra credit*):
#' 
#' >install.packages("rmarkdown")
#' 
#' >library(rmarkdown)
#' 
#' >rmarkdown::render("Basic-R.R", "html_document")
#' 
#' Now the file "Basic-R.html" should be in your working directory.  Open it in your browser and check it out!
#' There is much, much, much more to explore about R; we are just getting started!
#' Thanks for reading!
#' 
#' Durrell D. Kapan and Giovanni Rapacciuolo,
#' Institute for Biodiversity Science and Sustainability,
#' California Academy of Sciences,
#' (2019-2020-2022).
#' 
#' CC license: Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)
#' 
#' https://creativecommons.org/licenses/by-nc-sa/4.0/
