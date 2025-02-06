# Syntax
`proc*`
# Overview
Replaces a goal with an equiv statement involving procedures with an equiv involving calls to those procedures.
# Current Goal
`equiv[M1.p ~ M2.q: P ==> Q]`
# New goal
`phoare[{r <- M1.p(x,y,...)} ~ {r <- M2.p(x,y,...)}: P ==> Q]`
