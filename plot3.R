# read only 2007-02-01 and 2007-02-02
sk = 66638 - 1
nr = 69517 - sk
sp = ";"
tb = read.table("household_power_consumption.txt", skip=sk, nrows=nr, sep=sp)
# fix column names
tn = read.table("household_power_consumption.txt", nrows=1, sep=sp)
tnames = as.character(unlist(tn))
names(tb) = tnames
# dates and time
dt = paste(as.character(tb$Date), as.character(tb$Time))
dtstrp = strptime(dt, "%d/%m/%Y %H:%M:%S")
tb$Date = as.Date(tb$Date)
tb$datetime = dtstrp
# device and plot
png(filename = "plot3.png")
with(tb, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", pch=".", col="black"))
with(tb, lines(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", pch=".", col="black"))
with(tb, lines(datetime, Sub_metering_2, xlab = "", ylab = "Energy sub metering", pch=".", col="red"))
with(tb, lines(datetime, Sub_metering_3, xlab = "", ylab = "Energy sub metering", pch=".", col="blue"))
legend("topright", pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()