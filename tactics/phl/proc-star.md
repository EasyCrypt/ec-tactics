# Syntax
`proc*`
# Overview
Replaces a goal with a phoare statement involving a procedure with phoare statement with a call to that procedure.
# Current Goal
`phoare[M.p: P ==> Q] o a`, where `o` is one of `>=`, `=` or `<=`
# New goal
`phoare[{r <- M.p(x,y,...); return r;}: P[arg\(x,y,...)] ==> Q[res\r]] o a`
