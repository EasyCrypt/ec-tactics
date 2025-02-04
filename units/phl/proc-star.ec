require import AllCore.

module type MT = {
  proc f(x : int) : int
}.

lemma L (M<: MT): phoare[M.f : 0 < x ==> 0 < res] <= (1%r/2%r).
proof.
proc*.
abort.
