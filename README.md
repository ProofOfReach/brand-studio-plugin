# Brand Studio

> Complete brand identity toolkit for Claude Code. Create compelling copy, design visual assets, and build cohesive brand kits—all from your terminal.

[![Claude Code Plugin](https://img.shields.io/badge/Claude%20Code-Plugin-7C3AED)](https://claude.ai/code)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-0.1.0-green.svg)]()

---

## Overview

Brand Studio combines three specialized skills into a unified brand creation workflow:

| Skill | Purpose | Key Commands |
|-------|---------|--------------|
| **Copy** | Persuasive writing and messaging | `/copy`, `/headline`, `/review-copy` |
| **Design** | Visual identity and assets | `/design`, `/palette`, `/typography` |
| **Brand-Kit** | Unified brand systems | `/brand-kit`, `/brand-audit`, `/brand-apply` |

## Installation

```bash
# Install via Claude Code plugin manager
claude plugin install proofofreach/brand-studio
```

## Quick Start

### Copywriting

```bash
# Generate headlines for a product launch
/headline "AI-powered project management tool"

# Write landing page copy
/copy landing-page --product "TaskFlow" --audience "busy professionals"

# Review and improve existing copy
/review-copy path/to/copy.md
```

### Design

```bash
# Create a color palette from a mood
/palette --mood "professional yet approachable"

# Generate typography recommendations
/typography --industry "fintech" --style "modern"

# Design visual identity elements
/design logo-concept --brand "Acme Corp"
```

### Brand Kit

```bash
# Build a complete brand kit
/brand-kit create --name "StartupX" --values "innovation, trust, simplicity"

# Audit existing brand assets for consistency
/brand-audit ./brand-assets/

# Apply brand guidelines to content
/brand-apply --kit ./brand-kit.json --content ./marketing/
```

---

## Features

### Copy Skill

Research-driven copywriting grounded in proven frameworks from Hopkins, Cialdini, Schwartz, and the Heath brothers.

**Two Operating Modes:**
- **Write Mode** — Create new copy following a structured five-stage process: Research → Headlines → Lead → Body → CTA
- **Review Mode** — Audit existing copy for clarity, persuasion, and conversion potential

**Capabilities:**
- Headlines using proven formulas (4 U's, PAS, AIDA)
- Long-form copy: landing pages, sales letters, email sequences
- Awareness-level matching (Schwartz's 5 levels)
- Psychology-based persuasion (Cialdini's 6 principles)
- Tone matching to brand guidelines

**Reference Library:**
- `headlines.md` — Headline formulas and swipe file
- `landing-pages.md` — LIFT Model, conversion optimization
- `email.md` — Subject lines, sequences, list relationships
- `psychology.md` — Influence principles and triggers
- `offers-pricing.md` — Value equations, guarantee frameworks

### Design Skill

Visual identity creation from concept through delivery, with AI image generation integration.

**Five-Stage Process:**
1. **Discovery** — Brand foundation, audience research, competitive analysis
2. **Concept Development** — Mind mapping, moodboards, direction selection
3. **Visual Exploration** — Logo concepts, color palettes, typography systems
4. **Refinement** — Technical testing, context validation, iteration
5. **Delivery** — Asset packaging, brand guidelines documentation

**Capabilities:**
- Logo design with multiple concept directions
- Color palettes with accessibility verification (WCAG)
- Typography selection and pairing strategies
- Visual identity systems and pattern development
- Integration with nano-banana MCP for AI image generation

**Reference Library:**
- `logo-design-principles.md` — Mark construction, testing frameworks
- `color-theory-principles.md` — Harmony systems, psychology, accessibility
- `typography-principles.md` — Classification, pairing, hierarchy
- `brand-strategy-principles.md` — Positioning, architecture, differentiation

### Brand-Kit Skill

Orchestration layer that combines copy and design into complete brand identities.

**Five-Phase Workflow:**
1. **Brand Strategy Foundation** — Positioning, values, personality, audience
2. **Naming** (if required) — Strategy, development, evaluation
3. **Visual Identity** — Logo, colors, typography, supporting elements
4. **Brand Voice** — Tone, messaging guidelines, writing standards
5. **Brand Guidelines Document** — Comprehensive deliverable

**Output:**
Complete brand guidelines document covering:
- Brand foundation and purpose
- Personality and character
- Target audience profiles
- Visual identity system
- Voice and tone guidelines
- Application examples
- Asset specifications

---

## Commands Reference

| Command | Skill | Description |
|---------|-------|-------------|
| `/copy` | copy | Generate marketing copy for any format |
| `/headline` | copy | Create headline variations with rationale |
| `/review-copy` | copy | Audit and improve existing copy |
| `/copy-lpo` | copy | Landing page optimization workflow |
| `/design` | design | Create visual concepts and assets |
| `/palette` | design | Generate harmonious color schemes |
| `/typography` | design | Typography selection and pairing |
| `/brand-kit` | brand-kit | Build comprehensive brand guidelines |
| `/brand-audit` | brand-kit | Check assets against brand standards |
| `/brand-apply` | brand-kit | Apply brand rules to new content |

---

## Directory Structure

```
brand-studio/
├── .claude-plugin/
│   └── plugin.json           # Plugin metadata
├── commands/
│   ├── copy.md               # Copy command definitions
│   └── design.md             # Design command definitions
├── skills/
│   ├── copy/
│   │   ├── SKILL.md          # Copywriting skill definition
│   │   ├── references/       # Copywriting frameworks
│   │   └── scripts/          # Analysis tools
│   ├── design/
│   │   ├── SKILL.md          # Design skill definition
│   │   └── references/       # Design principles
│   └── brand-kit/
│       └── SKILL.md          # Brand orchestration skill
└── README.md
```

---

## Requirements

- **Claude Code CLI** — Core requirement
- **Image Generation MCP** — Optional, for AI-generated visual assets (nano-banana recommended)

---

## Methodology

### Copywriting Foundations

Built on principles from the masters:
- **Claude Hopkins** — Scientific advertising, specificity, testing
- **Robert Cialdini** — Six principles of influence
- **Eugene Schwartz** — Awareness levels, market sophistication
- **Chip & Dan Heath** — Made to Stick (SUCCESs framework)

### Design Foundations

Grounded in established design theory:
- **Logo Design** — Simplicity, memorability, versatility, appropriateness, timelessness
- **Color Theory** — Harmony, contrast, psychology, context, consistency
- **Typography** — Hierarchy, legibility, personality, pairing, restraint
- **Brand Strategy** — Positioning, differentiation, consistency, evolution, authenticity

---

## License

MIT

---

## Contributing

Contributions welcome. Please open an issue to discuss proposed changes before submitting a PR.

---

*Built by [ProofOfReach](https://github.com/ProofOfReach)*
