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

In the experiment different matrix sizes are tested, it's possible to distinguish two types of matrices:

**case1** (n >> m) : the number of rows is much larger than the number of columns, we choose
m ∈ [10, 50] while n ∈ [100, 10000].

**case2** (n ≈ m) : the number of rows is approximately equal to the number of columns, here we choose
m, n ∈ [10, 1000]

In particular, for the execution of both case, first run:
```bash
cd code     #entering inside code folder
```
and after execute this command for running the case1
```bash
matricies_case1   #execute case1
```
or for the second
```bash
matricies_case2   #execute case2
```

### Results

at the end of each execution inside the "code" folder there will be a folder called "results" containing a file called log_stats and the figures generated for each case analysed. In particular for this cases tol of 1e-11 was used

for examples:

|  id | rows | cols | rank | it  | error* |  AlOp_err	|	svd_error	|  (AlOp_err-error*)/error*    | (svd_err-error*)/error*   |   timer_opt	| timer_svd |
|-----|------|------|------|-----|--------|-------------|---------------|----------------------------|---------------------------|--------------|-------------|
0  | 100 | 10  |  3  | 110 | 7.167149e+00 | 7.167149e+00 | 7.167149e+00 | 9.700487e-11 | 1.239235e-16 | 3.774500e-02 | 6.100000e-04
1  | 100 | 10  |  5  | 67  | 5.687297e+00 | 5.687297e+00 | 5.687297e+00 | 9.323294e-11 | 0.000000e+00 | 2.689100e-02 | 6.090000e-04
2  | 100 | 10  |  8  | 65  | 3.248540e+00 | 3.248540e+00 | 3.248540e+00 | 9.240989e-11 | 0.000000e+00 | 5.612800e-02 | 6.020000e-04	
3  | 100 | 100 | 25  | 142 | 1.779098e+01 | 1.779098e+01 | 1.779098e+01 | 9.465453e-11 | 1.996918e-16 |	5.311430e-01 | 7.518200e-02
4  | 100 | 100 | 50  | 126 | 9.531098e+00 | 9.531098e+00 | 9.531098e+00 | 8.731456e-11 | 1.863748e-16 |	9.947914e-01 | 7.489300e-02
5  | 100 | 100 | 75  | 169 | 3.294332e+00 | 3.294332e+00 | 3.294332e+00 | 9.352285e-11 | 1.348040e-16 |	2.498885e+00 | 7.491640e-02
6  | 500 | 500 | 250 | 1000| 4.724848e+01 | 4.724848e+01 | 4.724848e+01 | 1.194539e-08 | 1.052690e-15 |	4.774890e+02 | 3.163820e-02
7  | 900 | 900 | 450 | 1000| 8.473661e+01 | 8.473661e+01 | 8.473661e+01 | 5.743708e-09 | 1.844768e-15 |	4.249077e+03 | 1.259845e-01
8  | 1100| 30  | 8   | 344 | 4.323428e+01 | 4.323428e+01 | 4.323428e+01 | 9.803598e-11 | 1.643471e-16 |	1.439106e+00 | 1.694200e-02
9  | 1100| 30  | 15  | 320 | 3.440083e+01 | 3.440083e+01 | 3.440083e+01 | 9.763675e-11 | 2.065481e-16 |	2.435944e+00 | 1.697800e-02
10 | 1100| 30  | 23  | 1000| 2.242539e+01 | 2.242538e+01 | 2.242538e+01 | 1.737022e-07 | 1.584238e-16 |	1.805243e+01 | 1.698800e-02
11 | 9100| 50  | 25  | 576 | 1.335041e+02 | 1.335041e+02 | 1.335041e+02 | 9.950398e-11 | 0.000000e+00 |	8.640313e+01 | 2.932386e+00
12 | 9100| 50  | 38  | 1000| 9.088364e+01 | 9.088364e+01 | 9.088364e+01 | 4.953096e-10 | 0.000000e+00 |	2.634846e+02 | 2.933805e+00

## Repository structure
```bash
CM
├── code
│   ├── hyperparameters.m                 #(file) containing all hyperparameters used
│   ├── matricies_case1.m                 #(file) main script for run matrix #rows >> #cols
│   ├── matricies_case2.m                 #(file) main script for run matrix #rows ≈ #cols
│   └── utils                             #(folder) contain all function used for main script
│       ├── alternating_optimization.m    #(file) alternating optimization algorithm function
│       ├── thin_qr.m                     #(file) thin qr imlementation
│       ├── graph                         #(folder) include all function used for create graph
│       │   ├── interpolation.m           #(file) used for compute polinomyal regression
│       │   ├── read_file_for_graph.m     #(file) read values from file and plot graph
│       │   └── make_graph.m              #(file) used from matricies_case1/2 for save graph in results folder
│       └── stats                         #(folder) contain all function for print and save execution stats 
│           ├── calculate_stats.m         #(file) manange all stats
│           └── create_file_for_log.m     #(file) save execution stats in a log_stats.txt file
└── README.md
```

## Authors
- [Domenico Profumo]()
- [Gerlando Garmaglia]()
