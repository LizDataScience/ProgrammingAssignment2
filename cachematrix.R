## Create and use an extended matrix object that maintains the current values of the
## matrix and its inverse.  As long as the matrix is unchanged, the inverse is provided
## from the cached value, avoiding a time-consuming recalculation.


## =========================================================================================
## makeCacheMatrix creates an extended matrix object that can cache its inverse value.
## The object is a list of 4 functions to set/get the matrix, and set/get the inverse.
##
## NOTE - makeCacheMatrix extends the original assignment by checking that the input 
##        parameter is an invertible matrix.  [ see matrixIsInvertible below ]
##        If the test passes, this function returns an extended matrix list object.  
##        Otherwise, an explanation of the failure is printed and the function returns NULL.

makeCacheMatrix <- function(x) {
   
    ## determine whether the passed parameter is an invertible matrix
    value <- matrixIsInvertible(x)
    
    if (value == TRUE) {  ##  then build the cached matrix object
        
        ## place to store the matrix inverse
        inverse <- NULL
        
        ## function to set the matrix value
        set <- function(y) {
            x <<- y
            inverse <<- NULL
        }
        
        ## function to get the matrix value
        get <- function() x
        
        ## function to set the inverse matrix value
        setinverse <- function(invertedm) inverse <<- invertedm
        
        ## function to get the inverse matrix value
        getinverse <- function() inverse
        
        ## create the "API" list of functions
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
    }
    else {
        ## explain why the passed parameter failed
        message (value)
    }
}


## =========================================================================================
## cacheSolve computes the inverse of the extended matrix object returned by makeCacheMatrix.
## If the inverse has already been calculated (and the matrix has not changed), then the
## function returns the cached value.  Otherwise, it calculates and returns the matrix
## inverse, storing the result for future use.

cacheSolve <- function(x) {
    
    ## check for a cached value of the inverse
    i <- x$getinverse()

    ## there is a cached value, return it
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }

    ## otherwise, calculate the inverse of the matrix
    m <- x$get()
    i <- solve(m)
    
    ## and store the inverse for future use
    x$setinverse(i)
    
    return(i)
}


## =========================================================================================
## matrixIsInvertible determines whether the passed parameter is a matrix that 
## can be inverted by testing that (1) m is a matrix, (2) m does not contain missing
## values, (3) m is square, and (4) the determinant of m is not 0.
##
## the function returns TRUE if all tests pass, or an explanation string otherwise.

matrixIsInvertible <- function(m) {
    
    ## check that the parameter is a matrix
    if(!is.matrix(m)) {
        return("the parameter is not a matrix")
    }
    else {
        ## check that the matrix does not contain missing values
        if (length(which(is.na(m))) != 0) {
            return("the matrix contains missing values")
        }
        else {
            ## check that the matrix is square
            d = attributes(m)$dim
            if (!(d[1] == d[2])) {
                return("the matrix is not square")
            }
            else {
                ## check that the determinant is non-zero
                if (det(m) == 0) {
                    return("the matrix is not invertible (the determinant is 0)")
                }
                else {
                    return(TRUE)
                }
            }           
        }
    }  
}

