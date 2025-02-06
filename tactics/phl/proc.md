# Syntax
`proc`
# Overview
Replaces a goal with a hoare statement involving a procedure with its body
# Current Goal
`phoare[M.p: P ==> Q] o a`, where `o` is one of `>=`, `=` or `<=`.
# Additional Requirements
`M` has to be concrete
# New goal
`phoare[{...}: P ==> Q]` where the ellipses are the body of `M.p`
