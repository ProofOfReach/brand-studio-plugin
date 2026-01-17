---
description: Visual design tasks including logo generation, color palettes, typography, and brand identity audits
---

# /design - Visual Design Assistant

## Command Overview

The design command provides access to a comprehensive visual design assistant with capabilities for logo creation, color palette development, typography recommendations, and brand identity audits. Integrates with nano-banana for AI-powered image generation.

## Usage

```
/design [mode] [options]
```

## Available Modes

### 1. Logo Mode
Generate logo concepts using AI image generation.

```
/design logo [options]
```

**Logo Types:**
- `wordmark` - Typography-based logo
- `symbol` - Icon/symbol-based logo
- `combination` - Symbol + text logo
- `emblem` - Badge or seal style
- `abstract` - Abstract geometric mark
- `mascot` - Character-based logo

**Example:**
```
/design logo --style modern --industry tech --brand "Quantum Labs"
/design logo --type symbol --mood innovative --colors "blue,silver"
```

**Output Format:**
- Generated logo image(s) via nano-banana
- Design rationale
- Color specifications (HEX, RGB, CMYK)
- Usage guidelines
- Variation suggestions

---

### 2. Palette Mode
Create cohesive color palettes for brands and projects.

```
/design palette [options]
```

**Palette Types:**
- `brand` - Full brand color system
- `web` - Web-optimized palette with accessibility checks
- `print` - CMYK-safe palette for print materials
- `minimal` - 2-3 color focused palette
- `extended` - Comprehensive 10+ color system

**Example:**
```
/design palette --industry healthcare --mood trustworthy
/design palette --style vibrant --colors "start with #3498db"
/design palette --type brand --mood luxury --industry fashion
```

**Output Format:**
```
PRIMARY COLORS
--------------
Primary:      #2563EB (Royal Blue)
              RGB: 37, 99, 235
              CMYK: 84, 58, 0, 8

Secondary:    #10B981 (Emerald)
              RGB: 16, 185, 129
              CMYK: 91, 0, 30, 27

ACCENT COLORS
-------------
[Additional colors with full specifications]

NEUTRALS
--------
[Gray scale and background colors]

SEMANTIC COLORS
---------------
Success:      #22C55E
Warning:      #F59E0B
Error:        #EF4444
Info:         #3B82F6

ACCESSIBILITY
-------------
Contrast ratios and WCAG compliance notes

USAGE GUIDELINES
----------------
Application recommendations for each color
```

---

### 3. Typography Mode
Get typography recommendations and font pairings.

```
/design typography [options]
```

**Typography Systems:**
- `heading-body` - Primary heading + body font pairing
- `full-system` - Complete type hierarchy
- `single` - Single typeface recommendations
- `custom` - Custom pairing suggestions

**Example:**
```
/design typography --style modern --industry fintech
/design typography --mood playful --use "web app"
/design typography --base "Inter" --find-pair
```

**Output Format:**
```
TYPOGRAPHY SYSTEM
=================

PRIMARY TYPEFACE (Headings)
---------------------------
Font:         Inter
Weight:       600 (SemiBold), 700 (Bold)
Style:        Modern geometric sans-serif
Source:       Google Fonts (free)
Fallback:     -apple-system, BlinkMacSystemFont, sans-serif

SECONDARY TYPEFACE (Body)
-------------------------
Font:         Source Serif Pro
Weight:       400 (Regular), 600 (SemiBold)
Style:        Contemporary serif with excellent readability
Source:       Google Fonts (free)
Fallback:     Georgia, serif

TYPE SCALE
----------
H1:     48px / 56px line-height (3rem)
H2:     36px / 44px line-height (2.25rem)
H3:     24px / 32px line-height (1.5rem)
H4:     20px / 28px line-height (1.25rem)
Body:   16px / 24px line-height (1rem)
Small:  14px / 20px line-height (0.875rem)
Caption: 12px / 16px line-height (0.75rem)

PAIRING RATIONALE
-----------------
Why these fonts work together

CSS IMPLEMENTATION
------------------
Ready-to-use CSS variables and font imports
```

---

### 4. Brand-Kit Mode
Create complete brand identities with strategic positioning, visual systems, and voice guidelines.

```
/design brand-kit [options]
```

**Outputs:**
- `full` - Complete brand identity (strategy, logo, colors, typography, voice)
- `visual` - Visual system only (logo, colors, typography, guidelines)
- `voice` - Brand voice and messaging framework

**Example:**
```
/design brand-kit --industry "sustainable fashion" --audience "eco-conscious millennials"
/design brand-kit visual --personality "bold, innovative, playful"
/design brand-kit voice --audience "B2B enterprise"
```

