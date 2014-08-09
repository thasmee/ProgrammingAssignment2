## The  makeCacheMatrix function creates a matrix object that can cache its inverse 
## The input matrix is assumed to be a square matrix
#################################################### 
 makeCacheMatrix <- function(x = matrix()) {
-
+  s <- NULL
+  set <- function(y){
+    x <<- y
+    s <<- NULL
+  }
+  get <- function()x
+  setsolve <- function(solve)s <<- solve
+  getsolve <- function()s
+  list(set = set, get = get, setsolve = setsolve, getsolve =getsolve)
+  
 }
 
 

+## This function computes the inverse of the matrix returned if it has not been computed before
+##by the function makeCacheMatrix
 ################################################
 cacheSolve <- function(x, ...) {
-        ## Return a matrix that is the inverse of 'x'
+  ## Return a matrix that is the inverse of 'x'
+  s <- x$getsolve()
+  if (!is.null(s)) {
+    message("getting cashed data")
+    return(s)
+  }
+  data <- x$get()
+  s <- solve(data, ...)
+  x$setsolve(s)
 }
