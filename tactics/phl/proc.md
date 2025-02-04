# Overview

All variants work to break down goals of the form `phoare[M.p : C ==> R] o r` where `M` is some module with a procedure `p`, `o` is one of the strings `<=`, `>=` or `=`, and `r` is a real number.

# Variants

`proc*.`: Replaces `M.p` with a procedure call to `M.p` assigning to a fresh variable. Occurences of `res` in the postcondition are replaced with the fresh variable. Occurrences of `arg` in the postcondition are replaced with the arguments to the procedure.

## Concrete module

`proc.`: Expands `M.p` into its body. This requires `M` to be concrete. Occurrences of `arg` in the precondition are replaced with the arguments to the procedure. Occurences of `res` in the postcondition are replaced with the expression in the return. 

## Module parameters

`proc I`: Proves the goal using the invariant `I`. Produces goals stating that the precondition implies the invariant, that the invariant implies the postcondition, that `M.p` is lossless assuming all the procedure calls `M` could make through the module parameters it's given are also lossless, and that all those procedure calls losslessly preserve the invariant. Requires `M` to be abstract, the `o` to be `=` and `r` to be `1%r`. We also require `M` to not have direct access to globals of any modules mentioned in `I`. Finally, for any module parameters of `M`, if they may have globals that are accessible by `M` and are accessed by its procedures callable by `M` we require `M` to not have direct access to the globals of this module parameter.