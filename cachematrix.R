## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL ##creatubg null matrix
  
  ## creating list of functions
  set <- function(y) {
    x <<- y              
    m <<- NULL
  }
  get <- function() x           ## function to extract inverse from cache
  setinverse <- function(solve) m <<- solve    ## place for new inverse
  getinverse <- function() m   ## function to extract new inverse
  list(set = set, get = get,         ##listing functions
       setinverse = setinverse,
       getinverse = getinverse)
}

cacheSolve <- function(x, ...) {  
  m <- x$getinverse()   ##extracting inverse from cache
  if(!is.null(m)) {          ##checking for previously existing inverse
    message("getting cached data") 
    return(m)
  }
  data <- x$get()   ##object for new matrix
  m <- solve(data)
  x$setinverse(m)
  m                 ##output
}