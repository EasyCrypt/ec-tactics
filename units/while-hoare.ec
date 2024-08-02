require import AllCore.

module M = {
  proc f (a b : int) : int = {
    var r, i : int;

    i <- 0;
    r <- 0;

    while (i < b) {
      r <- r + a;
      i <- i + 1;
    }

    return r;
  }
}.


lemma L (x y : int) : 
    0 < y => hoare [M.f : arg = (x, y) ==> res = x * y].
proof.
move => ?. 
proc.
while (0 <= i <= b /\ r = a * i).
abort.
