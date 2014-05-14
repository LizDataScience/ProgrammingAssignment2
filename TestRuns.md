### Test Runs

This file contains sample test calls to makeCacheMatrix and cacheSolve that demonstrate 
those functions, as well as the extensions in matrixIsInvertible.


### Cases where the parameter is not invertible

> makeCacheMatrix(NULL)
the parameter is not a matrix


> makeCacheMatrix(1:3)
the parameter is not a matrix


> makeCacheMatrix(matrix())
the matrix contains missing values


> testm <- c(1:4, NA, 6:8, NA)
> dim(testm) <- c(3,3)
> makeCacheMatrix(testm)
the matrix contains missing values


> makeCacheMatrix(matrix(1:30, 3, 10))
the matrix is not square


> makeCacheMatrix(matrix(1:100, 10, 10))
the matrix is not invertible (the determinant is 0)


### Successful construction and usage

> l1 <- makeCacheMatrix(matrix(1:4, 2, 2))
> cacheSolve(l1)   ## the first time
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> cacheSolve(l1)   ## the second time
getting cached data
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
