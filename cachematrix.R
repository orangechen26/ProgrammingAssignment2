## Put comments here that give an overall description of what your
## functions do

## The first function makeCacheMatrix creates a speical "vector".
# which is really a list containing four functions. 

makeCacheMatrix <- function(myX = matrix()) {
    myM <- NULL
    set <- function(y) {
        myX <<- y
        myM <<- NULL
    }
    get <- function() myX
    setsolve <- function(mySolve) myM <<- mySolve
    getsolve <- function() myM
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## First check if the inverse has been calculated. Then decide what to do

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
