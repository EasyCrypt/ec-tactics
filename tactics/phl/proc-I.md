# Syntax
`proc I`, where `I` is a logical statement possibly involving program variables.
# Overview
Proves the goal using the invariant `I` that must hold throughout the procedure
# Current Goal
`phoare[M(O,...).p: P ==> Q] = 1%r`
# Additional Requirements
- `M` has to be abstract
- The globals of any module mentioned in `I` have to be inaccessible to `M`
- The globals of any module parameter to `M` that are accessed by any procedure available to `M` have to be inaccessible to `M`
# New goals
- `forall &hr, P{hr} => I{hr}`
- `forall &hr, I{hr} => Q{hr}`
- For any module parameters of `M`, losslessness of all procedures available to `M` through its module parameters implies losslessness of `M`
and one goal for each oracle procedure `O.q` available to `M` of the form
- `phoare[O.q: I ==> I] = 1%r`
