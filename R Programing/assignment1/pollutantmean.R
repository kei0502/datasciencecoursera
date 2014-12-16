pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' 是长度为1的字符向量，指明
  ## CSV文件的位置
  
  ## 'pollutant' 是长度为1的字符向量，指明
  ## 污染物的名称，我们将会计算其
  ## 平均值; 要么是“硫酸盐(sulfate)”要么是“硝酸盐(nitrate)”
  
  ## 'id'是正整数向量，指明监测点的ID，
  ## 将要被要使用的
  
  ## 返回列表内的所有监测点的污染物平均值，
  ## “id”向量中的 (忽略 NA值)
  sum<-0
  length<-0
  for(i in id) {
    data <- read.csv(paste(directory,"/",formatC(i,width=3,flag="0"),".csv",sep=""))
    good <- is.na(data[,pollutant])
    data <- data[!good,]
    sum<-sum+sum(data[,pollutant])
    length<-length+nrow(data)
  }
  round(sum/length,digits=3)
}