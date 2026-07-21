###############################
# SOFTWARE SECURITY ARCHITECTURE
###############################

par(bg="white", mar=c(2,2,2,2))

plot(0,0,
     type="n",
     xlim=c(0,12),
     ylim=c(0,12),
     axes=FALSE,
     xlab="",
     ylab="",
     main="Software Security Threat Propagation Architecture")

# Function to draw a box
boxNode <- function(x1,y1,label,color){
  rect(x1-1,y1-0.4,x1+1,y1+0.4,
       col=color,
       border="black",
       lwd=2)
  text(x1,y1,label,font=2,cex=0.8)
}

# Draw Components
boxNode(6,11,"Internet","skyblue")
boxNode(6,9.5,"Firewall","orange")
boxNode(6,8,"IDS / IPS","gold")
boxNode(6,6.5,"Threat Analyzer","tomato")
boxNode(6,5,"Risk Engine","pink")
boxNode(3,3.5,"Web Server","lightgreen")
boxNode(9,3.5,"Database","lightgreen")
boxNode(6,2,"Monitoring Dashboard","cyan")

# Connections
arrows(6,10.6,6,9.9,length=0.12,lwd=2)
arrows(6,9.1,6,8.4,length=0.12,lwd=2)
arrows(6,7.6,6,6.9,length=0.12,lwd=2)
arrows(6,6.1,6,5.4,length=0.12,lwd=2)

arrows(5.6,4.6,3.5,3.9,length=0.12,lwd=2)
arrows(6.4,4.6,8.5,3.9,length=0.12,lwd=2)

arrows(3,3.1,5.3,2.4,length=0.12,lwd=2)
arrows(9,3.1,6.7,2.4,length=0.12,lwd=2)

# Threat Path (Red Dashed Line)
segments(2,11,6,11,col="red",lwd=3,lty=2)
text(1.2,11,"Attacker",col="red",font=2)

arrows(2.5,11,5,11,col="red",length=0.12,lwd=2)

# Legend
legend("bottomleft",
       legend=c("Normal Flow","Threat Path"),
       col=c("black","red"),
       lwd=2,
       lty=c(1,2),
       bty="n")

# Footer
text(6,0.7,
     "Architecture for Software Security Threat Propagation Simulation",
     col="blue",
     font=2)
