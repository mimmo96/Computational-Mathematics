# Project 23 (NO-ML)

(P) is low-rank approximation of a matrix $A \in ℝ^{m,n} $, i.e., 
$$\displaystyle \min_{ U\inℝ^{m,k} , V\inℝ^{n,k}} \lVert A-UV^T \rVert_F $$

(A) is alternating optimization: first take an initial $V = V_0$, and compute

$$  U_1 = arg min_{U} \lVert A-UV_0^T \rVert_{F} $$

then use it to compute

$$  V_1 = arg min_{V} \lVert A-U_1V^T \rVert_{F} $$

then 

$$  U_2 = arg min_U \lVert A-UV_1^T \rVert_{F} $$

and so on, until (hopefully) convergence. Use QR factorization to solve these sub-problems. No off-the-shelf solvers allowed. In particular you must implment yourself QR factorization.

## Getting started

### Prerequisites 

Make sure that you have installed [MATLAB](https://it.mathworks.com/products/matlab/student.html), run it and move to the folder containing this project.

### Usage

For our experiments we use matrices A whose dimensions are :

**case1** (n >> m) : the number of rows is much larger than the number of columns, we choose
m ∈ [10, 50] while n ∈ [100, 10000].

**case2** (n ≈ m) : the number of rows is approximately equal to the number of columns, here we choose
m, n ∈ [10, 1000]

In particular, for the execution of case1 you can lanch the following command:
```bash
cd code     #entering inside code folder
```
ad after execute this command for running the first case
```bash
matricies_case1   #execute case1
```
or 
```bash
matricies_case2    #execute case2
```

### Results

at the end of each execution inside the "code" folder there will be a folder called "results" containing a file called log_stats and the figures generated for each case analysed.

for examples:

|  id | rows | cols | rank | it  | error* |  AlOp_err	|	svd_error	|  (AlOp_err-error*)/error*    | (svd_err-error*)/error*   |   timer_opt	| timer_svd |
|-----|------|------|------|-----|--------|-------------|---------------|----------------------------|---------------------------|--------------|-------------|
0  |  10 | 10  | 3  | 40  |	1.696507e+00 | 1.696507e+00 | 1.696507e+00 | 0.000000e+00 | 0.000000e+00 | 2.422530e-02 | 6.431580e-02
1  |  10 | 10  | 5  | 104 | 9.914363e-01 | 9.914363e-01 | 9.914363e-01 | 0.000000e+00 | 0.000000e+00 | 5.374200e-03 | 6.401320e-02
2  |  10 | 10  | 8  | 19  |	2.248146e-01 | 2.248146e-01 | 2.248146e-01 | 0.000000e+00 | 1.234599e-16 | 8.723000e-04 | 6.402540e-02
3  | 110 | 110 | 28 | 401 | 1.932415e+01 | 1.932415e+01 | 1.932415e+01 | 3.676968e-16 | 0.000000e+00 | 3.894258e-01 | 1.350430e-02
4  | 110 | 110 | 55 | 510 | 1.036402e+01 | 1.036402e+01 | 1.036402e+01 | 0.000000e+00 | 1.199776e-15 | 7.527133e-01 | 1.418680e-02
5  | 110 | 110 | 83 | 164 | 3.430368e+00 | 3.430368e+00 | 3.430368e+00 | 0.000000e+00 | 5.178327e-16 | 3.688086e-01 | 1.352460e-02


## Repository structure
```bash
CM
├── 📂code
│   ├── 📄hyperparameters.m                 #file containing all hyperparameters used
│   ├── 📄matricies_case1.m                 #file
│   ├── 📄matricies_case2.m                 #file
│   └── 📂 utils                            #folder
│       ├── 📄alternating_optimization.m    #file 
│       ├── 📄thin_qr.m                     #file
│       ├── 📂 graph                        #folder
│       │   ├── 📄interpolation.m           #file
│       │   ├── 📄read_file_for_graph.m     #file
│       │   └── 📄make_graph.m              #file 
│       └── 📂 stats                        #folder
│           ├── 📄calculate_stats.m         #file 
│           └── 📄create_file_for_log.m     #file 
└── 📄README.md
```

## Authors
- [Domenico Profumo]()
- [Gerlando Garmaglia]()
