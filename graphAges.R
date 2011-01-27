ages <- read.table('ages.csv', header=T, sep=',')
champs <- read.table('champs_NBA.csv', header=T, sep=',')

m <- merge(ages, champs)

plot( ages$Year, ages$Age, col="white")
points(m$Year, m$Age, col="blue")
text(m$Year, m$Age, m$Team, offset=0.5)
champs <- read.table('champs.csv', header=T, sep=',')

m <- merge(ages, champs)
x <- c(24:32)

pdf(file='/home/idris/work/nba/champ_age/graphs/NBA_ages.pdf')
plot( ages$Year, ages$Age, col="white", ylim=c(24,32), xlab="Year", ylab='Weighted Age', main='NBA Champ Team Age', yaxt='no')
#points(m$Year, m$Age, col="blue")
axis(2, at=seq(24,32,1))
abline(23, 0,lty=3, lwd=1)
abline(25, 0,lty=3, lwd=1)
abline(27, 0,lty=3, lwd=1)
abline(29, 0,lty=3, lwd=1)
abline(31, 0,lty=3, lwd=1)


text(m$Year, m$Age, m$Team, offset=2, cex=0.5)
grid(NA, NULL,lwd=1, col=1, lty=3)
dev.off()
