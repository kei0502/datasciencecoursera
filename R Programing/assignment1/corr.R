corr <- function(directory, threshold = 0) {
  ## 'directory' 是长度为1的字符向量，指明
  ##  CSV 文件的位置
  
  ## 'threshold' 是长度为1的数值向量，指明
  ## 完整观测的案例的数量 (针对所有
  ## 变量) 是必须的，为了计算这两个的相关性：
  ## 硝酸盐(nitrate)和硫酸盐(sulfate); 默认值为 0
  
  ## 返回相关性的数值向量
  result <- NULL
  cpl <- complete(directory)
  good <- cpl[,2] > threshold
  for(i in cpl[good,][,1]){
    data <- read.csv(paste(directory,"/",formatC(i,width=3,flag="0"),".csv",sep=""))
    ok<-complete.cases(data[,1],data[,2],data[,3],data[,4])
    data<-data[ok,]
    result <- c(result, cor(data[,2],data[,3]))
  }
  result
}