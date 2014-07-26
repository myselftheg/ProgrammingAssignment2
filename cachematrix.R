## Caching the inverse of matrix
## It provides a list object which can cache the inverse of matrix. 
## So if its needed again, the inverse needn't be recomputed, instead inverse can be accessed from cache

## Make Cache Matrix is used to return the new object which can handle the creation of cached Matrix.
## Call this function to create the new inverse cache enabled matrix.
## No.Of Arguments:1; Argument_1: matrix();. Return Type: list()

makeCacheMatrix <- function(x = matrix()) {
inverse_x<-NULL
set<-function(y){
	x<<-as.matrix(y)
	inverse_x<<-NULL
}
get<-function()x
setInverse<-function(y)inverse_x<<-as.matrix(y)
getInverse<-function()inverse_x

list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
}

## After creating a object using makeCacheMatrix. Call cacheSolve to get inverse of the object. 
## No. Of Arguments:1; Argument_1=makeCacheMatrix(); ReturnType=matrix()
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m<-x$getInverse()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
	}
	data<-x$get()
	m<-solve(data)
	x$setInverse(m)
	m
}
