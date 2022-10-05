accident <- c(31, 26, 42, 47, 50, 54, 70, 66, 43, 32, 32, 22);
names(accident) <- c('M1', 'M2', 'M3', 'M4', 'M5', 'M6', 'M7', 'M8','M9', 'M10', 'M11', 'M12')

accident

sum(accident)

max(accident)
min(accident)

accident*0.9

accident[accident>=50]

month.50 <- accident[accident>=50]
names(month.50)
names(accident[accident>=50])

length(accident[accident<50])