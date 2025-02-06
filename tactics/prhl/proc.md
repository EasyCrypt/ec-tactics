# Syntax
`proc`
# Overview
Replaces a goal with an equiv statement involving procedures with their body
# Current Goal
`equiv[M1.p ~ M2.q: P ==> Q]`
# Additional Requirements
`M1` and `M2` have to be concrete
# New goal
`phoare[{...} ~ {...}: P ==> Q]` where the ellipses are the bodies of `M1.p` and `M2.q`
