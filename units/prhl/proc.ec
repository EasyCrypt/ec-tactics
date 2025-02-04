require import AllCore.

module M1 = {
  proc g(x : int, y : int) : int = {
    return x * y;
  }

  proc f(x : int) : int = {
    var aout : int;

    aout <@ g(x, x);
    return aout;
  }
}.

module M2 = {
  proc h(x: bool): bool = {
    var bout: bool;
    bout <- true;
    return bout;
  }
}.

lemma L : equiv[M1.f ~ M2.h : 0 < x{1} ==> res{2}].
proof.
proc.
abort.
