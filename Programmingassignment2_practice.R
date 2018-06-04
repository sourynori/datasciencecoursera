makeMatrix <- function(x = numeric()) {
    mI <- NULL
    set <- function(y) {
        if(nrow(y)!=ncol(y))
        {return(message("Please provide a square matrix."))}
        
        x <<- y
        mI <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse_matrix) mI <<- inverse_matrix
    getInverse <- function() mI
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

cacheInverse <- function(x, ...) {
    mI <- x$getInverse()
    if(!is.null(mI)) {
        message("getting cached data")
        return(mI)
    }
    data <- x$get()
    mI <- solve(data, ...)
    x$setInverse(mI)
    mI
}