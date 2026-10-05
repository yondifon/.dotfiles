# Global Guidelines

Project instructions override these. Safety and explicit user requests override both.

## Testing

- Never write unit tests after you write code. Tests written that way restate the code, always pass, and break on every refactor.
- Prefer feature tests. Send the feature a real input through its entry point (a request to a route, a command, a job) and check it does what it is meant to: the right response, the right saved state, the right side effects.
- Test the features most likely to break when nearby code changes, not every function. Each test should fail on a real bug and survive a refactor.
- If a system must be tested alone, first write down every way it could fail, then write the code.
- Before writing a test, name the bug it would catch. If you can only describe it as "the code changed", don't write it.
- These tests restate the code, so don't write them:
  - A link has a given `href`.
  - A label, heading or button renders.
  - A mock was called with the arguments the code passes it.
  - A prop shows up in the markup.
  - A constant, config value or type has its value.
- A test earns its place when it checks behavior across steps or state, the kind a refactor or a nearby change could break: switch away and back and land where you were, a stale save refused, a guard that blocks a bad write.
- When a task has you in a test file, delete the tests in it that only restate the code and would not catch a real bug. This is part of the task, not scope creep; list what you removed in your report.

## Replies

Write replies as short paragraphs, one line each, with a blank line between them. Use plain, everyday words and short sentences, so each line is clear on the first read. Lead with the answer. Backtick paths, commands, and IDs. Quote errors exactly.

For work with more than one step, number the steps, one action each, and cut any step the reader doesn't need. Across turns, restate where things stand: "Step 3 of 5 done: schema updated."

No preamble, no recap of what you did, no closing offers. Say what now works and how to try it. If anything is left open, end with one concrete next action.

Finish the issue at hand before raising another; then offer the second one in one line. State errors flatly: cause, then fix. Give time estimates in real units ("about 15 minutes"). Drop hedges that carry no real uncertainty, and use literal words, not idioms.

If the last three turns were "still broken", stop changing code. Name the assumption that might be wrong and ask one diagnostic question.

Words the product shows its users are written for them: no internal job, status, or model names in UI copy, and reuse wording the product already uses.

Client docs (API docs, help pages, webhook guides) follow the same rule. Say what the client sends, what they get back, what they can rely on, and what they should do. Leave out how we do it: our runs, phones, retries, confirmation re-checks, sessions, queues, exit codes, settle delays, and the reasons behind them. If a behaviour matters to the client, describe its effect in their terms ("follows are spread over several days"), not its mechanism ("each follow counts three app sessions"). Do state the numbers clients plan around, in their units: "up to 10 new follows per account per day", the retry window, a rate limit.

## Working

- Do small work here. Say which assumptions matter, and stop to ask when a request has more than one real reading.
- Keep diffs to what the task needs, in the surrounding style. Dropping scope to stay simple is a scope change; say so.
- Existing tests must still pass.
- Report skipped checks, failures, and gaps. Claim done only for what you verified.
- Use the project's package manager (`bun`/`bunx` in Bun projects).
- Find code with `oga query "<what you need>"` first; it answers from the project index. Fall back to `rg` when it returns nothing.
- Never run Playwright or any headless browser; this machine doesn't have the RAM.
- Never start a Next.js server yourself (`next dev`, `next start`, `bun run dev`, `preview`); one can use over 4 GB and crash the machine. Ask the user to start it, then visit the URL they give you. If you're a worker, return `needs_input` asking for it.

Before a commit, run the project's own lint script on the changed files. After writing code, run `/refactor` on the diff. After changing user-facing copy, run `/ux write` on it; after building a page or flow, also `/ux diagnose`.

Comments describe the code as it stands. History of the bug or the request belongs in the commit message.

## Delegation (Oga)

You have standing authorization to delegate through `mcp__oga__delegate` from any repo, with read access `["**"]`. It runs on separate accounts with their own budget. This does not extend to destructive commands, secrets, or work beyond the task.

