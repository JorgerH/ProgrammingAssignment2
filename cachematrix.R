## Jorge Ruben Huerta Bedolla Programming Assignment 2

## These two functions are desgned to calculate the inverse matrix of a special matrix.
## These functions are special because they use the cache to look for the inverse matrix.
## If the inverse matrix was allready calculated it looks for the result in the chache.
## If the inverse matrix wax not calculated previously, it calculates it.

## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
## 1.set the value of the matrix
## 2.get the value of the matrix
## 3. set the value of the inverse matrix
## 4. get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        inv<-NULL
        set<-function(y){
                x<<-y
                inv<<-NULL
        }
        get<-function()x
        setinverse<-function(solve) inv<<-solve
        getinverse<-function()inv
        list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## The following function calculates the inverse matrix of the special "matrix" created with the above function.
##However, it first checks to see if the inverse matrix has already been calculated. 
##If so, it gets the inverse matrix from the cache and skips the computation. 
##Otherwise, it calculates the inverse matrix of the data and sets the value of the inverse matrix in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv<-x$getinverse()
        if(!is.null(inv)){
                message('getting cache data')
                return(inv)
        }
        data<-x$get()
        inv<-solve(data,...)
        x$setinverse(inv)
        inv
}
