require import AllCore.

module type OT = {
  proc g(x : int, y : int) : int
}.

module type MT(O: OT) = {
  proc f(x : int) : int
}.

lemma L (O1<:OT) (O2<:OT) (M<: MT{-O1}): 
  equiv[M(O1).f ~M(O2).f: 0 < x{1} ==> 0 = res{2}].
proof.
proc (={glob O1}).
abort.
