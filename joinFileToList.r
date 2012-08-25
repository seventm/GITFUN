joinFileToList<-function(path="./",filename,separator=";"){
	Fnm<-length(dir(path=path,pattern=paste(filename,"_","[0-9]",sep="")))
	splToList<-list()
#	if(Fnm==0)
#		return(FALSE)
	for(i in 1:Fnm)
	{
		splToList[[i]]<-read.table(paste(path,filename,"_",i,sep=""),sep=separator)
	}
	return(splToList)
}

