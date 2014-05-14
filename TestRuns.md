### Test Runs

This file contains sample test calls to makeCacheMatrix and cacheSolve that demonstrate 
those functions, as well as the extensions in matrixIsInvertible.


### Cases where the parameter is not invertible

1. \> makeCacheMatrix(NULL)  
    the parameter is not a matrix
 
2. \> makeCacheMatrix(1:3)  
    the parameter is not a matrix

3. \> makeCacheMatrix(matrix())  
    the matrix contains missing values

4. \> testm <- c(1:4, NA, 6:8, NA)  
   \> dim(testm) <- c(3,3)     
   \> makeCacheMatrix(testm)     
   the matrix contains missing values

5. \> makeCacheMatrix(matrix(1:30, 3, 10))  
    the matrix is not square

6. \> makeCacheMatrix(matrix(1:100, 10, 10))  
    the matrix is not invertible (the determinant is 0)


### Successful construction and usage

    > m <- makeCacheMatrix(matrix(1:4, 2, 2))  
    > cacheSolve(m)            ## the first time  
          [,1] [,2]  
    [1,]   -2  1.5  
    [2,]    1 -0.5  

    > cacheSolve(m)            ## the second time  
    getting cached data  
        [,1] [,2]    
    [1,]   -2  1.5  
    [2,]    1 -0.5  

