pollutantmean<-function(directory,pollutant,id = 1:332){
    filelist <- list.files(path = directory,pattern = ".csv",full.names = TRUE)
    
    mydata_1.list <- lapply(filelist, read.csv)
    mydata_1.cat <- do.call(rbind, mydata_1.list)
    
    mydata <- mydata_1.cat
    
    selected_data <- mydata[is.element(mydata$ID, id),]
    pollutant_mean <- mean(selected_data[[pollutant]],na.rm = TRUE)
    print(pollutant_mean)
}

pollutantmean("C:\\users\\snori\\Documents\\datasciencecoursera\\Course_Documents\\specdata","nitrate")