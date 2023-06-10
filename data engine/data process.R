df <- read.csv('20230608234806-hosts_data.csv')
# table(df$service)
# table(df$host)
# df[1,4]+df[2,4]
# hostmap[hostmap$host=='Host1','IP']
# df[df$host==c('192.168.0.180','192.168.0.190'),1]
# df$host==c('192.168.0.180','192.168.0.190')
# colnames(df)
# scores factor
scores.fac <- function(data){
  cp.fac <- mean(table(data$ctlPerf)*1:3)
  wl.fac <- data$workload/-100
  cnt.fac <- data$count/-1.25
  ms.fac <- data$ms/-1.75
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

scores <- c()
for (hostip in unique(df$host)) {
  print(hostip)
  d.host <- df[df$host==hostip,]
  scores <- c(scores, scores.fac(d.host))
  print(scores)
}

hostmap <- read.csv('hostmap.csv')
hostmap$scores <- scores
write.csv(hostmap, file = 'hostmap.csv')
hostmap$status <- c(1,1,1,1,1,1,0,0)
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
out <- read.csv('outcome.csv')
out$priIP <- candi.ip
write.csv(out, file = 'outcome.csv', row.names = FALSE)
