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

lemma L : hoare[M.f : 0 < x ==> 0 < res].
proof.
by proc.
abort.
