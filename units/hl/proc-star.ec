require import AllCore.

module type MT = {
  proc f(x : int): int
}.

lemma L (M<: MT) : hoare[M.f : 0 < x ==> 0 < 0].
proof.
proc*.
abort.
