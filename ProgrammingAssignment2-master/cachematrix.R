## setmat() sets the matrix taken from argument and assigns its 
## inverse NULL
## getmat() returns the matrix set in first function
## solinv() stores the argument(solved inverse) to the inverse
## getinv() return the inverse

## Creates a list of four functions to set a matrix, to get a matrix, 
## to sol for its inverse and get that inverse

makeCacheMatrix<-function(a=matrix()){
  i<-NULL
  setmat<-function(b){
    a<<-b
    i<<-NULL
  }
  getmat<-function()a
  solinv<-function(sol)i<<-sol
  getinv<-function()i
  list(setmat=setmat, getmat=getmat, solinv=solinv, getinv=getinv)
}

## gets the list created by the above function as argument to 
## calculate the inverse of a matrix if not found in the 
## environment

cacheSolve<-function(a, ...){
  i<-a$getinv()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  b<-a$getmat()
  i<-solve(b, ...)
  a$solinv(i)
  i
}
