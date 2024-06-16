import { simpleMode } from "@codemirror/legacy-modes/mode/simple-mode";
import { Tag } from "@lezer/highlight";
import { HighlightStyle, defaultHighlightStyle } from "@codemirror/language";

export const easycrypt = simpleMode({
  start: [
    {regex: /\b(?:exact|assumption|smt|by|reflexivity|done|solve)\b/, token: "bytac"},
    {regex: /\b(?:admit|admitted)\b/, token: "dangerous"},
    {regex: /\b(?:axiom|axiomatized|lemma|realize|proof|qed|abort|goal|end|from|import|export|include|local|declare|hint|nosmt|module|of|const|op|pred|inductive|notation|abbrev|require|theory|abstract|section|type|class|instance|print|search|locate|as|Pr|clone|with|rename|prover|timeout|why3|dump|remove|exit|Top|Self)\b/, token: "global"},
    {regex: /\b(?:fail|time|undo|debug|pragma)\b/, token: "internal"},
    {regex: /\b(?:forall|exists|fun|glob|let|in|for|var|proc|if|is|match|then|else|elif|match|for|while|assert|return|res|equiv|hoare|ehoare|phoare|islossless|async)\b/, token: "prog"},
    {regex: /\b(?:beta|iota|zeta|eta|logic|delta|simplify|cbv|congr|change|split|left|right|case|pose|gen|have|suff|elim|exlim|ecall|clear|wlog|apply|rewrite|rwnormal|subst|progress|trivial|auto|idtac|move|modpath|field|fieldeq|ring|ringeq|algebra|replace|transitivity|symmetry|seq|wp|sp|sim|skip|call|rcondt|rcondf|swap|cfold|rnd|rndsem|pr_bounded|bypr|byphoare|byehoare|byequiv|byupto|fel|conseq|exfalso|inline|outline|interleave|alias|weakmem|fission|fusion|unroll|splitwhile|kill|eager)\b/, token: "tactic"},
    {regex: /\b(?:try|first|last|do|expect)\b/, token: "tactical"},
    
    {regex: /\(\*/, token: "comment", push: "comment"},

    {regex: /[\{\[\(]/, indent: true},
    {regex: /[\}\]\)]/, dedent: true},
  ],

  comment: [
    {regex: /.*?\(\*/, token: "comment", push: "comment"},
    {regex: /.*?\*\)/, token: "comment", pop: true},
    {regex: /.*/, token: "comment"}
  ],

  languageData: {
    name: "easycrypt"
  }  
})

easycrypt.tokenTable = {
    bytac: Tag.define()
  , dangerous: Tag.define()
  , global: Tag.define()
  , internal: Tag.define()
  , prog: Tag.define()
  , tactic: Tag.define()
  , tactical: Tag.define()
}

export const ecstyle = HighlightStyle.define(defaultHighlightStyle.specs.concat([
    {tag: easycrypt.tokenTable.bytac, color: "#f00", fontWeight: "bold"}
  , {tag: easycrypt.tokenTable.dangerous, color: "#fff", background: "#f00"}
  , {tag: easycrypt.tokenTable.global, color: "#007020"}
  , {tag: easycrypt.tokenTable.internal, italic: true}
  , {tag: easycrypt.tokenTable.prog, color: "#06287e"}
  , {tag: easycrypt.tokenTable.tactic, color: "#06287e"}
  , {tag: easycrypt.tokenTable.tactical, color: "#9932a8"}
]));
