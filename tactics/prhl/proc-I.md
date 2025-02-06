# Syntax
`proc I`, where `I` is a logical statement possibly involving program variables with a side parameter.
# Overview
Proves the goal using the invariant `I` that must hold throughout
# Current Goal
`equiv[M(O1,...).p ~ M(P1,,...).p: P ==> Q]`
# Additional Requirements
- `M` has to be abstract
- The globals of any module mentioned in `I` have to be inaccessible to `M`
# New goals
- `forall &1 &2, P{1,2} => ={arg} /\ ={glob M} /\ I{1,2}`
- `forall &1 &2, ={arg} /\ ={glob M} /\ I{1,2} => Q{1,2}`
and one goal for each oracle procedure `O1.q` available to `M` and corresponding `P1.q` on the other side of the form
- `equiv[O1.q ~ P1.q: ={arg} /\ ={glob M} /\ I ==> ={res} /\ ={glob M} /\ I]`
