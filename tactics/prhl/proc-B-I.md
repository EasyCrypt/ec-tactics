# Syntax
`proc B I`, where `B` and `I` are logical statements possibly involving program variables where those in `I` have a side parameter and those in `B` do not.
# Overview
Proves the goal using the invariant `I` that must hold until the bad event `B` happens on the right side. This is a specialization of `proc B I` for `J = true`
# Current Goal
`equiv[M(O1,...).p ~ M(P1,...).p: P ==> Q]`
# Additional Requirements
- `M` has to be abstract
- The globals of any module mentioned in `I` have to be inaccessible to `M`
- The globals of any module parameter to `M` that are accessed by any procedure available to `M` on the right side have to be inaccessible to `M`
# New goals
- `forall &1 &2, P{1,2} => !B{2} => ={arg} /\ ={glob M} /\ I{1,2}`
- `forall &1 &2, (!B{2} => ={arg} /\ ={glob M} /\ I{1,2}) => Q{1,2}`
- For any module parameters of `M`, losslessness of all procedures available to `M` through its module parameters implies losslessness of `M`
one goal for each oracle procedure `O1.q` available to `M` and corresponding `P1.q` on the other side of the form
- `equiv[O1.q ~ P1.q: !B{2} /\ ={arg} /\ ={glob M} /\ I ==> !B{2} => ={res} /\ ={glob M} /\ I]`
one goal for each oracle procedure `O1.q` available to `M` on the left side of the form
- `forall &2, B{2} => islossless O1.q`
one goal for each oracle procedure `P1.q` available to `M` on the right side of the form
- `forall _, phoare[P1.q: B /\ true ==> B /\ true] = 1%r` 
Note: *Maybe this goal should automatically have its quantifier removed and pre- and post-condition simplified?*