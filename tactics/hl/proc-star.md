# Syntax
`proc*`
# Overview
Replaces a goal with a hoare statement involving a procedure with hoare statement with a call to that procedure.
# Current Goal
`hoare[M.p: P ==> Q]`
# New goal
`hoare[{r <- M.p(x,y,...); return r;}: P[arg\(x,y,...)] ==> Q[res\r]]`
