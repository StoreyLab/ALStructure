# alstructure
An R package that implements the ALStructure algorithm for estimating the admixture model of genetic population structure

The corresponding manuscript:

Irineo Cabreros and John D. Storey. A nonparametric estimator of population structure unifying admixture models and principal components analysis. *bioRxiv*, https://www.biorxiv.org/content/early/2017/12/29/240812.

To install in R do:

```
library("devtools")
install_github("storeylab/alstructure", build_vignettes=TRUE)
```

To get started, read the vignette:

```
library("alstructure")
vignette("ALStructure_workflow", package="alstructure")
```
