
## makeCachematrix function creates a special matrix object which caches its inverse.
## s <- NULL :sets the inverse of matrix to NULL as a placeholder for future value.
## set <- function(y) {x <<- y;s <<- NULL} defines a function to set the vector 
 ##  x to a new vector,y, and resets the inverse of matrix,s to NULL.
## get<-function()x returns the vector, x
##  setinverse <- function(solve) s<<- solve sets the inverse of matrix value,s,
 ## to solve function.
## getinverse <- function()s returns the inverse of matrix,s
## list(set = set, get = get,setinverse = setinverse,getinverse = getinverse)
## returns the special matrix object with the above four functions.



makeCacheMatrix <- function(x = matrix()) {
s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL

            }
        get <- function() x
        setinverse <- function(solve) s<<- solve
        getinverse <- function()s
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
       
        s <- x$getinverse() ## This retrieves the cached value for the inverse.
                            ## if the cached value is not null, return the inverse value.

         if(!is.null(s)) {
                message("getting cached data")
                return(s)
         }
       ## if the cache was null, the following set of functions calculates it,
        ##  cache it and returns the inverse value.

        data <- x$get()       ## gets the value of the matrix
        s <- solve(data, ...) ## calculates the inverse
        x$setinverse(s)       ## cache the inverse value.
        s                     ## returns the inverse value.

}