---

### 5. Audit Mode
Comprehensive visual identity audit.

```
/design audit [input] [options]
```

**Audit Types:**
- `--full` - Complete brand identity analysis
- `--quick` - Fast pass for major issues
- `--consistency` - Cross-platform consistency check
- `--accessibility` - Color and typography accessibility audit
- `--competitive` - Compare against competitors

**Example:**
```
/design audit --url "https://example.com" --full
/design audit --assets ./brand-folder --consistency
/design audit --palette "#2563EB,#10B981,#F59E0B" --accessibility
```

**Output Format:**
```
VISUAL IDENTITY AUDIT
=====================

EXECUTIVE SUMMARY
-----------------
Overall Score: 78/100 (B+)
Key Strengths: [3 items]
Priority Fixes: [3 items]

1. LOGO ASSESSMENT
------------------
- Scalability: [score and notes]
- Versatility: [score and notes]
- Memorability: [score and notes]
- Recommendations: [specific improvements]

2. COLOR SYSTEM
---------------
- Palette cohesion: [analysis]
- Accessibility: [WCAG compliance check]
- Emotional alignment: [mood assessment]
- Recommendations: [specific improvements]

3. TYPOGRAPHY
-------------
- Hierarchy clarity: [analysis]
- Readability: [assessment]
- Brand alignment: [evaluation]
- Recommendations: [specific improvements]

4. VISUAL CONSISTENCY
---------------------
- Cross-platform analysis
- Style guide adherence
- Gap identification

5. COMPETITIVE POSITIONING
--------------------------
- Market differentiation
- Industry alignment
- Uniqueness assessment

ACTION ITEMS
------------
Priority 1 (Critical): [items]
Priority 2 (Important): [items]
Priority 3 (Nice to have): [items]
```

---

## Global Options

| Option | Description | Values |
|--------|-------------|--------|
| `--style` | Design style | modern, classic, minimal, bold, playful, elegant, rustic, tech |
| `--industry` | Industry context | tech, healthcare, finance, fashion, food, sports, education, etc. |
| `--mood` | Emotional tone | professional, friendly, innovative, trustworthy, luxury, playful |
| `--colors` | Starting colors | Comma-separated HEX values or color names |
| `--variations` | Number of options | 1-10 (default: 3) |
| `--format` | Output format | detailed, summary, json |
| `--export` | Export results | Filename for export |

## Examples

### Complete Brand Identity
```
/design logo --brand "TechVenture" --style modern --industry saas --variations 5
/design palette --style modern --industry saas --mood innovative
/design typography --style modern --industry saas --use "web app"
```

### Quick Color Palette
```
/design palette --mood "calm and professional" --industry healthcare
```

### Typography for Blog
```
/design typography --type heading-body --use "blog" --mood "approachable"
```

### Full Brand Audit
```
/design audit --url "https://mycompany.com" --full --competitive "competitor1.com,competitor2.com"
```

### Logo with Specific Colors
```
/design logo --type combination --brand "EcoFlow" --colors "#22C55E,#0F766E" --style minimal
```

## Integration with Nano-Banana

The logo mode integrates with the nano-banana MCP tools for AI image generation:

1. **Generate Concepts** - Creates initial logo concepts via `generate_image`
2. **Iterate Designs** - Refines chosen concepts via `continue_editing` or `edit_image`
3. **Export Variations** - Provides multiple size/format options

### Workflow Example:
```
1. /design logo --brand "StartupX" --style modern
2. [Review generated concepts]
3. "Refine concept #2 with thinner lines"
4. [Continue editing with nano-banana]
5. "Create variations for different sizes"
```

## Design Principles

The assistant follows these core principles:

1. **Purpose First** - Design decisions align with brand objectives
2. **Simplicity** - Less is more; clarity over complexity
3. **Consistency** - Cohesive visual language across all elements
4. **Accessibility** - Inclusive design that works for everyone
5. **Scalability** - Designs that work at any size
6. **Timelessness** - Avoid trends that date quickly

## Best Practices

1. **Start with strategy** - Define brand values before visual elements
2. **Consider context** - Industry norms and audience expectations matter
3. **Test at scale** - Check designs at different sizes and contexts
4. **Ensure accessibility** - Verify color contrast and readability
5. **Document decisions** - Create style guides for consistency

## Related Resources

- Reference the design SKILL.md for detailed workflows and principles
- Use `/copy` for brand messaging alignment
- Access brand strategy templates in the references folder

---

*Powered by the Brand Studio Design Skill - Professional visual identity and brand design*
