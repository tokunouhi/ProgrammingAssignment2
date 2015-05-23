## The matrix and its inverse matrix will be cached as global variables.
##
## Global variables: GL_CacheMatrix, GL_CacheInverseMatrix
##


##  make a cache of the Matrix

makeCacheMatrix <- function(x = matrix()) {
  GL_CacheMatrix <<-x
}

## Solve the Matrix using cache 

cacheSolve <- function(x, ...) {
  if(!exists("GL_CacheMatrix")){
    GL_CacheMatrix<<-matrix()
    GL_CacheInverseMatrix <<- NULL
  }
  if(!identical(GL_CacheMatrix , x)){
    makeCacheMatrix(x)
    if(det(x)!=0){
      GL_CacheInverseMatrix <<- solve(x,...)
    }else{
      GL_CacheInverseMatrix <<- NULL
    }
  }
  return(GL_CacheInverseMatrix)        
}
