## The functions below is an example how one can take advantage of the scoping rules of the R language - rules that determine how values are assigned to free vraiables. 
## The functions below deals with the creation of a matrix, storing it in a special vector, then, calculating and caching its inverse. The inverse can then later on be called from the cache if the special vector is the same as defined earlier, if not, the inverse is caluclated and displayed for the new special vector. 

## The first function mainly has four subfuctions: set function when called along with an input matrix as the argument would assign x the value of the matrix; the get function when called displays the matrix; setinverse then allows the user to define the inverse of the matrix which is then stored in m; on calling the getinverse function the inversed matrix is diplayed.    

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
  	set <- function(y) {
    	x <<- y
    	m <<- NULL
  	}
  	get <- function() x
  	setinverse <- function(solve) m <<- solve
  	getinverse <- function() m
  	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## The second function has two main parts; if inverse of a cached matrix is demanded or, if the inverse of a new matrix is demanded. In the former case, the inverse of the matrix is called from the makeCacheMatrix function and is stored in a vector m, which is then returned (displayed) if its value is not null. The latter part goes on to calculate the inverse of the new matrix and display the calculated inverse. 

cacheSolve <- function(x, ...) {
	
    m <- x$getinverse()
 	if(!is.null(m)) {
    	message("getting cached data")
  	  return(m)
 	 }
  	data <- x$get()
 	m <- solve(data, ...)
  	x$setinverse(m)
  	m
}
