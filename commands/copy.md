---
description: Professional copywriting assistant for marketing content, sales copy, and persuasive writing
---

# /copy - Professional Copywriting Assistant

## Command Overview

The copywriting command provides access to a professional copywriting assistant with expertise in direct response, conversion optimization, and persuasive writing.

## Usage

```
/copy [mode] [options]
```

## Available Modes

### 1. Write Mode (default)
Create new copy from scratch.

```
/copy write [type]
```

**Copy Types:**
- `landing-page` - Full landing page copy
- `email` - Email sequences and campaigns
- `ad` - Facebook, Google, LinkedIn ads
- `headline` - Headlines and subject lines
- `sales-letter` - Long-form sales letters
- `product` - Product descriptions
- `about` - About pages and bios
- `cta` - Calls-to-action

**Example:**
```
/copy write landing-page
/copy write email --sequence welcome
```

### 2. Review Mode
Audit and improve existing copy.

```
/copy review [file-or-paste]
```

**Review Types:**
- `--full` - Complete 10-section audit
- `--headline` - Headline-specific analysis
- `--cta` - CTA effectiveness review
- `--quick` - Fast pass for major issues

**Example:**
```
/copy review landing-page.txt --full
/copy review --headline "Your Headline Here"
```

### 3. Headline Mode
Generate and analyze headlines.

```
/copy headline [action]
```

**Actions:**
- `generate` - Generate headline variations
- `analyze` - Score a headline (4 U's framework)
- `swipe` - Get headline templates

**Example:**
```
/copy headline generate --product "SaaS CRM"
/copy headline analyze "10 Ways to Double Your Sales"
```

### 4. LP-Optimize Mode
Analyze and optimize landing pages for conversion.

```
/copy lp-optimize [url-or-file]
```

**Actions:**
- `review` - Diagnose conversion issues (LIFT model, Seven Deadly Sins, Trunk Test)
- `create` - Build high-converting LP copy from scratch
- `test` - Generate prioritized A/B test hypotheses

**Example:**
```
/copy lp-optimize https://example.com/landing-page
/copy lp-optimize landing-page.txt --full
/copy lp-optimize create --product "SaaS tool" --audience "marketers"
```

### 5. Framework Mode
Apply copywriting frameworks.

```
/copy framework [name]
```

**Available Frameworks:**
- `aida` - Attention, Interest, Desire, Action
- `pas` - Problem, Agitation, Solution
- `4ps` - Promise, Picture, Proof, Push
- `fab` - Features, Advantages, Benefits
- `quest` - Qualify, Understand, Educate, Stimulate, Transition
- `star` - Situation, Task, Action, Result

### 6. Swipe Mode
Access proven copy templates and examples.

```
/copy swipe [category]
```

**Categories:**
- `headlines` - Proven headline formulas
- `leads` - Opening hooks and leads
- `ctas` - Call-to-action templates
- `emails` - Email templates by type
- `bullets` - Fascination bullet formulas

## Options

| Option | Description |
|--------|-------------|
| `--tone` | Set tone (professional, casual, urgent, friendly) |
| `--audience` | Define target audience |
| `--goal` | Primary conversion goal |
| `--length` | short, medium, long |
| `--variations` | Number of variations to generate |

## Examples

### Create a Landing Page
```
/copy write landing-page --product "AI Writing Tool" --audience "content marketers" --goal "free trial signup"
```

### Review Email Copy
```
/copy review email.txt --full
```

### Generate Headlines
```
/copy headline generate --product "Fitness App" --variations 10
```

### Apply PAS Framework
```
/copy framework pas --problem "slow website" --solution "speed optimization service"
```

## Best Practices

1. **Always define your audience first** - Copy effectiveness depends on audience clarity
2. **Start with headlines** - The headline carries 80% of your copy's success
3. **Use the review mode** - Even AI-generated copy benefits from systematic review
4. **Apply frameworks** - Frameworks prevent missing crucial persuasion elements
5. **Test variations** - Generate multiple versions and test them

## Related Tools

- Run `headline-analyzer.sh` for detailed headline scoring
- Run `copy-checklist.sh` for comprehensive copy audit
- Access the SKILL.md reference for copywriting principles

---

*Powered by the Copywriting Skill - Professional persuasion and conversion optimization*
