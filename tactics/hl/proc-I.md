# Syntax
`proc I` where `I` is a logical statement possibly involving program variables.
# Overview
Proves the goal using the invariant `I` that must hold throughout the procedure
# Current Goal
`hoare[M(O,...).p: P ==> Q]`
# Additional Requirements
- `M` has to be abstract
- The globals of any module mentioned in `I` have to be inaccessible to `M`
# New goals
- `forall &hr, P{hr} => I{hr}`
- `forall &hr, I{hr} => Q{hr}`
and one goal for each oracle procedure `O.q` available to `M` of the form
- `hoare[O.q: I ==> I]`