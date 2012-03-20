#SevenTM 20-03-2012
#Spliter ver 0.0.1
#Spliting columns by sign or string

spliter<-function(x, col, sep=";"){
	tmp<-strsplit(as.character(x[,col]),sep,)
	colMax<-max(unlist(lapply(tmp, length)))
	tmp<-lapply(tmp, eval('length<-'), colMax)
	tmp<-do.call(rbind, tmp)
	res<-data.frame()
	res<-x[,-col]
	CN<-c(colnames(x)[-col], paste(colnames(x)[col], 1:colMax, sep='.'))
	res<-cbind(res, tmp)
	colnames(res)<-CN
	return(as.data.frame(res))
}
