**_rtemis_** Machine Learning and Visualization
===============================================
A platform for advanced Machine Learning research and applications.  
The goal of rtemis is to make data science as efficient and as painless as possible, whether you are an expert or a novice.  
__rtemis__ is built using the R6 class system in a highly modular fashion.  
The site in the link below is a work in progress in its early days showing how to use the package and is, like the package itself, under active development.

<div style="text-align:center">
<a href="https://rtemis.netlify.com">
<img align = "center" src="https://egenn.github.io/imgs/rtemis_logo.png">
</a>    
</div>

[__Online Documentation and vignettes__](https://rtemis.netlify.com)

### Installation
```r
devtools::install_github("egenn/rtemis")
```

### What's new
* __v. 0.78__: First public release, April 2019

### Features
* __Visualization__
     - Static: **_mplot3_** family (base graphics)
     - Dynamic: **_dplot3_** family ([plotly](https://plot.ly/r/))
* __Unsupervised Learning__
     - Clustering: **_u.\*_**
     - Decomposition: **_d.\*_**
* __Supervised Learning__
     - Classification, Regression, Survival Regression: **_s.\*_**
* __Cross-Decomposition__
     - Sparse Canonical Correlation / Sparse Decomposition: **_x.\*_**
* __Meta-Models__  
     [Have been removed temporarily for updating]
     - Model Stacking: **_metaMod()_**
     - Modality Stacking: **_metaFeat()_**
     - Group-weighted Stacking: **_metaGroup()_**

### Ongoing work
* Novel algorithms developed in __rtemis__ will be generally added to this public repository as soon the corresponding paper is published.
* R Documentation is ongoing and should be completed soon.
* __rtemis__ is under active development with lots of enhancements and extensions planned

<a href="https://rtemis.netlify.com">
<img align = "center" src="https://egenn.github.io/imgs/rtemis.png">
</a>

---
2019 Efstathios D. Gennatas  
