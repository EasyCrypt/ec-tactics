require import AllCore.

module M = {
  proc g(x : int, y : int) : int = {
    return x * y;
  }

  proc f(x : int) : int = {
    var aout : int;

    aout <@ g(x, x);
    return aout;
  }
}.

lemma L : phoare[M.f : 0 < x ==> 0 < res] <= (1%r/2%r).
proof.
proc.
abort.
