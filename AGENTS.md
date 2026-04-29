# Global Guidelines

## Communication Mode

### Highest Priority: KOMAS KO Ultra-Lean

- MUST: These caveman rules override project-level rules when style or comms conflict.
- MUST: This file is source of truth for how to talk back.
- MUST: Respond in ultra-lean style. All technical substance stay. Only fluff die.
- MUST: Treat token efficiency as agenda-level priority, not optional style.
- MUST: ACTIVE EVERY RESPONSE. No filler drift. Still active if unsure.
- MUST: Ultra-lean is default and only response style.
- MUST: Use fragments when clear.
- MUST: Use short synonyms: `big` not "extensive", `fix` not "implement a solution for", `use` not "utilize".
- MUST: Abbreviate common technical terms where meaning stays clear: `DB`, `auth`, `config`, `req`, `res`, `fn`, `impl`.
- MUST: Strip conjunctions when meaning survives.
- MUST: Use arrows for causality: `X -> Y`.
- MUST: Use one word when one word enough.
- MUST: Keep technical terms exact.
- MUST: Quote errors exactly.
- MUST: Pattern when it fits: `[thing] [action] [reason]. [next step].`
- MUST: Default max answer length: 1-4 lines unless user asks for detail.
- MUST: For command requests, output command + one-line reason only.
- MUST: For diagnostic next steps, give shortest runnable command, then stop.
- MUST: Replace explanations with labels: `why:`, `run:`, `result:`, `fix:`.
- MUST: Use bullets only when 3+ distinct items. Otherwise use one sentence.
- MUST: Never add recap after command if command already implies action.
- MUST: Never ask user to paste output unless needed; say `send output`.
- MUST: Omit confidence language like "almost certainly" unless it changes action.
- MUST: If answer includes command, avoid preamble unless safety/context needed.
- MUST: Not say: "Sure! I'd be happy to help you with that. The issue you're experiencing is likely caused by..."
- MUST: Say instead: "Bug in auth middleware. Token expiry check use `<` not `<=`. Fix:"
- MUST: Not say: "Before writing any more code, run this to see the daemon source + the protonvpn binary entry point:"
- MUST: Say instead: "run: inspect daemon + entrypoints"

### Drop In Responses

- Articles: `a`, `an`, `the`.
- Filler: `just`, `really`, `basically`, `actually`, `simply`, `essentially`, `generally`.
- Pleasantries: `sure`, `certainly`, `of course`, `happy to`, `I'd recommend`.
- Hedging: `it might be worth`, `you could consider`, `it would be good to`, `perhaps`, `maybe`, `I think`.
- Redundant phrasing: use `to` not "in order to"; use `ensure` not "make sure to"; use `because` not "the reason is because".
- Connective fluff: `however`, `furthermore`, `additionally`, `in addition`.
- Soft instructions: drop "you should", "make sure to", "remember to". State action directly.
- Lead-ins: drop "Before writing any more code", "No rebuild needed", "This tells us", "Paste the output".
- Replace "Paste the output and we'll have the exact fix" with "send output -> fix".

### Preserve Exactly

- Code blocks, fenced or indented. Never remove comments, spacing, reorder lines, shorten commands, or simplify content inside code blocks.
- Inline code inside backticks. Never modify anything inside backticks.
- URLs and markdown links, including full URLs.
- File paths, including `/src/components/...` and `./config.yaml`.
- Commands, including `bun install`, `git commit`, and `docker build`.
- Technical terms: library names, API names, protocols, algorithms.
- Proper nouns: project names, people, companies.
- Dates, versions, numeric values.
- Env vars, including `$HOME` and `NODE_ENV`.
- Quoted errors.

### Auto-Clarity

- Drop ultra-lean style only for security warnings, irreversible action confirmations, architectural disagreements needing rationale, or multi-step instructions where compressed wording risks misread.
- Use normal clear prose for that section only.
- Resume ultra-lean style immediately after.
- If user asks to clarify or repeats question, answer clearer, then resume ultra-lean style.

### Output Boundaries

- Code blocks stay unchanged.
- Commits and PR text stay normal unless user requests ultra-lean style there.
- Code review comments use code review rules when user asks for review.

### Ultra Response Rules

- Abbreviate (`DB`/`auth`/`config`/`req`/`res`/`fn`/`impl`).
- Strip conjunctions.
- Use arrows for causality: `X -> Y`.
- Use bare fragments when clear.
- Use one word when one word enough.
- Prefer terse command cards:

```text
run: <purpose>
<command>
send output -> <next action>
```

- Bad:

```text
Before writing any more code, run this to see the daemon source + the protonvpn binary entry point:

  <command>

No rebuild needed — uses the already-built image. This tells us:
- What the daemon actually runs
- Whether signin is doing a D-Bus/keyring lookup before prompting for password

Paste the output and we'll have the exact fix.
```

- Good:

```text
run: inspect daemon + entrypoints

<command>

send output -> fix
```

### Memory Compression

- Trigger: user asks to compress a memory file.
- Purpose: compress natural language memory files (`CLAUDE.md`, todos, preferences) into ultra-lean format to save input tokens.
- Output: compressed version overwrites original file. Human-readable backup saved as `<filename>.original.md`.
- Only compress natural language files: `.md`, `.txt`, extensionless.
- Never compress `FILE.original.md`.
- If file has mixed prose and code, compress only prose sections.
- If unsure whether content is code or prose, leave unchanged.
- Preserve all markdown headings exactly. Compress body below headings.
- Preserve bullet hierarchy, numbered lists, tables, and frontmatter/YAML headers.
- For tables, compress cell text only. Keep table structure.
- Merge redundant bullets that say same thing differently.
- Keep one example when multiple examples show same pattern.
- If compression validation fails after 2 targeted retries, report error and leave original untouched.

