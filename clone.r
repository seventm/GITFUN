clone<-function (oldname, newname, force = FALSE)
{
	oldname <- deparse(substitute(oldname))
	if(missing(newname)){
		newname<-paste(oldname,"clone",1,sep="_")
		if (exists(newname, envir = .GlobalEnv)) {
			varls<-ls(pattern=oldname, env=.GlobalEnv)
			tmp<-unlist(strsplit(varls[length(varls)], "_"))
			id<-as.integer(tmp[length(tmp)])+1
			newname<-paste(oldname,"clone",id, sep="_")
		}
	}else{
		newname <- deparse(substitute(newname))
	}
	if (!exists(oldname, envir = .GlobalEnv)) {
		stop(paste("Variable", oldname, "does not exist!"))
	}
	if (exists(newname, envir = .GlobalEnv)) {
		warning(paste("Variable", newname, "exist!"))
		if (force == FALSE) {
			ans <- readline(paste("Overwrite", newname, "variable? [Y|N]>"))
			if(toupper(ans)=="N"){
				return(invisible(FALSE))
			}
		}
	}
	assign(newname, get(oldname), envir = .GlobalEnv)
	cat(paste("Variable clone into", newname, "variable!\n"))
	invisible(TRUE)
}
