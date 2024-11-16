# Print Text

print("Hello World!")

# Add 2 numbers 5 + 5
5 + 5

# Plot a simple graph
plot(1:10)

# For Loop
for (x in 1:10) {
  print(x)
}

# Assign and print a variable
name <- "Johnny"
print(name)

# Concat strings
text1 <- "R is"
text2 <- "awesome"

paste(text1, text2)

# Assign the same value to multiple variables simultaneously
varA <- varB <- varC <- "Family"
print(varA)
print(varB)
print(varC)

# Check data type of variable
class("Hello")
class(10.5)
class(10L)
class(1i)

# Built-in functions
max(45, 1, 29)
min(45, 1, 29)
sqrt(16)
abs(-17.3)
ceiling(1.2)
floor(1.9)

# Multi-line string with line breaks where they are in code
str <- "Lorem ipsum dolor sit amet,
consectetur adipiscing elit,
sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua."

cat(str)

# length of string
nchar(str)

# grepl func to check string for sequence
grepl("Lorem", str)

# create function and global variable inside function
my_function <- function() {
txt <<- "GlobalVar"
  print("Hello World!")
}

my_function()

print(txt)
