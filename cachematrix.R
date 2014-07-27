## This code computes the invese of a invertible square matrix
## Lexical scoping enabled 

## This function creates a matrix object that can cache its inverse 

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y){
    x <<- y
    s <<- NULL
  }
  get <- function()x
  setsolve <- function(solve)s <<- solve
  getsolve <- function()s
  list(set = set, get = get, setsolve = setsolve, getsolve =getsolve)
  
}


## This function computes the inverse of the matrix returned 
##by the function makeCacheMatrix

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if (!is.null(s)) {
    message("getting cashed data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
}
