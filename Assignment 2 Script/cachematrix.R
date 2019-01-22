## Following functions will cache the inverse of the matrix
##If the inverse has already been calculated, function should retrieve the inverse from cache

# makeCacheMatrix makes a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  v_inverse <- NULL
  set <- function(y) {
    x <<- y
    v_inverse <<- NULL
  }
  get <- function() x
  setInverse <- function(Inverse) v_inverse <<- Inverse
  getInverse <- function() v_inverse
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

# The following function returns the inverse of the matrix. if the inverse has already been computed, 
#it skips the computation and retrives the result from cache. Otherwise, it calculates the inverse, 
#sets the value in the cache via setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  v_inverse <- x$getInverse()
  if(!is.null(v_inverse)) {
    message("getting cached data")
    return(v_inverse)
  }
  data <- x$get()
  v_inverse <- solve(data, ...)
  x$setInverse(v_inverse)
  v_inverse
}
