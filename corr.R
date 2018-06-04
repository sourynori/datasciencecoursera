corr<- function(directory, threshold = 0){
    filelist <- list.files(path = directory,pattern = ".csv",full.names = TRUE)
    result <- c()
    
    for(i in 1:332){
        filename <- filelist[i]
        mydata <- read.csv(filename,header=TRUE,sep = ",")
        nobs <- sum(complete.cases(mydata))
        if(nobs>threshold){
            filtered_data<- mydata[complete.cases(mydata),]
            correlation <- cor(filtered_data$sulfate,filtered_data$nitrate)
            result <- c(result,correlation)
        }
    }
    
    if(length(result) > 0)
    {result}
    else{c()}

    
    # mydata_1.list <- lapply(filelist, read.csv)
    # mydata_1.cat <- do.call(rbind, mydata_1.list)
    # mydata <- mydata_1.cat
    # 
    # for(i in 1:332){
    #     selected_data <- mydata[is.element(mydata$ID, i),]
    #     
    #     nobs <- sum(complete.cases(selected_data))
    #     
    #     if(nobs>threshold){
    #         filtered_data<- selected_data[complete.cases(selected_data)]
    #         correlation <- cor(filtered_data$sulfate,filtered_data$nitrate)
    #         result <- c(result,correlation)
    #     }
    # }
    
}
corr("C:\\users\\snori\\Documents\\datasciencecoursera\\Course_Documents\\specdata",1000)