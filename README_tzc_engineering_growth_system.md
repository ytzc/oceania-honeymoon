# tzc-engineering-growth-system
### *Build slow. Build deep. Build to last.*

---

## Introduction

This repository is a personal engineering growth system — a structured, long-term framework for compounding technical skills across multiple disciplines.

It is not a course, a bootcamp, or a sprint. It is an **operating system for continuous self-development**: organizing learning tracks, practice routines, technical notes, reading, memorization, and progress review into a single coherent system.

Everything here is designed to be maintained consistently over months and years, not days.

---

## Purpose

Most learning efforts fail not from lack of motivation, but from lack of structure. Skills plateau. Notes become orphaned. Progress becomes invisible.

This system exists to solve that:

- Accumulate skills **systematically** rather than reactively
- Create a **permanent, searchable knowledge base** that compounds over time
- Build habits of review and reflection that surface gaps and reinforce depth
- Maintain clarity on long-term direction even during short-term execution

---

## Principles

| Principle | Description |
|---|---|
| **Consistency over intensity** | 30 minutes daily beats 5-hour weekend sessions |
| **Compounding** | Knowledge and practice compound; small daily inputs have outsized long-term returns |
| **Deliberate practice** | Targeted work on weaknesses, not comfortable repetition of strengths |
| **Depth before breadth** | Understand fundamentals deeply before expanding surface area |
| **Capture everything** | Insights, failures, and edge cases are worth more than clean summaries |
| **Review closes the loop** | Learning without review decays; the system requires structured revisiting |

---

## Repository Structure

```
tzc-engineering-growth-system/
│
├── PLAN/                        # Master plan, milestones, long-term goals
│   ├── master-plan.md
│   ├── milestones.md
│   └── vision.md
│
├── SKILLS/                      # 10 skill tracks, each self-contained
│   ├── 01-data-structures-algorithms/
│   ├── 02-system-design/
│   ├── 03-backend-engineering/
│   ├── 04-databases/
│   ├── 05-security/
│   ├── 06-networking/
│   ├── 07-operating-systems/
│   ├── 08-distributed-systems/
│   ├── 09-devops-infrastructure/
│   └── 10-software-engineering-practices/
│
├── LEETCODE/                    # Problem logs, pattern reference, strategy
│   ├── log/
│   ├── patterns/
│   └── strategy.md
│
├── READING/                     # Book list, reading notes, summaries
│   ├── booklist.md
│   ├── notes/
│   └── summaries/
│
├── NOTES/                       # Technical deep-dives and topic notes
│   ├── systems/
│   ├── security/
│   ├── backend/
│   └── misc/
│
├── MEMORIZATION/                # Daily recall cards, spaced repetition content
│   ├── daily/
│   └── index.md
│
├── REVIEWS/                     # Weekly and monthly retrospectives
│   ├── weekly/
│   └── monthly/
│
└── PROGRESS/                    # Dashboard, habit logs, metrics
    ├── dashboard.md
    ├── habits.md
    └── metrics/
```

---

## Learning System

The system operates across three time horizons:

**Daily (15–60 min)**
- LeetCode: 1 problem or review 1 pattern
- Memorization: review current recall deck
- Notes: capture any insight from the day's work

**Weekly (1–2 hrs, dedicated session)**
- Progress 1 skill track by meaningful depth
- Read or finish a book chapter
- Write weekly review

**Monthly (2–4 hrs)**
- Audit all 10 skill tracks for gaps
- Update milestones and PLAN/
- Write monthly review with metrics

---

## 10 Skill Tracks

Each skill track lives in `SKILLS/XX-track-name/` and contains:
- `roadmap.md` — learning path and milestones for this skill
- `notes/` — structured technical notes
- `resources.md` — curated references, books, courses
- `log.md` — weekly progress entries

| # | Track | Status |
|---|---|---|
| 01 | Data Structures & Algorithms | 🔵 Active |
| 02 | System Design | 🔵 Active |
| 03 | Backend Engineering | 🔵 Active |
| 04 | Databases | ⬜ Queued |
| 05 | Security | ⬜ Queued |
| 06 | Networking | ⬜ Queued |
| 07 | Operating Systems | ⬜ Queued |
| 08 | Distributed Systems | ⬜ Queued |
| 09 | DevOps & Infrastructure | ⬜ Queued |
| 10 | Software Engineering Practices | ⬜ Queued |

> Focus on 2–3 active tracks at a time. Rotate based on monthly review.

---

## LeetCode Strategy

**Goal:** Build pattern recognition, not memorization of solutions.

