## create a special matrix to cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    ## set the value of the matrix
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    ## get the value of the matrix
    get <- function() x
    ## set the value of the inverse
    setinverse <- function(inverse) i <<- inverse
    ## get the value of the inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse) 
}

## computes the inverse of the special matrix
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    m <- x$getinverse()
    ## if the inverse has been calculated and cached, return cached data
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    ## compute the inverse of a square matrix
    m <- solve(data, ...)
    ## cache the calculation
    x$setinverse(m)
    m
}
