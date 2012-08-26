roundStep<-function(x, step, start=0){
	if(missing(x)|missing(step))
		stop("Missing argument")
	return(round((x-start)/step)*step+start)
}
