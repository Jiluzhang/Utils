######################################### for JPP ################################
## input.txt
# ABABCBADBACCDA
# ACAADBACBBCCDABCDA
# DABADCACABDCDABDCABBAADCAC

library(stringr)
dat <- read.table('input.txt', stringsAsFactors=FALSE)

## concat all sequences
all <- ''
for (i in 1:nrow(dat))
  all <- str_c(all, dat[i,1])

## get unique letter
le <- c()
for (i in 1:nchar(all)){
  a <- substr(all, i, i)
  if (!(a %in% le)){
     le <- c(le, a)
  }
}

## calculate letter numbers
for (i in 1:nrow(dat)){
  res_tmp <- data.frame(matrix(rep(0, length(le)*3), ncol=3))
  colnames(res_tmp) <- paste0('p', i, '_', 1:ncol(res_tmp))
  rownames(res_tmp) <- le
  l <- nchar(dat[i,1])
  c_1 <- substr(dat[i,1], 1, (round(l/3)))
  c_2 <- substr(dat[i,1], (round(l/3)+1), (round(l/3*2)))
  c_3 <- substr(dat[i,1], (round(l/3*2)+1), l)
  for (j in le){
    res_tmp[j, 1] <- str_count(c_1, j)
    res_tmp[j, 2] <- str_count(c_2, j)
    res_tmp[j, 3] <- str_count(c_3, j)
  }
  if (i == 1){
    res <- res_tmp
  }else{
  res <- cbind(res, res_tmp)
  }
}

write.table(res, 'output.txt', sep='\t')
