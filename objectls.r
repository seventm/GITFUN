{
	.filteredls <- function (which=1, what="fun")
	{
		objects<-ls(pos=which)
		isfun<-vector("logical", length(objects))
		isnum<-vector("logical", length(objects))
		isclass<-vector("logical", length(objects))
		
		if(length(objects)==0){
			cat("No objects\n")
		} else {
			isfun<-unlist(lapply(1:length(objects), function(i){isfun[i]<-is.function(get(objects[i]))}))
			isnum<-unlist(lapply(1:length(objects), function(i){isnum[i]<-is.numeric(get(objects[i]))}))
			tmp<-c(1:length(objects))[!isfun&!isnum]
			isclass[tmp]<-unlist(lapply(tmp, function(i){
					isclass[i]<-isClass(get(objects[i]), where=which)
				}))
	
			if(what=="fun")
				print(objects[isfun])
			if(what=="var")
				print(objects[!isfun&!isclass])
			if(what=="class")
				print(objects[!isfun&isclass])
		}
	}

	setClass("fastFun2",representation(empty="logical"))
	setMethod("show","fastFun2",function(object){
			do.call(as.character(attr(object,"name")), attr(object,"options"))
		}
	)


	vls<-new("fastFun2")
	attr(vls,"name")<-".filteredls"
	attr(vls,"options")<-list(which=1, what="var")

	fls<-new("fastFun2")
	attr(fls,"name")<-".filteredls"
	attr(fls,"options")<-list(which=1, what="fun")

	classls<-new("fastFun2")
	attr(classls,"name")<-".filteredls"
	attr(classls,"options")<-list(which=1, what="class")
}
