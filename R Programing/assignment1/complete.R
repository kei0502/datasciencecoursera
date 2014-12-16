complete <- function(directory, id = 1:332) {
  ## 'directory' 是长度为1的字符向量，指明
  ##  CSV 文件的位置
  
  ## 'id' 是正整数向量，指明监测点的ID号，
  ## 将要被使用的
  
  ## 返回以下格式的数据帧：
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## 其中'id' 是监测点ID编号，而'nobs'是
  ## 完整案例的数量
  result<-NULL
  for(i in id) {
    data <- read.csv(paste(directory,"/",formatC(i,width=3,flag="0"),".csv",sep=""))
    ok<-complete.cases(data[,1],data[,2],data[,3],data[,4])
    result<-c(result,sum(ok))
  }
  data.frame(id=id,nobs=result)
}