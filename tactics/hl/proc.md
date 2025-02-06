# Syntax
`proc`
# Overview
Replaces a goal with a hoare statement involving a procedure with its body
# Current Goal
`hoare[M.p: P ==> Q]`
# Additional Requirements
`M` has to be concrete
# New goal
`hoare[{...}: P ==> Q]` where the ellipses are the body of `M.p`
