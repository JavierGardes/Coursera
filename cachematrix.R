makeCacheMatrix <- function(x = matrix()) {
    cache<- NULL
    set <- function(y) {
      x <<- y
      cache <<- NULL
      }
  get <- function() x
  setinverse <- function(inverse) cache <<- inverse
  getinverse <- function() cache
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
  cache <- x$getinverse()
  if (!is.null(cache)) {
    message("getting cached data")
    return(cache)
  }
  data <- x$get()
  cache <- solve(data, ...)
  x$setinverse(cache)
  cache
}
