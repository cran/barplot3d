## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  rgl::setupKnitr()
)

## ----echo=FALSE----------------------------------------------------------
set.seed(111)
## Detect if we're on Linux; if so, set the rgl device to NULL
## to prevent segfaults on Ubuntu on rhub
sysinfo=Sys.info()
if(sysinfo["sysname"]%in%"Linux"){
  options(rgl.useNULL=TRUE)
}


## ----rgl=TRUE,dev='png',fig.dim=c(7,3)-----------------------------------
## Load packages
library(rgl)
library(barplot3d)
## Make a very simple 3D barplot using mostly defaults
barplot3d(rows=1,cols=5,z=1:5,theta=10,phi=10)

## ----rgl=TRUE,dev='png',fig.dim=c(7,5)-----------------------------------
## Make a prettier 3D barplot with more advanced features
inputdata=round(rnorm(15,10,3))
barplot3d(rows=3,cols=5,z=inputdata,scalexy=5,alpha=0.4,theta=30,phi=50,
          topcolors=rainbow(15),xlabels = 1:5,ylabels=LETTERS[1:3],
          xsub="Numbers",ysub="Letters",zsub="Count")

## ----rgl=TRUE,dev='png',fig.dim=c(7,3)-----------------------------------
## Plot 3 rows of 4 bars
barplot3d(rows=3,cols=4,z=1:12,theta=10,phi=10,topcolors=rainbow(12),sidecolors=rainbow(12))

## ----rgl=TRUE,dev='png',fig.dim=c(7,3)-----------------------------------
## Plot the same data as 2 rows of 6 bars
barplot3d(rows=2,cols=6,z=1:12,theta=10,phi=10,topcolors=rainbow(12),sidecolors=rainbow(12))

## ----rgl=TRUE,dev='png',fig.dim=c(7,3)-----------------------------------
## Plot a zero-gapped 3D barplot
barplot3d(rows=1,cols=5,z=1:5,theta=10,phi=10,topcolors = rainbow(5),sidecolors = rainbow(5),gap=0)

## ----rgl=TRUE,dev='png',fig.dim=c(7,3)-----------------------------------
## Plot a skinny 3D barplot
barplot3d(rows=2,cols=6,z=1:12,theta=10,phi=10,topcolors=rainbow(12),sidecolors=rainbow(12),scalexy=0.5)

## ----rgl=TRUE,dev='png',fig.dim=c(7,3)-----------------------------------
## Plot a chubby 3D barplot
barplot3d(rows=2,cols=6,z=1:12,theta=10,phi=10,topcolors=rainbow(12),sidecolors=rainbow(12),scalexy=10)

## ----eval=FALSE----------------------------------------------------------
#  # The 4 arguments are the position (in pixels) of the left, top, right and bottom edges of the rgl viewing window
#  # This code leads to a plot that is 600 pixels wide and 400 pixels tall.
#  par3d(windowRect=c(0,50,600,450))
#  
#  # Save the current rgl view
#  rgl.snapsnot("filename.png")
#  
#  # If running multiple plots, you should close the viewing window
#  rgl.close()

## ----rgl=TRUE,dev='png',fig.dim=c(7,3)-----------------------------------
## Plot a partially transparent 3D barplot
barplot3d(rows=2,cols=3,z=1:6,theta=10,phi=10,topcolors=rainbow(6),sidecolors=rev(rainbow(6)),
          linecolors=6:1,alpha=0.3)

## ----rgl=TRUE,dev='png',fig.dim=c(7,8)-----------------------------------
## Plot with many labels
barplot3d(rows=2,cols=3,z=1:6,theta=30,phi=50,topcolors=rainbow(6),sidecolors=rainbow(6),
          xlabels = c("First","Second","Third"),ylabels=c("Front","Back"),
          xsub="Position",ysub="Row",zsub="Z")

## ----rgl=TRUE,dev='png',fig.dim=c(7,3)-----------------------------------
## Plot that's extremely plain
barplot3d(rows=2,cols=3,z=1:6,theta=30,phi=50,topcolors=rainbow(6),sidecolors=rainbow(6),
          gridlines = FALSE,zlabels=FALSE)

## ----rgl=TRUE,dev='png',fig.dim=c(7,5)-----------------------------------
# Read in COSMIC signature probabilities
x=system.file("extdata", "signature_probabilities.txt", package = "barplot3d")
sigdata=read.table(x,header=TRUE,stringsAsFactors = FALSE)

# Plot signature 2 without axis labels, with Sanger colors and some transparency so we can see all bars
legoplot3d(contextdata=sigdata$Signature_2,labels=FALSE,scalexy=0.05,sixcolors="sanger",alpha=0.4)

## ----rgl=TRUE,dev='png',fig.dim=c(7,5)-----------------------------------
# Plot signature 2 without axis labels, with Sanger colors and some transparency so we can see all bars
legoplot3d(contextdata=sigdata$Signature_8,labels=FALSE,scalexy=0.01,sixcolors="broad",alpha=0.4)

## ------------------------------------------------------------------------
# Input data MUST be in this order
cat(sigdata$Somatic_mutation_type,sep="\n")

