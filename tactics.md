---
title: 'EasyCrypt tactics'
--- 

## `proc`

### Hoare version

~~~ecblock
filename: units/proc-hoare.ec
~~~

## Others

 - `proc`
 - `proc <sformula>`
 - `proc <sformula> <sformula> <sformula>`
 - `proc '*'`
 - `wp <codepos1>`
 - `sp <codepos1>`
 - `skip`
 - `while [side] <winfos>`
 - `async while <awinfos>`
 - `call [side] <gpterm(call_info)>`
 - `call '/' <formula> <gpterm(call_info)>`
 - `rcondt [side] <codepos1>`
 - `rcondf [side] <codepos1>`
 - `seq [side] <tac_dir> <s_codepos1> ':' <formula | formula formula> <app_bd_info>`
 - `match [ident] [side] <codepos1>`
 - `if <ifoption>`
 - `match [side] [=]`
 - `swap <swap_info ',' ...>`
 - `interleave <interleave_info>`
 - `cfold [side] <codepos> ! <int>`
 - `cfold [side] <codepos>`
 - `rnd [side] <rnd_info> [: semrndpos]`
 - `rndsem ['*'] [side] <codepos1>`
 - `inline [side] [inlineopt] [occurences]`
 - `inline [side] [inlineopt] [occurences] <inlinepat1> [inlinepat...]`
 - `inline [side] [inlineopt] <codepos>`
 - `outline <side> '[' <codepos1> ['-' <codepos1>] ']' <outline_kind>
 - `kill [side] <codepos>`
 - `kill [side] <codepos> '!' <uint>`
 - `kill [side] <codepos> '*' <uint>`
 - `case '<-' [side] <codepos>`
 - `alias [side] <codepos>`
 - `alias [side] <codepos> with <lident>`
 - `alias [side] <codepos> <lident> '=' <expression>`
 - `weakmem [side] <ipcore_name> <param_decl>`
 - `fission [side] <codepos> '@' <uint> ',' <uint>`
 - `fission [side] <codepos> '!' <uint> '@' <uint> ',' <uint>`
 - `fusion [side] <codepos> '@' <uint> ',' <uint>`
 - `fusion [side] <codepos> '!' <uint> '@' <uint> ',' <uint>`
 - `unroll ['for'] [side] <codepos>`
 - `splitwhile` [side] <codepos> ':' <expression>`
 - `byphoare [gpterm(conseq)]`
 - `byehoare [gpterm(conseq)]`
 - `byequiv ['[' byequivopt ']'] [gpterm(conseq)]`
 - `byequiv ['[' byequivopt ']'] [gpterm(conseq)]` ':' <sformula>`
 - `byupto`
 - `conseq '/' <sformula> <gopterm(conseq)>`
 - `conseq [cqoption]`
 - `conseq [cqoption] <gpterm(conseq_xt)>`
 - `conseq [cqoption] <gpterm(conseq_xt)> <gpterm(conseq_xt)> ['_']`
 - `conseq [cqoption] <gpterm(conseq_xt)> '_' <gpterm(conseq_xt)>`
 - `conseq [cqoption] <gpterm(conseq_xt)> <gpterm(conseq_xt)> <gpterm(conseq_xt)>`
 - `conseq [cqoption] '_' <gpterm(conseq_xt)> ['_']`
 - `conseq [cqoption] '_' '_' <gpterm(conseq_xt)>`
 - `conseq <crushmode>`
 - `elim '*'`
 - `exists '*' <sformula ',' ...>`
 - `exlim <sformula ',' ...>``
 - `ecall [side] '(' <qident> [tvars_app] <sformula...> ')'`
 - `exfalso`
 - `bypr`
 - `bypr <sformula> <sformula>`
 - `fel <codepos1> <sformula> <sformula> <sformula> <sformula> <fel_pred_specs> [sformula]`
 - `sim [crushmode] <eqobs_in>`
 - `replace <repl_kind> <repl_hyp> <repl_hyp>`
 - `replace '*' <repl_kind>`
 - `transitivity <trans_kind> <trans_hyp> <trans_hyp>`
 - `transitivity '*' <trans_hyp>`
 - `rewrite equiv '[' <side> <codepos1> <rwside> <pterm> [rweq_proc] ']'`
 - `symmetry`
 - `eager <eager_tac>`
 - `hoare`
 - `pr_bounded`
 - `phoare split <phoare_split>`
 - `phoare equiv <side> <sformula> <sformula>`
 - `auto`
 - `lossless`
 - `proc change [side] <codepos> ':' <sformula>`
 - `proc rewrite [side] <codepos> <pterm>`
