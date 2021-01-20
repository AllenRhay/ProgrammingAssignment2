setwd('C:/Users/rubind1/Documents/Coursera-R')
##
## Set the input x as a matrix
## Then set the solved value "q" as a null
## Then change every reference to "mean" to "solve"
makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  q <- NULL
  set <- function(y) {
    x <<- y
    q <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) q <<- solve
  getsolve <- function() q
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
##
## Same here, change "mean" to "solve" and "m" to "s"
cacheSolve <- function(x, ...) {
  q <- x$getsolve()
  if(!is.null(q)) {
    message("getting inversed matrix")
    return(q)
  }
  data <- x$get()
  q <- solve(data, ...)
  x$setsolve(q)
  q
}
