require import AllCore.

module type OT = {
  proc g(x : int, y : int) : int
}.

module type MT(O: OT) = {
  proc f(x : int) : int
}.

lemma L (O<: OT) (M<: MT) : hoare[M(O).f : 0 < x ==> 0 < res].
proof.
proc (1+1=3).
abort.
