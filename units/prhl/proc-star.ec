require import AllCore.

module type MT1 = {
  proc f(x : int) : int
}.

module type MT2 = {
  proc h(x: bool): bool
}.

lemma L (M1<: MT1) (M2<:MT2) : equiv[M1.f ~ M2.h : 0 < x{1} ==> res{2}].
proof.
proc*.
abort.
