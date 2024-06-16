import {nodeResolve} from "@rollup/plugin-node-resolve"

export default {
  input: "./replay.mjs",
  output: {
    file: "./replay.bundle.js",
    format: "iife",
    name: "ecmodule"
  },
  plugins: [nodeResolve()]
}