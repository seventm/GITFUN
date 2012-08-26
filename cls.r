{
	.cls<-function()
	{
		if(Sys.info()["sysname"]=="Linux")
			system("clear")
		if(Sys.info()["sysname"]=="Windows")
			system("cls")
	}

	setClass("fastFun",representation(empty="logical"))
	setMethod("show","fastFun",function(object){
			do.call(as.character(attr(object,"name")), list())
		}
	)
	cls<-new("fastFun")
	attr(cls,"name")<-".cls"
}
