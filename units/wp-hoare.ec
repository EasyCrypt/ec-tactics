(* -------------------------------------------------------------------- *)
require import AllCore.

pred p : int.

op o : int -> int.

(* -------------------------------------------------------------------- *)
theory WpAssign.
  module M = {
    proc f(x : int, y : int) = {
      var z <- x + y;
      var t <- o z;
  
      t <- t + 2 * y;
      return t;
    }
  }.
  
  lemma L1 : hoare[M.f : true ==> p res].
  proof.
  proc.
  wp.
  abort.
  
  lemma L2 : hoare[M.f : true ==> p res].
  proof.
  proc.
  wp 1.
  abort.
end WpAssign.

(* -------------------------------------------------------------------- *)
theory WpConditional.
  module M = {
    proc f(x : int, y : int) = {
      var z <- 0;

      if (x = y) {
        z <- z + 2 * x;
      } else {
        z <- z + 1;
      }

      return z;
    }
  }.

  lemma L3 : hoare[M.f : true ==> p res].
  proof.
  proc.
  wp.
  abort.
end WpConditional.

