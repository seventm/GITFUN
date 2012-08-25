splitFile<-function(filename, each=50000){
	c = 1
	infl <- file(filename,"r")
	while(length(line<-readLines(infl,n=each))>0)
	{
		outfl<-file(paste(filename,"_",c,sep=""),"w")
		writeLines(line, outfl)
		close(outfl)
		c=c+1
	}
	close(infl)
	print(paste("File splitted into",c-1, filename,sep=" "))
	return(TRUE)
}
