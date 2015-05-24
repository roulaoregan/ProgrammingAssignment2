## x <- makeCacheMatrix(matrix(c(val1,val2,val3...), ncol=numofvals/2)) that can cache its inverse.
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse of the matrix
## get the value of the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  set_inverse <- function(inverse) inv <<- inverse
  get_inverse <- function() inv
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}


## cacheSolve: This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not 
## changed), then cacheSolve should retrieve the inverse from the cache.
## Pre-condition: assume that the matrix supplied is always invertible.
## Post-condition: computes the inverse of a square matrix using R's built in function solve()
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  #pre-condition: assume that the matrix supplied is always invertible.
  inv <- x$get_inverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$set_inverse(inv)
  inv
}
