complete<- function(directory, id = 1:332){
    filelist <- list.files(path = directory,pattern = ".csv",full.names = TRUE)
    result <- data.frame()
    mydata_1.list <- lapply(filelist, read.csv)
    mydata_1.cat <- do.call(rbind, mydata_1.list)
    mydata <- mydata_1.cat
    
    for(i in id){
        selected_data <- mydata[is.element(mydata$ID, i),]
        
        filtered_data <- complete.cases(selected_data)
        
        nobs <- sum(complete.cases(selected_data))
        
        result <- rbind(result,c(i,nobs))
    }
    
    colnames(result) <- c("id","nobs")
    
    result
}

