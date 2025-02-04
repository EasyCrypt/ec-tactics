# Overview

All variants work to break down goals of the form `equiv[M1.p ~ M2.q: C ==> R] o r` where `M1` and `M2` are modules with procedures `p` and `q` respectively.

# Variants

`proc*.`: Replaces `M1.p` and `M2.p` with a procedure call to them assigning to fresh variables. Occurences of `res{i}` in the postcondition are replaced with the fresh variable on side `i`. Occurrences of `arg{i}` in the precondition are replaced with the arguments to the procedure.

## Concrete Module

`proc.`: Expands `M1.p` and `M2.q` into their body. This requires `M1` and `M2` to be concrete. Occurrences of `arg{i}` in the postcondition are replaced with the arguments to the procedure on side `i`. Occurences of `res{i}` in the precondition are replaced with the expression in the return of the procedure on side `i`.

## Module Parameters

`proc I`: Requires `M1` and `M2` to be the same. Proves the goal using the invariant `I`. Produces goals stating that the precondition implies the invariant, that the invariant implies the postcondition, and that all for any corresponding pair of procedure calls, `O1.p` and `O2.p` available through procedure calls to `M1` and `M2` respectively we have `equiv[M1 ~ M2: ={arg} /\ I ==> ={res} /\ I]`. We also require `M1` (and thus also `M2`) to not have direct access to globals of any modules mentioned in `I`.

## Module Parameters upto bad

`proc B I J`. Like proc I, but just for pRHL judgements and uses “upto-bad” (upto-failure) reasoning, where the bad (failure) event, B, is evaluated in the second program’s memory, and the invariant I only holds up to the point when failure occurs. In addition to subgoals whose conclusions are pRHL judgments involving the oracles the abstract procedure may query (their preconditions assume I and the equality of oracles’ parameters, as well as that B is false; their postconditions assert I and the equality of the oracles’ results—but only when B does not hold), subgoals are generated that check that: the original judgement’s pre- and postconditions support the reduction; the abstract procedure is lossless, assuming the losslessness of the oracles it may query; the oracles used by the abstract procedure in the first program are lossless once the bad event occurs; and the oracles used by the abstract procedure in the second program guarantee the stability of the failure event with probability 1.

`proc B I` Same as `proc B I `