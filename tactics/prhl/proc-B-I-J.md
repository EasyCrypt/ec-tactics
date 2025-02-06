# Syntax
`proc B I J`, where `B`, `I` and `J` are logical statements possibly involving program variables where those in `I` and `J` have a side parameter and those in `B` do not.
# Overview
Proves the goal using the invariant `I` that must hold until the bad event `B` happens on the right side. This is a generalization of `proc B I` where a new invariant `J` holds after the bad event happens
# Current Goal
`equiv[M(O1,...).p ~ M(P1,...).p: P ==> Q]`
# Additional Requirements
- `M` has to be abstract
- The globals of any module mentioned in `I`, `B` or `J` have to be inaccessible to `M`
- The globals of any module parameter to `M` that are accessed by any procedure available to `M` on the right side have to be inaccessible to `M`
# New goals
- `forall &1 &2, P{1,2} => if B{2} then J else ={arg} /\ ={glob M} /\ I{1,2}`
- `forall &1 &2, (if B{2} then J else ={arg} /\ ={glob M} /\ I{1,2}) => Q{1,2}`
- For any module parameters of `M`, losslessness of all procedures available to `M` through its module parameters implies losslessness of `M`
one goal for each oracle procedure `O1.q` available to `M` and corresponding `P1.q` on the other side of the form
- `equiv[O1.q ~ P1.q: if B{2} then J else ={arg} /\ ={glob M} /\ I ==> if B{2} then J else ={res} /\ ={glob M} /\ I]`
one goal for each oracle procedure `O1.q` available to `M` on the left side of the form
- `forall &hr, B{hr} => phoare[O1.q: J{_,hr} ==> J{_,hr}]`
one goal for each oracle procedure `P1.q` available to `M` on the right side of the form
- `forall &hr, phoare[P1.q: B /\ J{hr,_} ==> B /\ J{hr,_}] = 1%r`
