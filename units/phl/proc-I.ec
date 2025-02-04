require import AllCore.

module type OT = {
  proc g(x : int, y : int) : int
}.

module type MT(O: OT) = {
  proc f(x : int) : int
}.

module O: OT = {
  var b: bool
  proc g(x: int, y: int): int = {var r;
    b <- true;
    return r;
  }
}.

lemma L (M<: MT{-O}) : phoare[M(O).f : 0 < x ==> 0 < res] =
1%r.
proof.
proc (1+1=3).
abort.
