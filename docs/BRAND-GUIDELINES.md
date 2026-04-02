# LearnCC Brand Guidelines
## Anthropic-Adjacent Visual Identity Reference

**Purpose:** This document defines the visual design language for LearnCC — an educational course for Claude Code — drawing on deep research into Anthropic's official brand system. LearnCC should feel like it belongs in the Anthropic ecosystem while maintaining its own identity as a third-party educational product.

**Research sources:** Geist agency case study (geist.co/work/anthropic), anthropic.com live CSS, claude.com CSS tokens, brandfetch.com official palette, multiple brand analysis sources.

---

## 1. The Brand DNA

### Anthropic's Design Philosophy (from Geist)
The Geist agency worked with Anthropic for over two and a half years — from stealth through Claude's launch — building a brand from first principles. Their brief was to make AI feel human without being dishonest about what it is.

Core design tenets:
- **"Do the simple thing that works"** — no decoration that doesn't earn its place
- **Warm minimalism** — not cold/clinical like most tech, not playful/cartoonish either
- **Technical rigor + human values** in equal measure
- **Modular and systematic** — every element scales from marketing to product UI
- **Accessible without being dumbed down** — speaks to both researchers and general users

### The Slash
The Anthropic logomark contains a single distinguishing detail: a slash (`\`) embedded in the wordmark. It references:
- The code that underlies AI (escape slash, path separator)
- The forward motion and future orientation of the company

This is a meaningful, non-decorative detail — the kind of restrained conceptual thinking that defines the whole brand.

---

## 2. Color Palette

### Primary Palette (Confirmed from live anthropic.com CSS + Brandfetch)

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| **Anthropic Black** | `#141413` | 20, 20, 19 | Primary text, dark backgrounds, logo |
| **Off-White / Cream** | `#FAF9F5` | 250, 249, 245 | Primary light background |
| **Warm Gray Light** | `#E8E6DC` | 232, 230, 220 | Secondary background, subtle dividers |
| **Mid Gray** | `#B0AEA5` | 176, 174, 165 | Secondary text, borders, placeholders |
| **Warm Dark Gray** | `#30302E` | 48, 48, 46 | Body text on light backgrounds |

### Accent Colors (Confirmed from live CSS tokens + official brand docs)

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| **Anthropic Orange** | `#D97757` | 217, 119, 87 | Primary CTA, highlights, brand accent |
| **Hero Accent (deeper)** | `#C46849` | 196, 104, 73 | Hero sections, stronger coral moments |
| **Antique Brass** | `#CC785C` | 204, 120, 92 | Alternate coral tone, illustration accent |
| **Claude Terra Cotta** | `#DA7756` | 218, 119, 86 | Claude product brand specifically |
| **Anthropic Blue** | `#6A9BCC` | 106, 155, 204 | Secondary accent (used sparingly) |
| **Anthropic Green** | `#788C5D` | 120, 140, 93 | Tertiary accent (used very sparingly) |

### Color Context Notes
- The orange/coral family has multiple close variants across contexts: `#D97757` (main site), `#DA7756` (Claude product), `#C46849` (hero emphasis), `#CC785C` (Brandfetch official). **For LearnCC, use `#D97757` as primary accent** — it's the most confirmed across sources.
- The cream/off-white background (`#FAF9F5`) is distinctive to Anthropic. It's not pure white and not beige — it has a very slight warm yellow cast that reads as inviting rather than sterile.
- `#E8E6DC` is the "card" or "section" background — slightly warmer and darker than the page background, used to create gentle hierarchy without hard borders.
- The selection highlight color from live CSS: `rgba(204, 120, 92, 0.5)` — a semi-transparent version of Antique Brass.
- The `theme-color` meta tag on anthropic.com is `#141413` — they brand even the browser chrome with their near-black.

### Illustration Color Names (from CSS class patterns on anthropic.com)
The illustration system uses named color slots: `default`, `heather`, `coral`, `cactus`, `olive`, `sky`, `fig`. These aren't exposed as hex values in public CSS but suggest the semantic color vocabulary used internally.

### Streamlit-Confirmed Pair
An Anthropic-official Streamlit theme uses: `primaryColor = "#bb5a38"` with `backgroundColor = "#f4f3ed"` — slightly different but confirming the warm orange + warm cream pairing is intentional across platforms.

---

## 3. Typography

### The Typeface System

Anthropic uses a layered typography system built from both commercial licenses and proprietary fonts:

#### Layer 1 — Display / Headlines
**Styrene A** (by Commercial Type / Berton Hasebe)
- Used for: large display headlines, hero text, section titles
- Character: geometrical, wide, with extended f/j/r/t letterforms that are "squarish" rather than conventional
- Personality: "technically refined and charmingly quirky" — the geometric construction gives precision, but the quirky letterforms add warmth
- Weight usage: primarily Regular (400) for display — the restraint is deliberate
- Paired name in CSS: `styrenea_f8492ab1`

**Styrene B** (by Commercial Type)
- Used for: subheadings, UI labels, navigation, smaller headline usage
- Character: narrower and more succinct than Styrene A — better for copy-fitting
- Paired name in CSS: `styreneb_278af5c6`

#### Layer 2 — Body / Editorial
**Tiempos Text** (by Klim Type Foundry)
- Used for: article body text, editorial content, long-form reading
- Character: a contemporary interpretation of transitional serif — formal but not stiff
- Gives Anthropic's writing an academic, rigorous quality
- Paired name in CSS: `tiempostext_4eff4b4c`

**Copernicus / Galaxie Copernicus** (by Chester Jenkins and Kris Sowersby, 2009)
- Used for: Claude product branding, large serif display moments
- Character: elegant book-weight serif with strong personality
- Paired name in CSS: `copernicus_4da799c5`

#### Layer 3 — Proprietary Fonts (Anthropic-Only)
**Anthropic Sans** — proprietary sans-serif
- Available weights: 400, 500, 600, 700
- Used on: anthropic.com and claude.ai interfaces
- Character: custom corporate sans, reportedly uneven in weight at launch (early criticism noted character weight inconsistencies)
- CSS variable: `anthropicsans_dce02d96`

**Anthropic Serif** — proprietary serif
- Used on: engineering and research pages alongside Anthropic Sans
- CSS variable: `anthropicserif_e7e46c4`

**Anthropic Mono** — proprietary monospace
- Used for: code examples, terminal output
- CSS variable: `anthropicmono_fae19af3`

**JetBrains Mono** — open source monospace (secondary code font)
- CSS variable: `jetbrainsmono_7d7bdbc6`

### Typography Rules (derived from site observation)

1. **Restraint in weight** — display text is often Regular (400), not bold. The brand's confidence doesn't rely on heaviness.
2. **Serif for trust, sans for function** — editorial/content uses serif; UI chrome uses sans-serif
3. **Fluid scaling** — Anthropic uses `clamp()` extensively: `clamp(2rem, 1.08rem + 3.92vw, 5rem)` for page margins, similar scaling for type
4. **Generous line-height** — body text reads with academic spacing, not compressed
5. **Lowercase preference** — navigation items and labels often use lowercase or sentence case, not ALL CAPS

### LearnCC Typography Recommendations
Since Anthropic's fonts are proprietary and not available for licensing, here are the best public alternatives:

| Role | Anthropic Original | LearnCC Alternative |
|------|-------------------|---------------------|
| Display headlines | Styrene A | **DM Sans** (variable) or **Outfit** |
| UI subheadings | Styrene B | **DM Sans Medium** or **Inter** |
| Body / editorial | Tiempos Text | **Lora** or **Source Serif 4** |
| Serif display | Copernicus | **Playfair Display** or **Cormorant** |
| Monospace | Anthropic Mono / JetBrains Mono | **JetBrains Mono** (open source, same) |

The best single combination for LearnCC: **DM Sans** (headings/UI) + **Source Serif 4** (body/editorial content) + **JetBrains Mono** (code). This closely mirrors the Styrene + Tiempos personality dynamic.

---

## 4. Design Elements & Spatial System

### Grid & Layout
- 12-column grid system
- Generous whitespace as a primary design element — negative space is not waste, it's signal
- Container max-width responsive with fluid column sizing
- Page-level margin: `clamp(2rem, 1.08rem + 3.92vw, 5rem)` — starts at 2rem on mobile, scales to 5rem on large screens

### Spacing Philosophy
Anthropic uses a consistent spacing scale. CSS tokens observed:
- `--spacing---space--0-5rem` (8px)
- `--spacing---space--1-5rem` (24px)
- Gutters and gaps follow 8px base unit (8, 16, 24, 32, 48, 64, 96, 128)

### Border Radius
- `--radius--large` — used for cards and containers. From live usage: approximately 12–16px
- Buttons: rounded, not pill. Subtly rounded (8px) rather than fully rounded
- Input fields: matching card radius, consistent rounding language

### Borders & Dividers
- Borders use `--swatch--gray-050` through `--swatch--gray-950` grayscale system
- Primary border color maps to approximately `#E8E6DC` (warm light gray)
- Secondary border: approximately `#B0AEA5` (mid gray)
- Borders are thin (1px) and rarely used — whitespace separates sections instead

### Shadows
- Used very sparingly, primarily for floating UI elements (dropdowns, modals)
- When used: warm-tinted shadows, never cold gray. Something like `0 4px 24px rgba(20, 20, 19, 0.08)`
- Cards don't have shadows — they use background color differentiation instead

### Motion & Animation
- GSAP for scroll-triggered animations: fade-in + translate (elements rise 20–40px as they enter)
- Stagger delays: 100–500ms between sequential elements
- Word-by-word text reveals on hero sections
- All animations respect `prefers-reduced-motion`
- Easing: ease-out, not bounce or spring — controlled and intentional

### Interactive States
- Focus ring: `--focus--offset-outer` and `--focus--width` tokens — clearly defined focus states (accessibility priority)
- Hover: subtle transitions, not dramatic changes. Opacity shift or color lightening
- Active states use the orange accent `#D97757`

---

## 5. Visual Design Language

### Illustration Style
From the Geist case study:
- **Humanistic, not literal** — illustrations represent concepts (teamwork, interdisciplinary thinking, human values) rather than depicting technical diagrams
- **Abstract motifs and layered compositions** — not flat icons, but structured visual compositions
- **Color-coded categories** using named slots: coral, heather, cactus, olive, sky, fig
- **Accessible for both technical and general audiences** — no jargon-y technical illustrations; the human element always present
- **Warm palette within the illustration system** — uses the warm accent tones (coral, olive, warm gray), not cool blues

### Photography
- Photographer Aaron Wojack (SF-based) was commissioned for the brand
- Direction: "visually tell the story of the company and its culture"
- Style: candid, warm-toned, humanizing — people in collaborative settings
- Post-processing: warm color grading matching the cream/coral palette
- NOT stock photography aesthetic — genuine, editorial feel

### Logo Treatment
- Pure typographic wordmark
- Single conceptual detail (the backslash)
- Monochromatic — shown in `#141413` on light, `#FAF9F5` on dark
- Never on busy backgrounds
- Clear space = approximately 1x the cap-height of the wordmark on all sides

### UI Component Language
From Claude.com live CSS analysis:
- Variables: `--theme---foreground-primary`, `--theme---background-primary/secondary/tertiary`
- Grayscale: full 50–950 scale (`--swatch--gray-050` through `--swatch--gray-950`)
- Semantic color naming separates purpose from value

---

## 6. Tone of Voice

### Brand Voice Characteristics
- **Warm but precise** — the writing matches the design: approachable language, exact meaning
- **Confident without arrogance** — never overpromises, never hedges unnecessarily
- **Academic rigor, conversational register** — deep ideas explained without jargon where possible
- **"Helpful, harmless, honest"** — the three H's that Geist cited as the core messaging brief
- **Human values foregrounded** — AI capability is real but always anchored to human purpose

### Linguistic Patterns
- Sentence case (not Title Case) for most headings
- Active voice
- Short declarative sentences for key points
- Longer, nuanced explanations for technical/complex topics
- Questions used sparingly but effectively in headlines
- "We" used for company voice, "you" for user address — direct and personal

### What to Avoid
- Superlatives ("the best", "the most powerful")
- Hype language ("revolutionary", "game-changing")
- Cold technical language without human context
- Playful/whimsical tone that undermines seriousness
- Pure corporate speak that loses personality

---

## 7. LearnCC Brand Application

### The Positioning
LearnCC is to Anthropic what Treehouse or Codecademy is to JavaScript — an educational companion that respects the ecosystem without impersonating it. It should feel:
- **Familiar** to Anthropic users (same warmth, same restraint)
- **Distinct** in its educational purpose (learning-specific affordances)
- **Respectful** — not claiming to be official, not copying the wordmark

### LearnCC Color Tokens

```css
:root {
  /* --- Core Palette --- */
  --color-bg-primary:      #FAF9F5;   /* Anthropic off-white cream */
  --color-bg-secondary:    #F0EFEA;   /* Card backgrounds, subtle sections */
  --color-bg-tertiary:     #E8E6DC;   /* Stronger section division */

  /* --- Text --- */
  --color-text-primary:    #141413;   /* Near-black, primary text */
  --color-text-secondary:  #30302E;   /* Body text */
  --color-text-muted:      #828179;   /* Placeholder, helper text */
  --color-text-subtle:     #B0AEA5;   /* Captions, disabled state */

  /* --- Accent (LearnCC's own identity within Anthropic palette) --- */
  --color-accent-primary:  #D97757;   /* Anthropic Orange — CTAs, highlights */
  --color-accent-hover:    #C46849;   /* Deeper coral for hover states */
  --color-accent-subtle:   rgba(217, 119, 87, 0.12); /* Tinted backgrounds */

  /* --- Borders --- */
  --color-border-light:    #E8E6DC;
  --color-border-medium:   #B0AEA5;

  /* --- Semantic --- */
  --color-success:         #788C5D;   /* Anthropic Green */
  --color-info:            #6A9BCC;   /* Anthropic Blue */
  --color-warning:         #D97757;   /* Reuse orange */

  /* --- Dark Mode --- */
  --color-bg-dark:         #141413;
  --color-text-on-dark:    #FAF9F5;
  --color-accent-on-dark:  #D97757;   /* Same accent, works on dark */
}
```

### LearnCC Typography Stack

```css
:root {
  /* Closest public equivalents to Anthropic's proprietary fonts */
  --font-display:  'DM Sans', 'Outfit', system-ui, sans-serif;
  --font-body:     'Source Serif 4', 'Lora', Georgia, serif;
  --font-ui:       'DM Sans', 'Inter', system-ui, sans-serif;
  --font-mono:     'JetBrains Mono', 'Fira Code', monospace;
}

/* Type Scale (fluid, Anthropic-style) */
.text-display-xl  { font-size: clamp(2.5rem, 2rem + 4vw, 5rem); font-weight: 400; }
.text-display-lg  { font-size: clamp(2rem, 1.5rem + 3vw, 3.5rem); font-weight: 400; }
.text-display-md  { font-size: clamp(1.5rem, 1.25rem + 2vw, 2.5rem); font-weight: 500; }
.text-heading-lg  { font-size: clamp(1.25rem, 1rem + 1.5vw, 2rem);   font-weight: 500; }
.text-heading-md  { font-size: clamp(1.125rem, 1rem + 0.75vw, 1.5rem); font-weight: 600; }
.text-body-lg     { font-size: 1.125rem; line-height: 1.75; font-weight: 400; }
.text-body-md     { font-size: 1rem;     line-height: 1.7;  font-weight: 400; }
.text-body-sm     { font-size: 0.875rem; line-height: 1.6;  font-weight: 400; }
.text-mono        { font-size: 0.875rem; line-height: 1.6;  font-weight: 400; }
```

### Spacing & Radius

```css
:root {
  /* 8px base unit */
  --space-1:  0.25rem;   /*  4px */
  --space-2:  0.5rem;    /*  8px */
  --space-3:  0.75rem;   /* 12px */
  --space-4:  1rem;      /* 16px */
  --space-6:  1.5rem;    /* 24px */
  --space-8:  2rem;      /* 32px */
  --space-12: 3rem;      /* 48px */
  --space-16: 4rem;      /* 64px */
  --space-24: 6rem;      /* 96px */

  /* Page margin — fluid like Anthropic's */
  --page-margin: clamp(1.5rem, 1rem + 4vw, 5rem);

  /* Border radius */
  --radius-sm: 6px;
  --radius-md: 10px;
  --radius-lg: 16px;
  --radius-xl: 24px;

  /* Shadows — warm-tinted, subtle */
  --shadow-sm: 0 1px 4px rgba(20, 20, 19, 0.06);
  --shadow-md: 0 4px 16px rgba(20, 20, 19, 0.08);
  --shadow-lg: 0 8px 32px rgba(20, 20, 19, 0.10);
}
```

### Component Patterns

**Cards** — use `--color-bg-secondary` (#F0EFEA), `--radius-lg` (16px), no shadow. Border only if needed at `--color-border-light`.

**CTAs / Buttons**
- Primary: `background: #D97757`, `color: #FAF9F5`, `border-radius: 8px`, hover darkens to `#C46849`
- Secondary: `background: transparent`, `border: 1px solid #141413`, `color: #141413`
- Ghost: text only, `color: #D97757`, underline on hover

**Code blocks** — `background: #141413` (dark), `color: #FAF9F5`, `font-family: var(--font-mono)`, `border-radius: var(--radius-md)`. Accent color `#D97757` for inline code on light backgrounds.

**Progress indicators** — use `#D97757` for fill, `#E8E6DC` for track.

**Navigation** — sentence case labels, `color: #30302E`, active state `color: #D97757` or `border-bottom: 2px solid #D97757`.

---

## 8. What Makes This Feel "Anthropic-Adjacent" Without Copying

The combination of these elements creates the feel:

1. **The cream background** (`#FAF9F5`) — most identifiable single choice. Nothing else says "Anthropic" faster.
2. **The warm near-black** (`#141413`) — not pure black, has a warm undertone, pairs naturally with the cream.
3. **The coral accent used with discipline** — appears rarely and purposefully, not splashed everywhere.
4. **Serif body text** — most tech products use sans-serif for everything. The serif signals seriousness, academia, craft.
5. **Weight restraint** — display text at 400 weight feels confident and mature, not shouting.
6. **Whitespace as a statement** — generous spacing is not emptiness, it's the brand.
7. **Warm gray tones** — never cold grays. Every neutral in the palette has a warm (yellow-green) undertone.

### The One Rule
If you follow no other rule: **never use pure white (`#FFFFFF`) as a background or pure black (`#000000`) as text color.** The warmth is always present. Off-white `#FAF9F5` and near-black `#141413` are the Anthropic move.

---

## Sources

- [Geist Agency — Anthropic Case Study](https://geist.co/work/anthropic)
- [Anthropic.com](https://www.anthropic.com) — live CSS analysis
- [Claude.com Product Overview](https://claude.com/product/overview) — live CSS token extraction
- [Brandfetch — Anthropic Brand Assets](https://brandfetch.com/anthropic.com)
- [Anthropic Brand Guidelines (GitHub Skills)](https://github.com/anthropics/skills/blob/main/skills/brand-guidelines/SKILL.md)
- [Brand Color Code — Claude](https://www.brandcolorcode.com/claude)
- [Claude Branding Guide — ywian.com](https://www.ywian.com/blog/claude-branding-the-complete-guide)
- [Styrene in Use: Anthropic — type.today](https://type.today/en/journal/anthropic)
- [Dear Designer — Styrene Soul article](https://deardesigner.substack.com/p/my-styrene-soul-a-short-affair-with)
- [FontOfWeb — Anthropic Design Tokens](https://fontofweb.com/tokens/anthropic.com)
- [Abduzeedo — Anthropic Brand Analysis](https://abduzeedo.com/seamlessly-crafting-ai-branding-and-visual-identity-anthropic)
