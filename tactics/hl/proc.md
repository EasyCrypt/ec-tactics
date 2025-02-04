# Overview

All variants work to break down goals of the form `hoare[M.p : C ==> R]` where `M` is some module with a procedure `p`.

# Variants

`proc*.`: Replaces `M.p` with a procedure call to `M.p` assigning to a fresh variable. Occurences of `res` in the postcondition are replaced with the fresh variable. Occurrences of `arg` in the postcondition are replaced with the arguments to the procedure.

## Concrete module

`proc.`: Expands `M.p` into its body. This requires `M` to be concrete. Occurrences of `arg` in the precondition are replaced with the arguments to the procedure. Occurences of `res` in the postcondition are replaced with the expression in the return.

## Module parameters

`proc I`: Proves the goal using the invariant `I`. Produces goals stating that the precondition implies the invariant, that the invariant implies the postcondition, and that the invariant is preserved by any procedure calls `M` could make through the module parameters it's given. Requires `M` to be abstract.