import {EditorView, basicSetup} from "codemirror"
import { EditorState } from "@codemirror/state"
import {StreamLanguage, syntaxHighlighting} from "@codemirror/language"

import {easycrypt, ecstyle} from "./easycrypt.mjs"

export function createECEditor(textarea) {
  let editor = new EditorView({
    doc: textarea.value,
    extensions: [
      basicSetup
    , StreamLanguage.define(easycrypt)
    , syntaxHighlighting(ecstyle)
    , EditorState.readOnly.of(true)
    ]
  });

  textarea.parentNode.insertBefore(editor.dom, textarea);
  textarea.style.display = "none";
  return editor;
}