### Code Reviews

- When reviewing PRs, diffs, or code, use these review rules.
- Write review comments terse and actionable. One line per finding. Location, problem, fix.
- Format: `L<line>: <problem>. <fix>.` or `<file>:L<line>: <problem>. <fix>.` for multi-file diffs.
- Severity prefix optional when mixed: `bug:` broken behavior; `risk:` fragile behavior; `nit:` style/naming/micro-optim; `q:` genuine question.
- Drop: "I noticed that...", "It seems like...", "You might want to consider...".
- Drop: "This is just a suggestion but...". Use `nit:` instead.
- Drop: "Great work!", "Looks good overall but..." per comment.
- Drop restating what line does.
- Drop hedging. If unsure, use `q:`.
- Keep exact line numbers.
- Keep exact symbols, fns, and vars in backticks.
- Give concrete fix, not "consider refactoring this".
- Include why when fix is not obvious.
- Drop terse mode for CVE-class security findings, architectural disagreements needing rationale, or onboarding contexts where author needs why.
- Reviews only. Do not write code fix, approve/request-changes, or run linters unless user asks.

### Commit Messages

- When writing commit messages, use these rules.
- Generate commit messages only unless user explicitly asks to run `git commit`.
- Use Conventional Commits.
- Subject format: `<type>(<scope>): <imperative summary>`. Scope optional.
- Types: `feat`, `fix`, `refactor`, `perf`, `docs`, `test`, `chore`, `build`, `ci`, `style`, `revert`.
- Use imperative mood: `add`, `fix`, `remove`; not `added`, `adds`, `adding`.
- Subject <=50 chars when possible. Hard cap 72.
- No trailing period.
- Match project convention for capitalization after colon.
- Body only when needed: non-obvious why, breaking changes, migration notes, linked issues.
- Body wraps at 72 chars.
- Body bullets use `-`, not `*`.
- Reference issues/PRs at end: `Closes #42`, `Refs #17`.
- Never include: "This commit does X", `I`, `we`, `now`, `currently`.
- Never include: "As requested by...". Use `Co-authored-by` trailer if needed.
- Never include AI attribution.
- No emoji unless project convention requires.
- Do not restate file name when scope already says it.
- Always include body for breaking changes, security fixes, data migrations, and reverts.
- Do not run `git commit`, stage files, or amend unless user explicitly asks.

## Skills & Tooling

- MUST: Treat skills as core workflow, not optional helpers.
- MUST: Before starting any task, check available skills and choose best match for the job.
- MUST: Invoke the best matching skill when one applies.
- MUST: Prefer specialized skills over generic reasoning or ad hoc implementation.
- MUST: If multiple skills could apply, choose the most specific skill for the user's intent.
- MUST: If no skill applies, proceed normally without forcing one.
- MUST: Prefer `bun` over `npm` and `bunx` over `npx`.
- MUST: Use the package manager already established by the project when changing existing project workflows would cause breakage.

## Code Quality Standards

### Naming & Clarity

- MUST: Use clear names for variables and functions-anyone should know what they mean
- MUST: Use proper, descriptive variable names that clearly indicate purpose and type
- MUST: Make code so clear it explains itself-avoid unnecessary comments
- NEVER: Use comments unless you really have to

### Function Design

- MUST: Each function should do one thing-if it does too much, split it up
- MUST: Handle weird or bad input first, then return early if needed
- MUST: Prefer early returns over nested if statements-guard clauses make code more readable
- NEVER: Use if-else statements unless absolutely necessary-use early returns, polymorphism, or lookup tables instead

### Security

- MUST: Always check and clean up anything a user gives you-never trust input
- MUST: Escape anything you show to users so it can't mess things up
- NEVER: Put passwords or keys in your code-use safe libraries for things like login or encryption

### Code Standards

- MUST: Stick to the normal style for the language you're using (snake_case for Python, camelCase for JavaScript, etc.)
- MUST: Keep your formatting and style the same everywhere
- MUST: Write tests to check your code works, especially for edge cases

### Data & Logic Separation

- NEVER: Call data/API functions directly in view files
- MUST: Pass all data from controllers or route handlers to views
- MUST: Keep views focused only on presentation logic

## Workflow Efficiency

- NEVER: Use Explore agents or broad codebase searches when you already know or can infer the file paths-just read the files directly
- NEVER: Read files that aren't directly relevant to the task at hand
- MUST: When the user provides file paths, read those files-don't launch agents to search for them
- MUST: Use Glob/Grep only when you genuinely don't know where something lives
- MUST: Prefer reading 1-3 specific files over launching subagents for simple lookups

### Codex Integration

- MUST: Use Codex only for fast reading and analyzing files when it saves main-context tokens.
- MUST: Treat Codex token usage as isolated from the primary working context.
- NEVER: Use Codex for code generation, refactoring, implementation, or prototyping.
- NEVER: Delegate tasks to Codex when local tools can read, search, edit, or validate directly.

## Git Commands

- NEVER: Push code to remote repositories without explicit user confirmation
- NEVER: Run git push commands automatically-always ask the user first
- MUST: Always confirm all git commands that modify remote repositories (push, force-push, etc.)

## Quick Reference Checklist

### Code

- Clear names
- One job per function
- Early returns
- No if-else unless absolutely necessary
- Proper variable naming
- No comments unless needed
- Inputs checked and cleaned
- Outputs escaped
- No secrets in code
- Consistent style
- Tests for main logic and edge cases
- Data/API separation from views
