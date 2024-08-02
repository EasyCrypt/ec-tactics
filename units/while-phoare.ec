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

  proc g (a b : int) : int = {
    var r : int;

    r <- a * b;
    
    return r;
  }
}.


lemma L1 (x y : int) : 
    0 < y => phoare [M.f : arg = (x, y) ==> res = x * y] = 1%r.
proof.
move => ?. 
proc.
while (0 <= i <= b /\ r = a * i) (b - i).
abort.

lemma L2 (x y : int) :
    0 < y => equiv [M.f ~ M.g: arg{1} = (x, y) /\ arg{2} = (x, y) ==> ={res}].
proof.
move => ?. 
proc.
while {1} (={a, b} /\ 0 <= i{1} <= b{1} /\ r{1} = a{1} * i{1}) (b{1} - i{1}).
abort.
