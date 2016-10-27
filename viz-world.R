source ("R-vutils.git/cmds-inc.R")
source ("R-vutils.git/util-inc.R")
library (grid) # for "arrow" functionality, below

assign.if.undef ("SAVE.PDF", FALSE)

World <- read.csv ("world1.csv")

# Move coords to a more "natural" representation, with (0,0) as a lower-left origin
y.max <- with (World, max (c (Y1, Y2)))
World$Y1 <- y.max - World$Y1
World$Y2 <- y.max - World$Y2

# ===== Make a plot, using the ggplot2 package =====
Q <- ggplot (data=World, aes (x=X1, y=Y1))

# Streets:
Q <- Q + geom_segment (aes (xend=X2, yend=Y2, colour=as.factor (Capacity))
                     , data=subset (World, Type=="Street"))

# Parking lots:
Q <- Q + geom_point (aes (size=Capacity), data=subset (World, Type=="Parking"))
Q <- Q + geom_segment (aes (xend=X2, yend=Y2), data=subset (World, Type=="Parking"))

# Rich's preferred color scheme
Q <- set.hpcgarage.colours (Q)

setDevHD (l=8)
print (Q)
if (SAVE.PDF) { ggsave ("gt-world.pdf") }

# eof
