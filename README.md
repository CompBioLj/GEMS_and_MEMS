# MEMs and GEMs

This repository is supplementing the paper Guided extraction of genome-scale metabolic models for the integration and analysis of omics data. 

## Main files
The main files are as follows:
* [```01_1_PCA.ipynb```](01_1_PCA.ipynb): performs the PCA analysis on the models obtained with a selected MEM.
* [```01_2_PCA_extended.ipynb```](01_2_PCA_extended.ipynb): performs the PCA analysis on the models obtained with all MEMs.
* [```02_tSNE.ipynb```](02_tSNE.ipynb): performs the t-SNE analysis on the models obtained with all MEMs.
* [```03_ANOVA.ipynb```](03_ANOVA.ipynb): ANOVA and randomization test upon different model groups on different factors. All groups are compared at the same time. Identification of metabolic reactions that are significantly changed between the groups.
* [```04_ANOVA_enrichment.ipynb```](04_ANOVA_enrichment.ipynb): metabolic subsystem enrichment analysis performed on the results of ANOVA/randomization analysis.
* [```05_test_pairs```](05_test_pairs): pairwise comparisons between different groups - only two groups are compared at the same time. Identification of metabolic reactions that are significantly changed between two groups.
* [```06_pairs_enrichment.ipynb```](06_pairs_enrichment.ipynb): metabolic subsystem enrichment analysis performed on the results of pairwise comparisons between different groups.
* [```jaccardIndex.R```](jaccardIndex.R): calculated jaccard indeces. 
