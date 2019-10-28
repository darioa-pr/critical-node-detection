# Parameters
param n >= 1, integer; #number of nodes
param k <= n, > 0, integer; #number of nodes to delete

# sets
set V := 1..n; #set of nodes
set A within V cross V; #set of edges


# Variables
var u{V,V}, binary default 0;  
var v{V}, binary default 0; 

# constraints
subject to a {(i,j) in A}: u[i,j]+v[i]+v[j]  >= 1;

subject to b {i in V, j in V, w in V}:
	u[i,j]-1 <= u[j,w]+u[w,i];

subject to c: sum{i in V} v[i] <= k;


# Objective
minimize crit_node_detection: sum{i in V, j in V} u[i,j];

