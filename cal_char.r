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
res <- data.frame(matrix(rep(0, length(le)*3), ncol=3))
colnames(res) <- paste0('protein_', 1:ncol(res))
rownames(res) <- le

for (i in 1:nrow(dat)){
  l <- nchar(dat[i,1])
  c_1 <- substr(dat[i,1], 1, (round(l/3)))
  c_2 <- substr(dat[i,1], (round(l/3)+1), (round(l/3*2)))
  c_3 <- substr(dat[i,1], (round(l/3*2)+1), l)
  
  for 
}
