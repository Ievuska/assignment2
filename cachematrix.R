## Programming assignment for R programming, Coursera
## Returning an inverse matrix from a cached object in R. This can save computation time greatly. 

## The first function below, "makeCacheMatrix", sets and gets values in a matrix and then 
## sets and gets values of inverse of the matrix. 

makeCacheMatrix <- function(x = matrix()) {
   inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## The second function, "cacheSolve" return the inverse of the created matrix. 
## It check first if the inverse has already been computed. If so, it returns this value. 
## If not, it will compute the inverse and set values in the cache using setinverse function. 

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data.")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv
} 
