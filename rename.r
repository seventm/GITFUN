rename<-function (oldname, newname, force = FALSE)
{
	newname <- deparse(substitute(newname))
	oldname <- deparse(substitute(oldname))
	if (!exists(oldname, envir = .GlobalEnv)) {
		stop(paste("Variable", oldname, "does not exist!"))
	}
	if (exists(newname, envir = .GlobalEnv)) {
		warning(paste("Variable", newname, "exist!"))
		if (force == FALSE) {
			ans <- readline(paste("Overwrite", newname, "variable? [Y|N]>"))
			if(toupper(ans)=="N")
				return(invisible(FALSE))
    		}
    	}
	assign(newname, get(oldname), envir = .GlobalEnv)
	rm(list = as.character(get("oldname")), envir = .GlobalEnv)
	invisible(TRUE)
}

