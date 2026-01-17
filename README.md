# Brand Studio

<div align="center">

[![Claude Code Plugin](https://img.shields.io/badge/Claude%20Code-Plugin-7C3AED)](https://claude.ai/code)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-0.1.0-blue.svg)]()

**Complete brand identity toolkit for Claude Code. Copywriting, visual design, and brand guidelines — all from your terminal.**

### Quick Install

```bash
claude plugin add proofofreach/brand-studio
```

</div>

---

## TL;DR

**The Problem**: Building a brand requires juggling copywriters, designers, and brand strategists. You end up with inconsistent messaging, mismatched visuals, and brand guidelines nobody follows.

**The Solution**: Brand Studio gives Claude Code three specialized skills that work together — research-driven copywriting, principled visual design, and unified brand system orchestration.

### Why Use Brand Studio?

| Feature | What It Does |
|---------|--------------|
| **Research-First Copy** | Headlines and sales copy grounded in Hopkins, Cialdini, Schwartz frameworks |
| **Awareness-Level Matching** | Automatically adapts messaging to cold, warm, or hot audiences |
| **AI-Powered Design** | Logo concepts, color palettes, typography via nano-banana MCP |
| **Brand Kit Orchestration** | Full brand guidelines from strategy through visual identity to voice |
| **Reference Libraries** | 15+ specialized frameworks loaded on-demand per task |

---

## Quick Example

```bash
# Generate 10+ headline variations for a product
/headline "AI-powered inventory management for restaurants"

# Write a complete landing page with research phase
/copy landing-page --product "MenuFlow" --audience "restaurant owners"

# Create a color palette with accessibility checks
/palette --mood "trustworthy, modern, appetizing"

# Build a full brand kit from scratch
/brand-kit create --name "MenuFlow" --values "efficiency, reliability, simplicity"

# Review existing copy and get specific fixes
/review-copy ./marketing/homepage.md
```

---

## How Brand Studio Compares

| Capability | Brand Studio | Generic AI | Copywriter + Designer | DIY |
|------------|--------------|------------|----------------------|-----|
| Research-first process | ✅ Built-in | ❌ Skips research | ✅ Manual | ❌ |
| Awareness-level matching | ✅ Automatic | ❌ Generic | ⚠️ If experienced | ❌ |
| Proven frameworks | ✅ 15+ loaded | ❌ Generic prompts | ⚠️ Varies | ❌ |
| Visual + verbal alignment | ✅ Integrated | ❌ Separate | ⚠️ Coordination needed | ❌ |
| Brand guidelines output | ✅ Complete doc | ❌ Fragments | ✅ Manual assembly | ❌ |

**When to use Brand Studio:**
- Building a new brand from scratch
- Creating landing pages, emails, ads with proven conversion frameworks
- Need consistent visual identity with strategic rationale

**When Brand Studio might not be ideal:**
- Highly regulated industries requiring legal review
- Established brands with strict existing guidelines (use those instead)

---

## Installation

### Option 1: Clone and Configure (Recommended)

```bash
# Clone the repo
git clone https://github.com/ProofOfReach/brand-studio-plugin.git ~/.claude/plugins/brand-studio
```

Then add to your `~/.claude/settings.json`:

```json
{
  "pluginDirs": ["~/.claude/plugins/brand-studio"]
}
```

### Option 2: Per-Session Loading

```bash
claude --plugin-dir ~/.claude/plugins/brand-studio
```

---

## Commands

### Copy Skill

| Command | Description | Example |
|---------|-------------|---------|
| `/copy` | Generate marketing copy | `/copy landing-page --product "X" --audience "Y"` |
| `/headline` | Create headline variations | `/headline "product description"` |
| `/review-copy` | Audit and improve existing copy | `/review-copy ./path/to/copy.md` |
| `/copy-lpo` | Landing page optimization workflow | `/copy-lpo ./landing.html` |

### Design Skill

| Command | Description | Example |
|---------|-------------|---------|
| `/design` | Create visual concepts | `/design logo-concept --brand "Acme"` |
| `/palette` | Generate color schemes | `/palette --mood "professional"` |
| `/typography` | Typography recommendations | `/typography --industry "fintech"` |

### Brand-Kit Skill

| Command | Description | Example |
|---------|-------------|---------|
| `/brand-kit` | Build complete brand guidelines | `/brand-kit create --name "X" --values "a, b, c"` |
| `/brand-audit` | Check brand consistency | `/brand-audit ./brand-assets/` |
| `/brand-apply` | Apply brand to content | `/brand-apply --kit ./brand.json --content ./` |

---

## Architecture

```
brand-studio/
│
├── skills/
│   ├── copy/                    # Copywriting skill
│   │   ├── SKILL.md             # Write Mode + Review Mode workflows
│   │   ├── references/          # 11 framework files
│   │   │   ├── headlines.md     # Headline formulas, swipe file
│   │   │   ├── landing-pages.md # LIFT Model, conversion principles
│   │   │   ├── psychology.md    # Cialdini's 6 principles
│   │   │   ├── awareness-levels.md # Schwartz's 5 levels
│   │   │   └── ...
│   │   └── scripts/             # Analysis tools
│   │
│   ├── design/                  # Visual design skill
│   │   ├── SKILL.md             # 5-stage design process
│   │   └── references/          # 4 principle files
│   │       ├── logo-design-principles.md
│   │       ├── color-theory-principles.md
│   │       ├── typography-principles.md
│   │       └── brand-strategy-principles.md
│   │
│   └── brand-kit/               # Orchestration skill
│       └── SKILL.md             # 5-phase brand creation workflow
│
└── commands/                    # Command definitions
    ├── copy.md
    └── design.md
```

---

## The Methodology

### Copywriting Foundations

Brand Studio's copy skill is built on four masters:

| Author | Framework | Applied To |
|--------|-----------|------------|
| **Claude Hopkins** | Scientific Advertising | Specificity, testing, proof |
| **Robert Cialdini** | 6 Principles of Influence | Reciprocity, scarcity, authority |
| **Eugene Schwartz** | 5 Awareness Levels | Message-to-market matching |
| **Chip & Dan Heath** | SUCCESs (Made to Stick) | Memorable, sticky messaging |

### Design Foundations

| Domain | Core Principles |
|--------|----------------|
| **Logo Design** | Simplicity, memorability, versatility, appropriateness, timelessness |
| **Color Theory** | Harmony, contrast, psychology, context, accessibility (WCAG) |
| **Typography** | Hierarchy, legibility, personality, pairing, restraint |
| **Brand Strategy** | Positioning, differentiation, consistency, evolution |

---

## Configuration

### Image Generation (Optional)

For AI-generated logos and visual concepts, configure nano-banana MCP:

```bash
# In your Claude Code MCP config
{
  "mcpServers": {
    "nano-banana": {
      "command": "npx",
      "args": ["-y", "nano-banana-mcp"]
    }
  }
}
```

---

## Troubleshooting

### "Reference file not found"

**Cause:** Skill is looking for a framework file that wasn't loaded.

**Solution:** Ensure the plugin is installed completely:
```bash
claude plugin remove brand-studio
claude plugin add proofofreach/brand-studio
```

### Design commands not generating images

**Cause:** nano-banana MCP not configured.

**Solution:** The design skill works without image generation (provides specs and directions), but for actual asset creation, configure the MCP as shown above.

### Still having issues?

1. Search [existing issues](https://github.com/ProofOfReach/copywriting-plugin/issues)
2. Open a [new issue](https://github.com/ProofOfReach/copywriting-plugin/issues/new)

---

## Limitations

### What Brand Studio Doesn't Do (Yet)

- **Legal/compliance review** — Copy is marketing-focused, not legal-reviewed
- **Actual asset files** — Outputs specs and concepts; final production requires design tools
- **Brand enforcement** — Audits are advisory, not automated enforcement

### Known Constraints

| Constraint | Workaround |
|------------|------------|
| Image generation requires MCP | Design skill still provides detailed specs without it |
| No direct Figma/Sketch export | Use specs to recreate in design tools |

---

## FAQ

### Why "Brand Studio"?

It's a complete studio for brand creation — not just copywriting, not just design, but the full integrated workflow.

### What happened to "copywriting-plugin"?

Brand Studio is the evolution. The original copywriting skill is now the `/copy` component, joined by `/design` and `/brand-kit` for complete brand creation.

### Can I use just the copy skill?

Yes. Each skill works independently. Use `/copy`, `/headline`, `/review-copy` without touching design or brand-kit.

### Does it work with my existing brand?

Yes. Use `/review-copy` to audit existing copy, or feed your brand guidelines into `/brand-apply` to generate on-brand content.

### Can I use this commercially?

Yes — MIT license. Use it for client work, your own brands, whatever you need.

---

## Contributing

Contributions welcome. Please open an issue to discuss proposed changes before submitting a PR.

**Areas we'd love help with:**
- Additional copywriting frameworks (VSL, webinar scripts)
- Industry-specific reference files
- Integration with more design MCPs

---

## License

MIT

---

<div align="center">

*Built by [ProofOfReach](https://github.com/ProofOfReach)*

</div>
