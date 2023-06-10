# read parameters
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
  stop("USAGE: Rscript data_process.R host_data.csv hostmap.csv outcome.csv", call.=FALSE)
}
# parse parameters
data.raw.fn <- args[1]
hostmap.fn <- args[2]
out.fn <- args[3]

# data.raw.fn <- '20230610031336-hosts_data.csv'
df <- read.csv(data.raw.fn)
# table(df$service)
# table(df$host)
# df[1,4]+df[2,4]
# hostmap[hostmap$host=='Host1','IP']
# df[df$host==c('192.168.0.180','192.168.0.190'),1]
# df$host==c('192.168.0.180','192.168.0.190')
# colnames(df)

# scores factor
scores.fac <- function(data){
  t.cp <- table(data$ctlPerf)
  cp.fac <- mean(t.cp*1:length(t.cp))
  wl.fac <- data$workload/-100
  cnt.fac <- data$count/-1.25
  ms.fac <- mean(data$ms)/-1.75
  return(sum(cp.fac,wl.fac,cnt.fac,ms.fac))
}

# df.1000 <- head(df,1000)
# scores <- c()
# # plus
# cp <- df.1000[df.1000$host=='192.168.0.180',"ctlPerf"]
# cp <- table(cp)
# mean(cp*1:3)
# table(df.1000[df.1000$host=='192.168.0.180',"ctlPerf"])*1:3
# # minus
# max(df.1000[df.1000$host=='192.168.0.180',"workload"])
# # minus
# max(df.1000[df.1000$host=='192.168.0.180',"count"])
# # minus
# ms <- df.1000[df.1000$host=='192.168.0.180',"ms"]
# ams <- mean(ms)

# alive if overnode
host.status <- function(n){
  s <- 1
  if (sum(n)>10) s <- 0
  return(s)
}

# hostmap.fn <- 'hostmap.csv'
hostmap <- read.csv(hostmap.fn)
# finish score calculation
# scores <- c()
for (hostip in unique(df$host)) {
  print(hostip)
  d.host <- df[df$host==hostip,]
  hostmap[hostmap$IP==hostip,"scores"] <- scores.fac(d.host)
  hostmap[hostmap$IP==hostip,"status"] <- host.status(d.host$node)
  # scores <- c(scores, scores.fac(d.host))
  # print(scores)
}
write.csv(hostmap, file = hostmap.fn, row.names = FALSE)

# hostmap$status <- 0
# hostmap$status <- c(rep(1,14),0,0,0)
# choos available host
h.s.1 <- hostmap[hostmap$status==1,]
candi.ip <- c()
for (host.main in unique(hostmap$host)) {
  print(host.main)
  h.sec <- h.s.1[h.s.1$host==host.main,]
  print(h.sec)
  print(h.sec$IP[which.max(h.sec$scores)])
  candi.ip <- c(candi.ip, h.sec$IP[which.max(h.sec$scores)])
}

# out.fn <- 'outcome.csv'
out <- read.csv(out.fn)
out$priIP <- h.s.1[candi.ip,"IP"]
write.csv(out, file = out.fn, row.names = FALSE)