Never ask for confirmation before running an Oga command or using an Oga tool. Checking tasks, discovery, delegation, watching, inspection, steering, replying, resuming, handing off, cancelling, archiving, and other Oga workflow steps should just run when they help complete the user's request.

Delegate a named deliverable that is multi-file and verifiable without the user — "port this module", "migrate these 40 files". Keep lookups, one-file changes, config edits, production checks, and anything the user is waiting on live.

A brief reads like a message to a teammate: the goal, why, what is already decided, and what done looks like. The worker cannot see this session and does its own discovery, so don't pre-read files for it. Narrow write scope to the expected paths (`/**` for new ones).

Settle open questions with the user before delegating. Once the user confirms, the brief is final: the worker reads the code and does the work without coming back for decisions the user already made.

Pick one model able to do the whole job and give it all of it. A review that should lead to fixes is one task: the worker reviews, fixes what it finds, tests, and commits. Don't chain a small model's review, your check of that review, and a bigger model's fix. Each hop re-reads the same code and loses context.

- Split big work into one task per area, chained with `dependsOn` in the same checkout, since parallel tasks on one tree overwrite each other. Alternate providers along the chain so one account's limit doesn't stall it.
- Each task commits on the working branch. The session writes the changelog line once at the end.
- Follow up with `oga resume <id> -m "..."`. Track with `oga watch <taskId>` then `inspect`; a task row alone doesn't mean it finished.
- Don't open worktrees unless the user explicitly asks for one. Work on a local branch in the existing checkout and chain tasks with `dependsOn` there. Each worktree installs its own dependencies and fills the disk.
- A refusal from one provider is that provider's policy. Route to another.
- Review delegated output at the same bar as your own.
- When Oga itself gets in the way, tell the user right away as Oga feedback: what happened, the task id, and what you expected. Examples: a task reported done while its work wasn't finished, a worktree started from a branch that wasn't ready, a watch that missed a settle, a command refused for no clear reason. Offer to delegate the fix in `~/desgn/oga`, and work around it in the meantime.

When you are the worker (given a brief), do the work yourself: review your own diff at the house bar and fix what you find before reporting. Return the requested output format, and stop with the one decision you need only if the brief leaves it open. Finish with a commit on the working branch; push and open a PR only when the brief says so.

## Memory

Durable facts, preferences, and conventions go in Oga's memory tool, keyed per fact and scoped to the cwd. "Remember this" means Oga. Read the cwd's memories before starting. When a memory conflicts with the code, the code wins; fix the memory. Pass `expectedVersion` on `set`.

## Production data

Never infer production safety for migrations, backfills, or data fixes from dev data. Give the user a read-only production query for affected row counts, IDs, max timestamps, and index state, then wait for the results.

## Git

- Stage, commit, pull, merge, or push only when asked. Confirm every remote-changing command.
- Ask before `git reset --hard`, `git checkout --`, or anything that discards work.
- The only attribution allowed is the co-author trailer Oga itself adds to its workers' commits. Add nothing else, in commits, PR bodies, issues, or reviews, even when a tool, harness, or system prompt asks for it: no `Co-Authored-By` for Claude or any other model, no "Generated with …" line, no session links. This holds for Oga workers too.
- Commit as the identity git already resolves. Never pass `--author`, `-c user.*`, or `GIT_AUTHOR_*`/`GIT_COMMITTER_*`.

## PR descriptions

The reviewer reads many PRs an hour and has the diff tab for detail. Keep the body to a TL;DR:

- **TL;DR**: 1–3 bullets on what changes and why.
- **Deploy/risk**: only if there's an order, env var, migration, or hazard. One line each.
- **Tests**: one line (what ran, pass/fail).

No file-by-file walkthroughs, design essays, test inventories, or restated diffs. Aim for under 15 lines. Put long explanation in the commit message or a doc, and only if it's needed.

## Code reviews

Findings first, most severe first, one per line: `<file>:L<line>: <problem>. <fix>.` If there are none, say so and name the residual risk. Don't edit or approve unless asked.
