## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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
## Write a short comment describing this function
}

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
