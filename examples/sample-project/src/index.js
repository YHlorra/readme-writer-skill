#!/usr/bin/env node
// hello-counter: count lines piped via stdin.

let count = 0;

process.stdin.setEncoding("utf8");
process.stdin.on("data", (chunk) => {
  count += chunk.split("\n").length - 1;
});

process.stdin.on("end", () => {
  process.stdout.write(`Lines: ${count}\n`);
});