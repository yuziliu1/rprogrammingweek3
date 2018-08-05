## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
  set <- function(y) {
          x <<- y
          m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
m <- x$getinverse()
  if (!is.null(m)) {
          message("getting cached data")
          return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
        ## Return a matrix that is the inverse of 'x'
}

solution:
 source("cachematrix.R")
> B <- matrix(c(1,2,3,4),2,2)
> B1 <- makeCacheMatrix(B)
> cacheSolve(B1)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
