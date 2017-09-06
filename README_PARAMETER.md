# Parameter file
In the parameter file, each parameter is specified in a line with the parameter name at the beginning followed by paremeter value. The parameters are: 
* **Input and output**: 
  * *PHYTREE_FILE*: the path of Phylogeny (.mod)  
  * *SEG_FILE*: the path of bed file for genomic regions
  * *ALIGN_FILE*: the path of multiple alignment file (.fasta)
  * *RESULT_PREFIX*: the prefix for output files
  * *ID_FILE* (optional): only compute elements in this file. (The element is tagged by its order in the input bed file starting from 0). If not specified, the program will compute all elements in the input file.  
  * *RESULT_INDIV* (optional): the prefix for outputing MCMC trace for each element if set verbose= T.
  * *VERBOSE*: if it's true, the algorithm will output some intermediate results to console and MCMC trace for each element (default: false). Should set to false if computing many elements, otherwise output file is too large. 
 
* **Specify species on the phylogeny**:
  * *TARGETSPECIES*: species of interest. E.g. species potentially lost conservation or with convergent phenotype changes.
  * *OUTGROUP*: outgroup species of the phylogeny. These species are not considered to be accelerated in our model. 
  * *CONSERVE*: species assumed to be mostly conserved. The algorithm will filter out elements "missing" in more than *CONSERVE_PROP* of the conserved species. 
  * *CONSERVE_PROP*: filter out elements "missing" in more than *CONSERVE_PROP* of the conserved species (default: 0.8).
  * *GAPCHAR*: the character for alignment gaps (default: *). 
  * *GAP_PROP*: if the sequence alignment of a species contains gaps for more than *GAP_PROP* of the whole element, then we say that the element is "missing" in that species (default: 0.8).   
  * *CONSTOMIS*: the probability of "missing" under conserved state. Should be small (default: 0.01). 

* **(Hyper)Parameters for the model**:
  * *PREP_GRATE*: the prior transition probabily from neutral to conserved state (default: 0.8).
  * *PREP_LRATE*: the prior transition probabily from conserved to accelerated state (default: 0.1).
  * *CONSERVE_PRIOR_A*: the shape parameter for the gamma prior of conserved rate (default: 10).
  * *CONSERVE_PRIOR_B*: the scale parameter for the gamma prior of conserved rate (default: 0.2).
  * *ACCE_PRIOR_A*: the shape parameter for the gamma prior of acceleraed rate (default: 5).
  * *ACCE_PRIOR_B*: the scale parameter for the gamma prior of accelerated rate (default: 0.04).
  * *RATE_OPT*: to avoid label switching of latent state, we provide options to restrict accelerated rate larger than conserved rate. 0: no restriction on rates; 1: have lower and upper bound on acceleraed and conserved rates respectively; 2: restrict accelerated rate to be larger than conserved rate. (default: 1)
  * *NLB*: lower bound for the accelerated rate. Only valid if *RATE_OPT* = 1. Default: 0.6.
  * *CUB*: upper bound for the conserved rate. Only valid if *RATE_OPT* = 1. Default: 1.

* **Control for MCMC and number of threads**: 
  * *BURNIN*: number of initial iterations to discard before equilibrium of the chain (default: 200). Should set to be larger.
  * *MCMC*: number of MCMC iterations (default: 800). Should set to be larger. 
  * *ADAPT_FREQ*: number of iterations to recompute acceptance rate of Metropolis-Hastings for adaptively adjusting the proposal variances for mutation rates (default: 100).
  * *SEED*: seed for random sampling (default: 5)
  * *RATIO0*: initial value for the conserved rate (default: 0.5). 
  * *RATIO1*: initial value for the neutral rate (default: 1). 
  * *SAMPLE_HYPER*: whether to sample hyper parameters. 0, fix hyper parameters; 1, sample (default: 0). Sampling hyperparameters is time-consuming, and not recommended. If sampling hyperparamers, the algorithm will only output the posterior of Z (latent state of each branch) under full model. 
  * *CHAIN*: Numer of iterations to sample hyper parameters. If not sampling hyperparmeter, set it to 1 (default: 1).
  * *NUM_THREAD*: Number of threads to run the algorithm (default: 1).