**Approach:**
1. Categorize problems by pattern (two pointers, sliding window, BFS/DFS, DP, etc.)
2. Log each problem with: difficulty, time taken, approach, mistakes, key insight
3. Re-solve incorrect or slow problems after 1 week
4. Maintain a pattern reference card in `LEETCODE/patterns/`

**Structure:**
```
LEETCODE/
├── log/
│   └── YYYY-MM-DD.md          # Daily problem log
├── patterns/
│   ├── sliding-window.md
│   ├── two-pointers.md
│   ├── dynamic-programming.md
│   └── ...
└── strategy.md                # This document, plus weekly goals
```

**Weekly target:** 5–7 problems, 1 pattern deep-dive.

---

## Reading System

**Intake:**
- Maintain a prioritized reading list in `READING/booklist.md`
- Each book gets a notes file under `READING/notes/`

**Note format for each book:**
- Core thesis
- Key concepts (with personal interpretation)
- Actionable takeaways
- Quotes worth keeping

**Review cadence:**
- After each chapter: capture key points while fresh
- After finishing: write a 1-page summary in `READING/summaries/`
- Monthly: re-read summaries of recently finished books

---

## Notes System

Technical notes live in `NOTES/` organized by domain. Each note should be:

- **Atomic** — one concept, one file
- **Self-contained** — readable without prior context in other notes
- **Linked** — reference related notes by filename
- **Dated** — filename prefix `YYYY-MM-DD-topic.md` for time-sensitive content

Notes are not meant to be polished documentation. They are working knowledge — rough where needed, precise where it counts.

---

## Memorization System

`MEMORIZATION/` holds content that requires active recall rather than passive reading.

**Use cases:**
- Algorithm complexity cheat sheet
- System design component properties
- Security attack/defense taxonomy
- CLI commands, API patterns, protocol details

**Format:** Each file in `MEMORIZATION/daily/` is a set of Q&A pairs or cloze-style prompts that can be reviewed in 5–10 minutes.

**Optional:** Export to Anki or Obsidian for spaced repetition tooling.

---

## Progress Tracking

`PROGRESS/dashboard.md` is the single source of truth for current system state.

It tracks:
- Active skill tracks and current depth
- LeetCode total count, weekly average, pattern coverage
- Books finished vs. in-progress
- Habit consistency (daily streak data)
- Monthly highlights

`PROGRESS/habits.md` logs daily check-ins: which routines were completed each day.

Update the dashboard during your weekly review.

---

## Weekly / Monthly Review

### Weekly Review (`REVIEWS/weekly/YYYY-WXX.md`)

Answer these every week:
1. What did I work on this week?
2. What progress did I make in each active skill track?
3. Where did I fall short of the plan?
4. What is the one most important thing to focus on next week?
5. Any insight worth keeping?

### Monthly Review (`REVIEWS/monthly/YYYY-MM.md`)

1. What were the major milestones reached this month?
2. How consistent were my daily habits? (use data from PROGRESS/)
3. Which skill tracks need more or less attention?
4. Is the master plan still aligned with my goals?
5. What should I start, stop, or continue?

---

## Getting Started

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/tzc-engineering-growth-system.git
cd tzc-engineering-growth-system

# Review the master plan and current milestones
open PLAN/master-plan.md

# Check active skill tracks
ls SKILLS/

# Log your first LeetCode problem
touch LEETCODE/log/$(date +%Y-%m-%d).md

# Write your first weekly review
touch REVIEWS/weekly/$(date +%G-W%V).md
```

Start with `PLAN/master-plan.md`. Define your 1-year goal, your top 3 skill priorities, and your daily commitment. Everything else follows from that.

---

## Usage Rules

**Daily (required):**
- [ ] At minimum: open one file, add one entry, or solve one problem
- [ ] Update `PROGRESS/habits.md` with today's check-in

**Weekly (required):**
- [ ] Complete weekly review in `REVIEWS/weekly/`
- [ ] Update `PROGRESS/dashboard.md`
- [ ] Advance at least one skill track

**Monthly (required):**
- [ ] Complete monthly review in `REVIEWS/monthly/`
- [ ] Audit skill track statuses and rotate if needed
- [ ] Update `PLAN/milestones.md` with what was achieved

**General rules:**
- No orphaned files — every file belongs to a section and serves a purpose
- Prefer small consistent commits over large batches
- Notes are for you — write clearly but don't over-polish
- If the system feels heavy, simplify it — the goal is sustainable operation

---

## License

Personal use. Not for distribution.

---

*Last updated: 2026-04-05*
