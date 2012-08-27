reduceblanks<-function(x, reductor="\t"){
        return(gsub("[[:blank:]]+", reductor, x))
}


