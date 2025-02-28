Intro patterns are shorthands, based on Small-Scale Reflection in Coq, that enable quick manipulation of goals resulting from tactic calls.
They can be used after any tactic with the following syntax: `tactic => ip1 ip2 ...` where `ip` is some intro pattern.

## Introducing Hypotheses

Given a goal of the form: `a1 => a2 ... => an => c`, we can use the following patterns to introduce assumption `a` as a hypothesis:

- `name` : Introduce the top assumption as a hypothesis called 'name'.
- `?` : Introduce the top assumption but generate a name for the hypothesis.
- `n?` : Introduce the first `n` assumptions, generating a name for each new hypothesis.
- `*` : Introduce all assumptions, generating a name for each new hypothesis.

## Clearing Hypotheses

- `_` : Clear the top assumption.
- `{name1, name2, ...}` : Clear hypotheses with the given names, same as `clear name1 name2 ...`.

## Substitution

Given a goal of the form: `x = y => c`, we can use the following patterns to perform substitution on `c` using the top assumption.

- `->` : Substitute the top assumption from left-to-right in the conclusion.
- `<-` : Substitute the top assumption from right-to-left in the conclusion.
- `->>` : Substitute the top assumption from left-to-right in the conclusion and in all the hypotheses.
- `<<-` : Substitute the top assumption from right-to-left in the conclusion and in all the hypotheses.
- `<*>`, `<*>>` : try to substitute as many assumptions as possible with a preference for left-to-right substitution.
- `<<*>` : try to substitute as many assumptions as possible with a preference for right-to-left substitution.
- `@/op`, `@/(op args)`, `@{x}/(op args)` : Unfold operator `op` in the goal. For more specific unfolding, arguments and/or an occurrence can be provided.
- `@-/op`, `@-/(op args)`, `@-{x}/(op args)` : Refold operator `op` in the goal. Often you'll need to be specific about the arguments to help the matching.

## Destructuring Assumptions

For goals of the forms: `forall (x : t), a => c`, `a /\ b => c`, `a \/ b => c`, `(exists (x : t), a) => c`. A common desire is to break-down assumptions into their smaller component parts.

There are three main variants:
- `[]` : Perform a `case` on the top most assumption.
- `[m#]` : Destruct all conjuncts in a goal using the mode `m`
- `[m#|]` : Destruct all conjuncts and disjuncts in the goal using the mode `m`. This will create new goals for each disjunct encountered.

The destruction mode has a few options that must be enabled in the following order:
- `!`, `x!` : Apply destruction to all assumptions or the top `x` assumptions.
- `~` : Destruct inductives as if they were disjuncts/conjuncts.
- `/` : Unfold operators to check if they can be destructed.

If `m` is left empty, the default behaviour is: only destruct the top assumption without destructing inductives or unfolding operators.

It is also possible to sequence further intro patterns on the generated goals with the following syntax:

- `[v ip1 ip2 ... ]` : Apply intro patterns `ip1`, `ip2`, ... to the goal generated using the variant `v` (one of ``, `m#`, `m#`). Fails if multiple goals are generated.
- `[v ip11 ip12 ... | ... | ... ]`: Apply intro patterns `ipx1`, `ipx2`, ... to the x'th goal generated using the variant `v` (one of ``, `m#`, `m#`). Fails if an incorrect number of `|` are used.

## Views

Often it is desirable to apply existing lemmas to an assumption, or pass arguments to the top assumption.

- `/lemma` : Apply a lemma in the forwards direction to the top assumption. E.G. If `lemma : P => Q` and the goal is `P => R`, then `/lemma` produces `Q => R`.
- `/(_ args)` : Apply the args to the top assumption. E.G. If the goal is `(forall x, P x) => Q` then `/(_ v)` produces `P v => Q`.

## Manipulating assumptions

When chaining intro patterns it is useful to be able to manipulate the assumptions in-between patterns.

- `^` : Duplicate the top assumption. E.G. If the goal is `P => Q` then `^` produces `P => P => Q`.
- `+` : Temporarily introduce the top assumption but do not give it a name. After a full intro pattern chain has finished, all temporary introductions are reverted. E.G. If the goal is `P => Q => R => S`, then the chain `+ + x` produces `P => Q => S` as a goal and a new hypothesis `x : R`.
- `-` : Revert all temporary introductions. E.G. If the goal is `P => Q => R => S`, then the chain `+ + x - y` produces `Q => S` as a goal and new hypotheses `x : R`, and `y : P`.

## Simplifying The Goal

There are a variety of methods for automatically simplifying the goal.

- `/=` : Simplify the current goal via beta-reduction.
- `/~=` : Same as `/=` but do not simplify `P => Q`,  `P <=> Q`, `forall (x : t), P`, and `exists (x : t), P`.

## Trivial
`//`
`//=`
`//~=`

## SMT

`/#`
`//#` - Checks if can be killed by `done` before going to SMT.

## Crush

`|>` rewrite as much as possible then
`||>` above + trivial

same as above but unfold ops
`/>`
`//>`

## Examples

todo
