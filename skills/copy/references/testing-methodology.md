# Conversion Testing Methodology Reference

## Quick Reference Guide

### Minimum Statistical Requirements (Memorize These)
```
CONFIDENCE LEVEL:    95% minimum (p < 0.05)
CONVERSIONS NEEDED:  100-400 per variation
TEST DURATION:       Minimum 10 days (must include 2 full weekends)
TRAFFIC SPLIT:       50/50 for A/B, equal distribution for MVT
```

### PIE Prioritization Formula
```
PIE Score = (Potential + Importance + Ease) / 3

Score each 1-10:
- Potential: How much improvement is possible?
- Importance: How valuable is this traffic?
- Ease: How difficult to implement?

Test highest PIE scores first.
```

### Master Hypothesis Template
```
HYPOTHESIS: Changing [ELEMENT] from [CURRENT STATE] to [PROPOSED CHANGE]
            will increase [METRIC] by [ESTIMATED %]
            because [LIFT FACTOR REASONING]

LIFT Factors:
- VALUE PROPOSITION: Does this communicate unique value better?
- RELEVANCE: Does this match visitor intent more closely?
- CLARITY: Does this reduce confusion or cognitive load?
- ANXIETY: Does this reduce fear, uncertainty, or doubt?
- DISTRACTION: Does this remove competing actions/noise?
- URGENCY: Does this create legitimate time pressure?
```

---

## Section 1: PIE Framework for Test Prioritization

### What Is PIE?

PIE (Potential, Importance, Ease) is a prioritization framework from Chris Goward's "You Should Test That" that helps teams decide WHICH tests to run first. Without prioritization, teams waste resources testing low-impact elements while high-value opportunities languish.

### Scoring Methodology

#### Potential (1-10): How Much Can This Page Improve?

**High Potential Indicators (7-10):**
- Page has never been tested/optimized
- Conversion rate significantly below industry benchmarks
- High bounce rate or exit rate
- Qualitative research reveals clear problems (heatmaps, session recordings, surveys)
- Page design is outdated (3+ years old)
- Copy was written without customer research
- Page loads slowly or has technical issues
- Mobile experience is poor

**Medium Potential Indicators (4-6):**
- Page has been tested before with moderate results
- Conversion rate is at or slightly below benchmark
- Some optimization work has been done
- Minor usability issues identified
- Copy is adequate but not exceptional

**Low Potential Indicators (1-3):**
- Page has been extensively tested and optimized
- Conversion rate exceeds industry benchmarks
- Recent redesign based on research
- High customer satisfaction scores
- Minimal friction points identified in research

**Questions to Score Potential:**
1. When was this page last optimized?
2. What does qualitative data tell us about user friction?
3. How does current conversion rate compare to benchmarks?
4. Are there obvious UX problems visible in session recordings?
5. Has this page ever been properly tested?

#### Importance (1-10): How Valuable Is This Page/Traffic?

**High Importance Indicators (7-10):**
- High traffic volume (thousands of daily visitors)
- High revenue-per-visitor
- Critical step in conversion funnel
- Landing page for major paid campaigns
- Entry point for high-value customer segments
- Homepage or main category pages
- Cart and checkout pages

**Medium Importance Indicators (4-6):**
- Moderate traffic volume
- Secondary conversion paths
- Supporting pages in funnel
- Organic traffic landing pages
- Email campaign destinations

**Low Importance Indicators (1-3):**
- Low traffic volume
- Deep funnel pages with limited reach
- Legacy pages being phased out
- Test or experimental pages
- Administrative or support pages

**Questions to Score Importance:**
1. How much traffic does this page receive monthly?
2. What is the revenue potential of improving this page?
3. Is this page on the critical conversion path?
4. What customer segments land on this page?
5. Is this page connected to major marketing investments?

#### Ease (1-10): How Difficult Is This Test to Implement?

**High Ease Indicators (7-10):**
- Copy-only changes (no design/development)
- Changes within existing CMS capabilities
- No backend integration required
- Single-page test (not multi-page flow)
- Template-based changes applicable to many pages
- No legal/compliance review needed
- Internal resources available immediately

**Medium Ease Indicators (4-6):**
- Minor design changes required
- Some development time needed
- Multiple stakeholder approvals required
- Changes to form fields or basic functionality
- Moderate QA requirements

**Low Ease Indicators (1-3):**
- Major redesign required
- Complex development work
- Third-party integration needed
- Legal/compliance review mandatory
- Extended timeline (months vs weeks)
- Requires external agency involvement
- Cross-functional dependencies

**Questions to Score Ease:**
1. Can this change be made with existing tools/CMS?
2. How many hours of development time required?
3. How many approvals are needed?
4. What is the QA complexity?
5. Are there technical dependencies or risks?

### PIE Calculation Example

**Test Candidate: Product Page Headline Rewrite**
```
Potential: 8/10
- Page hasn't been tested in 2 years
- Headlines were written by product team without customer input
- Heatmaps show low engagement with current headline
- Bounce rate 15% above category average

Importance: 9/10
- 50,000 monthly visitors
- Main entry point from Google Shopping ads
- High-intent commercial traffic
- $150 average order value

Ease: 9/10
- Copy-only change
- Can be done in CMS without development
- No legal review needed
- Internal copywriter available

PIE Score: (8 + 9 + 9) / 3 = 8.67
VERDICT: High priority - test immediately
```

**Test Candidate: Checkout Flow Redesign**
```
Potential: 9/10
- Checkout abandonment rate 70%
- User research reveals confusion points
- Mobile checkout especially problematic
- No testing done in 3 years

Importance: 10/10
- Every conversion must pass through checkout
- Highest-intent traffic in funnel
- Direct revenue impact

Ease: 3/10
- Requires major development work
- Payment integration changes
- PCI compliance review needed
- 3-month timeline estimated
- External agency involvement

PIE Score: (9 + 10 + 3) / 3 = 7.33
VERDICT: High impact but complex - schedule for Q2, run simpler tests now
```

### PIE Prioritization Matrix

```
HIGH POTENTIAL + HIGH IMPORTANCE + HIGH EASE = TEST IMMEDIATELY
HIGH POTENTIAL + HIGH IMPORTANCE + LOW EASE = SCHEDULE FOR LATER
HIGH POTENTIAL + LOW IMPORTANCE + HIGH EASE = QUICK WIN IF CAPACITY
LOW POTENTIAL + HIGH IMPORTANCE + HIGH EASE = TEST IF NO BETTER OPTIONS
LOW POTENTIAL + LOW IMPORTANCE + ANY EASE = DO NOT TEST
```

---

## Section 2: Seven-Step Conversion Testing Process

### Step 1: Gather Quantitative Data

**Purpose:** Identify WHERE problems exist through numbers

**Key Data Sources:**
- Web analytics (Google Analytics, Adobe)
- Conversion funnels
- Exit rates by page
- Device/browser performance differences
- Traffic source performance
- Page load times
- Form analytics

**Questions to Answer:**
1. Where are visitors dropping off in the funnel?
2. Which pages have highest exit rates?
3. How does mobile compare to desktop?
4. Which traffic sources underperform?
5. What is the current baseline conversion rate?

**Output:** Prioritized list of pages/elements with quantifiable problems

### Step 2: Gather Qualitative Data

**Purpose:** Understand WHY problems exist through human insight

**Qualitative Research Methods:**

**Heatmaps and Click Maps**
- Shows where visitors actually click vs where you expect
- Reveals if CTAs are being noticed
- Identifies rage clicks indicating frustration
- Shows scroll depth and content engagement

**Session Recordings**
- Watch real visitors navigate
- Identify confusion points
- See hesitation before clicks
- Understand form interaction issues
- Spot technical problems not visible in analytics

**User Surveys (On-Site)**
- Exit-intent surveys: "What stopped you from completing your purchase?"
- Post-purchase surveys: "What almost stopped you from buying?"
- Task-completion surveys: "Were you able to find what you needed?"
- NPS surveys with open-ended follow-ups

**User Testing (Moderated)**
- Watch users complete specific tasks
- Ask users to think aloud
- Probe for emotional reactions
- Test comprehension of value proposition
- Validate or invalidate assumptions

**Customer Interviews**
- Deep qualitative insight into decision-making
- Understand the full customer journey
- Identify unexpected objections
- Learn the language customers use

**Customer Service Data**
- Common questions reveal confusion
- Complaints reveal friction points
- Returns/refunds reveal expectation mismatches
- Chat transcripts reveal real-time struggles

**Questions to Answer:**
1. WHY are visitors leaving at this point?
2. What emotions are visitors experiencing?
3. What information are they seeking but not finding?
4. What objections or concerns do they have?
5. What language do they use to describe their needs?

**Output:** Qualitative insights explaining the quantitative problems

### Step 3: Form Hypotheses

**Purpose:** Create testable predictions based on research

**Hypothesis Requirements:**
1. Specific and measurable
2. Based on research (not opinion)
3. Connected to LIFT factors
4. Includes expected direction and magnitude
5. Falsifiable through testing

**Hypothesis Template:**
```
We believe that [CHANGE]
Will result in [OUTCOME]
Because [RESEARCH-BASED REASONING]

We will measure this by [METRIC]
We will consider this successful if [SUCCESS CRITERIA]
```

**Strong Hypothesis Example:**
```
We believe that changing the CTA from "Submit" to "Get My Free Quote"
Will result in a 15-25% increase in form completions
Because user testing revealed that "Submit" felt impersonal and didn't
reinforce the value of the action (CLARITY), and the word "Free"
addresses the concern about unexpected costs (ANXIETY).

We will measure this by form completion rate
We will consider this successful if completion rate increases by >15%
```

**Weak Hypothesis (Avoid):**
```
We think a new CTA will work better because it sounds better.
```

**Output:** Prioritized hypothesis backlog with clear success criteria

### Step 4: Develop Test Wireframes/Mockups

**Purpose:** Visualize the change before building

**Wireframe Requirements:**
- Show exactly what will change
- Maintain all other elements constant (control variables)
- Consider all device sizes
- Document every element being modified
- Get stakeholder alignment before development

**Testing Principle:** Change ONE variable at a time in A/B tests, or use multivariate testing to test multiple variables simultaneously.

### Step 5: Implement Test

**Technical Considerations:**
- Use proper A/B testing tool (Optimizely, VWO, Google Optimize, etc.)
- Ensure proper tracking implementation
- QA across all devices and browsers
- Verify even traffic distribution
- Set up proper goal tracking
- Document any technical constraints or compromises

**Pre-Launch Checklist:**
- [ ] Test displays correctly on all devices
- [ ] Conversion tracking verified
- [ ] Traffic split confirmed (50/50 for A/B)
- [ ] No flicker or loading issues
- [ ] Fallback works if JavaScript fails
- [ ] Stakeholders notified of launch

### Step 6: Analyze Results

**When to Analyze:**
- NOT before minimum sample size reached
- NOT before minimum duration completed
- Only when statistical significance achieved

**Analysis Checklist:**
1. Did we reach 95% confidence?
2. Did we get 100+ conversions per variation?
3. Did we run for at least 10 days (2 weekends)?
4. Are results consistent across segments?
5. Are results consistent across time?

**Interpreting Results:**

**Clear Winner (Implement)**
- 95%+ statistical confidence
- Meaningful lift (not just statistically significant)
- Consistent across segments and time
- No anomalies in data

**Clear Loser (Do Not Implement)**
- Control performs better with high confidence
- Learn from why hypothesis was wrong
- Document learnings for future tests

**Inconclusive (Iterate)**
- No statistically significant difference
- Small sample size prevented detection
- Possible: Effect size was too small to matter
- Next step: Test a bolder change

**Winner But Concerns**
- Statistical significance reached
- But results vary significantly by segment
- Or results varied significantly over time
- Investigate before full implementation

### Step 7: Document and Iterate

**Documentation Requirements:**
- Original hypothesis with reasoning
- Test dates and duration
- Sample sizes and conversion counts
- Results with confidence intervals
- Screenshots of both variations
- Learnings and implications
- Next test recommendations

**Iteration Principle:**
Every test should inform the next test. A "failed" test that teaches you something is more valuable than no test at all.

---

## Section 3: Hypothesis Development Framework

### LIFT Model Reasoning

Every hypothesis should connect to one or more LIFT factors. This ensures tests are grounded in conversion psychology rather than random guessing.

#### Value Proposition Hypotheses

**When to Focus on Value Proposition:**
- Research shows visitors don't understand what you offer
- Bounce rate is high from new visitors
- Survey responses indicate confusion about benefits
- Competitors clearly communicate value better
- Current messaging focuses on features vs benefits

**Value Proposition Hypothesis Templates:**

```
HYPOTHESIS TYPE: Value Proposition Clarity
TEMPLATE: Changing [headline/hero section] to explicitly state [primary benefit]
          will increase [engagement metric] by [%]
          because current messaging focuses on [features/company] rather than
          [customer benefit/outcome], and user testing showed visitors
          couldn't articulate our value proposition.
```

```
HYPOTHESIS TYPE: Value Proposition Relevance
TEMPLATE: Changing [element] to address [specific customer segment need]
          will increase [conversion metric] for [segment] by [%]
          because analytics shows [segment] converts [X%] lower than average,
          and research revealed they have unique concern about [issue].
```

```
HYPOTHESIS TYPE: Value Proposition Differentiation
TEMPLATE: Adding [comparison/proof element] showing how we differ from [competitor/alternative]
          will increase [conversion metric] by [%]
          because customer interviews revealed visitors comparison-shop and
          our current page doesn't clearly answer "why you vs them?"
```

**Example Value Proposition Hypotheses:**

```
HYPOTHESIS: Changing the headline from "Enterprise Cloud Solutions" to
"Cut Your IT Costs 40% While Improving Uptime"
will increase demo requests by 20-30%
because user testing showed visitors couldn't explain what we do or why
they should care, while customer interviews revealed cost savings and
reliability are the primary decision drivers.
```

```
HYPOTHESIS: Adding a "How We Compare" section showing feature/price comparison
to [Competitor A] and [Competitor B]
will increase conversion rate by 15-25%
because exit surveys show 67% of non-converters said they were
"still researching options" and session recordings show visitors
opening competitor tabs during their visit.
```

#### Relevance Hypotheses

**When to Focus on Relevance:**
- Different traffic sources have different conversion rates
- Landing pages serve multiple customer segments
- Paid ad messaging doesn't match landing page
- Visitors arrive with specific intent not addressed
- High bounce rate from specific campaigns

**Relevance Hypothesis Templates:**

```
HYPOTHESIS TYPE: Message Match (Ad-to-Landing Page)
TEMPLATE: Creating [landing page variation] that matches [ad campaign] messaging
          will increase [conversion metric] by [%]
          because current landing page uses [generic messaging] while
          [ad campaign] promises [specific benefit], creating cognitive
          disconnect measured by [bounce rate/time on page].
```

```
HYPOTHESIS TYPE: Segment-Specific Content
TEMPLATE: Creating [content variation] specifically for [customer segment]
          will increase [conversion metric] for that segment by [%]
          because [segment] currently converts [X%] below average, and
          research shows they have unique [needs/concerns/language].
```

```
HYPOTHESIS TYPE: Intent Matching
TEMPLATE: Reorganizing [page element] to immediately address [visitor intent]
          will increase [engagement metric] by [%]
          because search query data and surveys show visitors arrive
          seeking [specific information] but current page leads with
          [different information].
```

**Example Relevance Hypotheses:**

```
HYPOTHESIS: Creating a dedicated landing page for "accounting software small business"
ad group that mirrors the ad headline and emphasizes small business
features upfront
will increase conversion rate for this ad group by 30-40%
because current generic landing page leads with enterprise features,
and this ad group has 73% bounce rate vs 45% average, with 0.8%
conversion rate vs 2.1% average.
```

```
HYPOTHESIS: Adding industry-specific case studies above the fold based on
visitor's referring campaign (detected via UTM parameters)
will increase demo requests by 15-20%
because customer interviews reveal "Does this work for [my industry]?"
is the #1 question, and session recordings show visitors scrolling
to find industry relevance before engaging.
```

#### Clarity Hypotheses

**When to Focus on Clarity:**
- User testing reveals comprehension problems
- Visitors ask basic questions via chat/support
- Key messages are buried below fold
- Page uses jargon, technical terms, or insider language
- Too much information creates cognitive overload
- Form fields are confusing
- Navigation or next steps are unclear

**Clarity Hypothesis Templates:**

```
HYPOTHESIS TYPE: Simplification
TEMPLATE: Simplifying [element] from [complex version] to [simple version]
          will increase [engagement/conversion metric] by [%]
          because user testing showed [X%] of participants couldn't
          [understand/complete task], and average time to [action]
          was [X seconds] indicating confusion.
```

```
HYPOTHESIS TYPE: Information Hierarchy
TEMPLATE: Moving [key information] from [current location] to [prominent location]
          will increase [engagement metric] by [%]
          because heatmaps show only [X%] of visitors scroll to see
          [key information], and exit surveys indicate visitors
          missed information they were seeking.
```

```
HYPOTHESIS TYPE: Plain Language
TEMPLATE: Rewriting [element] to replace [jargon/technical terms] with
          [customer language]
          will increase [conversion metric] by [%]
          because user testing showed [X%] of participants misunderstood
          [term], and customer interviews revealed they use [alternative
          language] to describe their needs.
```

**Example Clarity Hypotheses:**

```
HYPOTHESIS: Replacing the jargon-heavy product description ("AI-powered
SaaS solution leveraging machine learning algorithms") with benefit-focused
plain language ("Software that automatically finds your best customers")
will increase engagement (scroll depth, time on page) by 20-30%
because user testing showed 7/10 participants couldn't explain what
the product does after reading current copy.
```

```
HYPOTHESIS: Reducing the pricing page from 6 plan options to 3 clear tiers
will increase pricing page-to-trial conversion by 25-35%
because session recordings show visitors spending 3+ minutes comparing
plans before leaving, and Hick's Law research shows choice overload
reduces decision-making.
```

```
HYPOTHESIS: Adding a progress indicator to the 4-step checkout process
will reduce cart abandonment by 10-15%
because session recordings show hesitation before step 2 (visitors
don't know how many steps remain), and user testing revealed
participants expected checkout to be "quick" and felt uncertain
about time investment.
```

#### Anxiety Hypotheses

**When to Focus on Anxiety:**
- Products/services involve significant cost
- Personal or sensitive information is required
- Trust indicators are missing or weak
- Industry has trust issues (used cars, insurance, etc.)
- Company is new or unknown
- Competitors have stronger brand recognition
- Visitors express concerns in surveys/reviews
- Refund requests cite unexpected issues

**Anxiety Hypothesis Templates:**

```
HYPOTHESIS TYPE: Social Proof
TEMPLATE: Adding [social proof element] showing [number/type of validation]
          will increase [conversion metric] by [%]
          because surveys reveal [X%] of visitors cite "[concern]" as
          reason for not converting, and customer interviews show
          [social proof type] is key decision factor.
```

```
HYPOTHESIS TYPE: Risk Reversal
TEMPLATE: Adding/emphasizing [guarantee/refund policy/free trial]
          will increase [conversion metric] by [%]
          because exit surveys show [X%] of non-converters cited
          "[risk concern]" and customer interviews reveal
          "[specific fear about purchase]."
```

```
HYPOTHESIS TYPE: Trust Signals
TEMPLATE: Adding [trust signals: security badges, certifications, media logos]
          will increase [conversion metric] by [%]
          because user testing revealed [X/10] participants expressed
          concerns about [security/legitimacy/quality], and industry
          research shows [trust signal type] increases conversion by [%].
```

**Example Anxiety Hypotheses:**

```
HYPOTHESIS: Adding customer review ratings (4.8/5 from 2,500+ reviews) and
trust badges (BBB, security certifications) near the checkout button
will increase checkout completion by 15-25%
because post-abandonment survey shows 34% of cart abandoners cited
"wasn't sure I could trust this site" and company is only 2 years old
with limited brand awareness.
```

```
HYPOTHESIS: Adding a "30-Day Money-Back Guarantee - No Questions Asked"
badge prominently near the price and CTA
will increase purchases by 20-30%
because customer interviews revealed the #1 objection is "what if
it doesn't work for my situation?" and competitor analysis shows
they don't offer comparable guarantees.
```

```
HYPOTHESIS: Adding real-time customer activity notifications ("Sarah from
Denver just purchased 12 minutes ago")
will increase conversion by 10-15%
because research shows social proof of recent activity reduces
"is this site legitimate?" anxiety, and heatmap data shows visitors
looking for validation signals before converting.
```

#### Distraction Hypotheses

**When to Focus on Distraction:**
- Landing pages have global navigation
- Multiple CTAs compete for attention
- Sidebars or widgets pull attention from main conversion
- Pop-ups or chat widgets interrupt flow
- Footer links lead visitors away
- Page serves multiple purposes (inform AND convert)
- Heatmaps show clicks on non-converting elements

**Distraction Hypothesis Templates:**

```
HYPOTHESIS TYPE: Removing Navigation
TEMPLATE: Removing [navigation/menu] from [landing page]
          will increase [conversion metric] by [%]
          because heatmaps show [X%] of visitors click navigation to
          leave the page, and the page's purpose is conversion, not
          exploration.
```

```
HYPOTHESIS TYPE: Single CTA Focus
TEMPLATE: Reducing CTAs from [multiple options] to [single primary CTA]
          will increase [primary conversion metric] by [%]
          because heatmaps show clicks distributed across [X] different
          CTAs, and Hick's Law research shows choice reduction increases
          action-taking.
```

```
HYPOTHESIS TYPE: Removing Secondary Elements
TEMPLATE: Removing [secondary element] from [page]
          will increase [conversion metric] by [%]
          because heatmaps show [X%] of engagement goes to [secondary
          element] which has [low/no conversion value], and removing
          it will focus attention on [primary conversion goal].
```

**Example Distraction Hypotheses:**

```
HYPOTHESIS: Removing the main navigation menu from the paid traffic landing page
(keeping only logo and CTA)
will increase lead form submissions by 25-35%
because heatmaps show 23% of visitors click navigation to leave the page,
and paid traffic has specific intent that navigation dissipates.
```

```
HYPOTHESIS: Removing the "Related Articles" sidebar from the product pages
will increase Add-to-Cart rate by 10-15%
because session recordings show visitors clicking to articles and not
returning, and the sidebar receives 18% of page clicks while contributing
0.3% of conversions.
```

```
HYPOTHESIS: Replacing 4 different CTA buttons ("Buy Now," "Learn More,"
"See Demo," "Contact Sales") with a single "Get Started Free" button
will increase conversion by 20-30%
because heatmaps show evenly distributed clicks and user testing
revealed participants felt "overwhelmed by choices" and often clicked
"Learn More" as a delay tactic.
```

#### Urgency Hypotheses

**When to Focus on Urgency:**
- Product/service has natural scarcity (limited inventory, seats, time-slots)
- Promotions or sales have legitimate deadlines
- Research shows visitors intend to "come back later" and don't
- Industry has time-sensitive elements (events, seasons, expiring offers)
- Conversion delay equals lost opportunity

**Warning:** Urgency must be LEGITIMATE. Fake countdown timers and artificial scarcity damage trust and may violate regulations.

**Urgency Hypothesis Templates:**

```
HYPOTHESIS TYPE: Legitimate Scarcity
TEMPLATE: Displaying [real inventory/availability information]
          will increase [conversion metric] by [%]
          because [scarcity is real/genuine], and research shows
          visitors delay decisions when no urgency exists, with
          [X%] of "return later" visitors never returning.
```

```
HYPOTHESIS TYPE: Deadline Visibility
TEMPLATE: Adding [countdown timer/deadline reminder] for [legitimate offer]
          will increase [conversion metric] by [%]
          because analytics show [X%] conversion lift in final days
          of promotions, indicating visitors respond to deadlines
          but may not be aware of them.
```

```
HYPOTHESIS TYPE: Loss Framing
TEMPLATE: Reframing [benefit message] to emphasize [what visitor loses by waiting]
          will increase [conversion metric] by [%]
          because behavioral economics research shows loss aversion
          is stronger than gain seeking, and current messaging only
          emphasizes gains.
```

**Example Urgency Hypotheses:**

```
HYPOTHESIS: Adding real-time inventory count ("Only 3 left in stock") for
products with fewer than 10 units available
will increase conversion rate by 15-25%
because scarcity is genuine (not manufactured), and research shows
visitors delay purchasing decisions when they believe inventory is
unlimited. Analytics confirm 67% of "add to cart" users who don't
purchase never return.
```

```
HYPOTHESIS: Adding a countdown timer showing time remaining in the legitimate
annual sale (sale dates are published and real)
will increase conversion rate during sale period by 20-30%
because analytics show 45% of sale period conversions occur in final
48 hours, indicating visitors respond to deadlines but may not be
tracking them. Timer makes deadline salient.
```

---

## Section 4: A/B Testing vs Multivariate Testing (MVT)

### A/B Testing (Split Testing)

**What It Is:**
Comparing two (or more) versions of a page where each version represents a single variable change or a complete alternative design.

**When to Use A/B Testing:**

1. **Lower Traffic Volume**
   - A/B tests require fewer visitors to reach significance
   - Rule of thumb: Need 100+ conversions per variation
   - With 2 variations, need 200+ total conversions
   - With 5 variations, need 500+ total conversions

2. **Testing Single Variables**
   - Headline A vs Headline B
   - Button color comparison
   - Single CTA text variation
   - One section redesign

3. **Testing Complete Redesigns**
   - Revolutionary Site Redesign (RSR) approach
   - Comparing fundamentally different approaches
   - Testing different page structures/layouts

4. **Speed is Priority**
   - A/B tests reach significance faster
   - Get learnings with smaller sample sizes
   - Iterate quickly through hypotheses

5. **Early Optimization Phases**
   - When you're not sure what works
   - Testing big swings vs incremental changes
   - Establishing baselines

**A/B Testing Requirements:**
```
MINIMUM CONVERSIONS: 100-400 per variation
MINIMUM DURATION:    10 days (2 full weekends)
TRAFFIC SPLIT:       Equal (50/50 for 2 variations)
CONFIDENCE TARGET:   95% statistical significance
```

**A/B Test Limitations:**
- Can only test one variable at a time (isolating effect)
- Or must test complete packages (can't isolate which element drove lift)
- Requires separate tests for each variable
- May miss interaction effects between elements

### Multivariate Testing (MVT)

**What It Is:**
Testing multiple variables simultaneously to understand both individual effects AND interaction effects between variables.

**Example MVT Setup:**
```
ELEMENTS BEING TESTED:
- Headline (2 versions: A, B)
- Hero Image (2 versions: A, B)
- CTA Button (2 versions: A, B)

RESULTING COMBINATIONS:
1. Headline A + Image A + CTA A
2. Headline A + Image A + CTA B
3. Headline A + Image B + CTA A
4. Headline A + Image B + CTA B
5. Headline B + Image A + CTA A
6. Headline B + Image A + CTA B
7. Headline B + Image B + CTA A
8. Headline B + Image B + CTA B

TOTAL VARIATIONS: 2 x 2 x 2 = 8
```

**When to Use MVT:**

1. **High Traffic Volume**
   - Need enough conversions for ALL combinations
   - 8 variations = need 800-3,200 conversions
   - 16 variations = need 1,600-6,400 conversions
   - Typically need 100,000+ monthly visitors for meaningful MVT

2. **Understanding Interactions**
   - Does Headline A work better with Image A or B?
   - Do certain combinations create synergy or conflict?
   - Finding optimal combination of elements

3. **Optimizing Within Established Framework**
   - Page structure is set, optimizing elements within it
   - Multiple elements need testing simultaneously
   - Looking for compound gains

4. **Late-Stage Optimization**
   - Major elements already optimized
   - Looking for incremental improvements
   - Fine-tuning established pages

**MVT Requirements:**
```
MINIMUM CONVERSIONS: 100-400 per combination
COMBINATIONS:        Calculate as Product of variations
                     (3 headlines x 2 images x 2 CTAs = 12 combinations)
MINIMUM DURATION:    Often 4-8 weeks due to sample size needs
TRAFFIC SPLIT:       Equal across all combinations
CONFIDENCE TARGET:   95% statistical significance
```

**MVT Limitations:**
- Requires massive traffic volume
- Takes longer to reach significance
- More complex to implement and analyze
- Small sites can rarely run meaningful MVT
- Interaction effects can be difficult to interpret

### Decision Framework: A/B vs MVT

```
TRAFFIC CHECK:
- Less than 10,000 monthly visitors → A/B only
- 10,000-50,000 monthly visitors → A/B preferred, limited MVT possible
- 50,000-100,000 monthly visitors → Both viable, choose based on goals
- 100,000+ monthly visitors → Full MVT capability

GOAL CHECK:
- Testing revolutionary changes → A/B
- Testing single variable → A/B
- Understanding interactions → MVT
- Optimizing multiple elements → MVT (if traffic supports)
- Quick learnings needed → A/B
- Comprehensive optimization → MVT (if traffic supports)

PHASE CHECK:
- New product/page, no prior testing → A/B
- Established page, major changes → A/B
- Established page, fine-tuning → MVT (if traffic supports)
- Unknown what works → A/B with bold variations
- Know what works, optimizing → MVT
```

### Evolutionary vs Revolutionary Site Redesign

**Evolutionary Site Redesign (ESR):**
```
APPROACH: Continuous A/B testing of incremental improvements
BEST FOR: Established sites with baseline data
METHOD:
1. Identify highest-PIE opportunities
2. Form hypotheses based on research
3. Test one change at a time
4. Implement winners
5. Repeat continuously

ADVANTAGES:
- Lower risk (small changes)
- Continuous learning
- Each test builds on previous
- Never "break" what's working
- Data-driven decisions

DISADVANTAGES:
- Slow transformation
- May miss revolutionary opportunities
- Can get stuck in local maxima
```

**Revolutionary Site Redesign (RSR):**
```
APPROACH: Testing complete redesign against current site
BEST FOR: Sites with fundamental problems, brand refreshes
METHOD:
1. Research current site failures deeply
2. Design completely new approach
3. Test new design against current (50/50 split)
4. If new wins, implement
5. Then switch to ESR for optimization

ADVANTAGES:
- Can achieve dramatic lift
- Fresh approach to old problems
- Faster transformation
- Breaks out of local maxima

DISADVANTAGES:
- Higher risk
- Can't isolate which changes drove results
- "Winning" redesign may have losing elements
- Requires significant design/dev investment
```

**When to Use Each:**
```
USE ESR WHEN:
- Current site performs adequately
- Incremental improvement is acceptable
- Risk tolerance is low
- Resources for continuous testing exist
- Site/brand is established

USE RSR WHEN:
- Current site fundamentally broken
- Conversion rate far below benchmark
- Brand/positioning has changed
- Competitive landscape shifted dramatically
- Technical debt prevents iteration
- Starting from scratch makes more sense
```

---

## Section 5: Statistical Fundamentals

### Understanding Statistical Significance

**What Statistical Significance Means:**
When we say a result is "statistically significant at 95% confidence," we mean:
- There is only a 5% probability (p < 0.05) that the observed difference occurred by random chance
- We are 95% confident that a real difference exists
- This does NOT mean the variation is 95% likely to win in the future
- This does NOT tell us the magnitude of the real difference

**What It Doesn't Mean:**
- "The variation will always beat the control"
- "The lift will be exactly X%"
- "We should definitely implement this"

### The 68-95-99.7 Rule (Empirical Rule)

In a normal distribution:
```
68% of observations fall within 1 standard deviation of the mean
95% of observations fall within 2 standard deviations of the mean
99.7% of observations fall within 3 standard deviations of the mean
```

**Application to A/B Testing:**

When you see a confidence interval for your test result, the range represents the likely true lift:

```
OBSERVED LIFT: 15%
95% CONFIDENCE INTERVAL: 8% to 22%

INTERPRETATION:
- Our best estimate of the true lift is 15%
- We're 95% confident the true lift is between 8% and 22%
- There's a 2.5% chance the true lift is above 22%
- There's a 2.5% chance the true lift is below 8%
- The true lift is almost certainly not 0% (we'd reject no-effect)
```

### Sample Size Requirements

**Why Sample Size Matters:**
- Too small: Can't detect real differences (Type II error)
- Too small: Random variation dominates results
- Larger samples: More precise estimates
- Larger samples: Can detect smaller effects

**Rule of Thumb: 100-400 Conversions Per Variation**

```
SCENARIO PLANNING:

Small Effect Size (5-10% lift):
- Need larger samples to detect
- 400+ conversions per variation recommended
- Takes longer to reach significance

Medium Effect Size (10-20% lift):
- 200-300 conversions per variation often sufficient
- More typical for meaningful tests

Large Effect Size (20%+ lift):
- 100-200 conversions per variation may suffice
- Can reach significance faster
- Bold changes more likely to show large effects
```

**Sample Size Calculation Factors:**
1. Baseline conversion rate (lower = need more traffic)
2. Minimum detectable effect (smaller = need more traffic)
3. Number of variations (more = need more traffic)
4. Desired confidence level (higher = need more traffic)

### Data Rate Calculation

**Purpose:** Determine how long your test needs to run based on your traffic and conversion rate.

**Formula:**
```
DAILY CONVERSIONS = (Daily Visitors) × (Conversion Rate)
DAYS TO SIGNIFICANCE = (Conversions Needed) / (Daily Conversions)

EXAMPLE:
- Daily Visitors: 5,000
- Conversion Rate: 2%
- Daily Conversions: 5,000 × 0.02 = 100
- Testing 2 variations: Need 200+ total conversions
- Days Needed: 200 / 100 = 2 days minimum

BUT: Never run less than 10 days (need 2 weekends minimum)
ACTUAL DURATION: 10+ days
```

**Data Rate Planning Tool:**
```
INPUTS:
- Average daily unique visitors to test page
- Current conversion rate
- Number of variations
- Minimum conversions per variation needed (100-400)

CALCULATION:
Daily Conversions per Variation = (Daily Visitors / # Variations) × Conversion Rate
Days for Sample Size = Minimum Conversions / Daily Conversions per Variation
Actual Duration = MAX(Days for Sample Size, 10 days)

EXAMPLE:
- Daily visitors: 10,000
- Conversion rate: 3%
- Variations: 2 (one control, one test)
- Minimum conversions needed: 200 per variation

Daily conversions per variation = (10,000 / 2) × 0.03 = 150
Days for sample size = 200 / 150 = 1.33 days
Actual duration = MAX(1.33, 10) = 10 days
```

### Confidence Levels

**95% Confidence (Standard):**
- Industry standard for most tests
- 5% chance of false positive (Type I error)
- Good balance of certainty and practicality

**99% Confidence (Conservative):**
- Used for high-stakes decisions
- 1% chance of false positive
- Requires larger samples/longer tests
- Use for: major redesigns, irreversible changes

**90% Confidence (Aggressive):**
- Higher risk of false positive (10%)
- Faster results
- Use for: low-stakes tests, early exploration
- NOT recommended for final decisions

**When to Adjust Confidence Level:**
```
USE 99% WHEN:
- Decision is difficult/expensive to reverse
- Major investment rides on result
- Regulatory or compliance implications
- Brand reputation at stake

USE 95% FOR:
- Most standard tests
- Copy and design iterations
- Ongoing optimization programs

USE 90% ONLY WHEN:
- Exploring, not deciding
- Cost of wrong decision is low
- Speed is critical
- Results will be validated with follow-up test
```

### Seasonality and Time Considerations

**Minimum Test Duration: 10 Days (2 Weekends)**

**Why Weekends Matter:**
- Visitor behavior changes on weekends
- Different traffic composition (more mobile, different intent)
- Some products/services have heavy weekend skew
- Missing weekends can bias results

**Seasonality Factors:**
```
WEEKLY CYCLES:
- Monday vs Friday behavior differences
- Weekend vs weekday patterns
- Must capture full weekly cycle

MONTHLY CYCLES:
- Beginning/end of month (paydays)
- Bill payment cycles
- Monthly promotions

ANNUAL CYCLES:
- Holidays (Black Friday, Christmas, etc.)
- Seasonal products/services
- Industry-specific seasons (tax season, back-to-school)
- Weather-dependent behavior

TEST TIMING GUIDELINES:
- Avoid starting tests before major holidays
- Don't conclude tests during promotional periods
- Be cautious of results during atypical periods
- Consider running longer during seasonal transitions
```

**Holiday Testing Guidance:**
```
DURING MAJOR HOLIDAYS (Black Friday, Christmas):
- Run tests but interpret cautiously
- Traffic and behavior are atypical
- Results may not generalize to normal periods
- Consider holiday-specific tests

AROUND MAJOR HOLIDAYS:
- Start tests 2+ weeks before or after
- Don't compare holiday period to non-holiday
- Seasonal results should inform seasonal strategy
```

---

## Section 6: Common Testing Pitfalls

### Pitfall 1: Stopping Tests Too Early

**The Problem:**
Early results are unreliable. A test showing 20% lift on day 2 may show -5% by day 14.

**Why It Happens:**
- Random variation is high with small samples
- Early converters may not represent full audience
- Excitement to implement "winners" overrides rigor

**How to Avoid:**
```
RULES:
1. Pre-commit to minimum duration (10+ days)
2. Pre-commit to minimum sample size
3. Do not check results daily (schedule weekly reviews)
4. Use "time to statistical significance" estimates before starting
5. Lock yourself out of early stopping ability
```

### Pitfall 2: Running Too Many Tests Simultaneously

**The Problem:**
Multiple tests on the same user can interfere with each other, making results uninterpretable.

**Why It Happens:**
- Pressure to test "everything"
- Multiple teams running tests independently
- Misunderstanding of interaction effects

**How to Avoid:**
```
RULES:
1. One test per page/user flow at a time
2. Coordinate testing calendar across teams
3. If multiple tests necessary, ensure no overlap in user journey
4. Document all active tests
5. Consider whole-funnel testing vs isolated page testing
```

### Pitfall 3: Testing Too Small

**The Problem:**
Small changes require massive samples to detect. Button color changes rarely drive meaningful lift.

**Why It Happens:**
- Fear of bold changes
- "Let's start small and learn"
- Misunderstanding of effect sizes
- Stakeholder risk aversion

**How to Avoid:**
```
RULES:
1. Test bold hypotheses, not minor tweaks
2. If you can't see the change from 10 feet away, it's too small
3. Reserve small tests for high-traffic sites where detection is possible
4. Calculate minimum detectable effect before testing
5. Bundle small changes together if individual testing impractical
```

### Pitfall 4: Ignoring Segment Variations

**The Problem:**
A "winner" overall may be a loser for important segments. Mobile users may hate what desktop users love.

**Why It Happens:**
- Only looking at aggregate results
- Not pre-defining segments of interest
- Sample size too small for segment analysis
- Assuming all visitors are the same

**How to Avoid:**
```
RULES:
1. Pre-define segments of interest before testing
2. Check results by device, traffic source, customer type
3. Be cautious of implementing if segment results conflict
4. Consider segment-specific tests for important audiences
5. Ensure sample size supports segment analysis
```

### Pitfall 5: No Hypothesis (Just Testing)

**The Problem:**
Testing without hypothesis generates data without insight. "Let's try this and see" doesn't teach you anything.

**Why It Happens:**
- Testing for testing's sake
- Copying competitors without understanding why
- HiPPO-driven tests (Highest Paid Person's Opinion)
- No research foundation

**How to Avoid:**
```
RULES:
1. Every test must have a documented hypothesis
2. Hypothesis must include "because" reasoning
3. Hypothesis must connect to LIFT factors
4. Document expected effect size and direction
5. Review hypothesis regardless of outcome
```

### Pitfall 6: Testing the Wrong Thing

**The Problem:**
High effort optimizing elements that don't matter while ignoring high-impact opportunities.

**Why It Happens:**
- Not using PIE prioritization
- Testing what's easy vs what's important
- Not understanding the funnel
- Focusing on vanity metrics

**How to Avoid:**
```
RULES:
1. Use PIE framework for all test prioritization
2. Start with highest-traffic, highest-intent pages
3. Fix broken things before optimizing working things
4. Validate that test metric connects to business outcomes
5. Consider opportunity cost of every test
```

### Pitfall 7: Ignoring Practical Significance

**The Problem:**
A statistically significant 0.5% lift may cost more to implement than it generates in value.

**Why It Happens:**
- Conflating statistical and practical significance
- Not calculating implementation costs
- Not projecting revenue impact
- Celebrating "wins" without context

**How to Avoid:**
```
RULES:
1. Calculate projected revenue lift before implementing
2. Compare implementation cost to projected benefit
3. Set minimum practical effect size threshold
4. Consider long-term maintenance costs
5. Factor in opportunity cost of implementation resources
```

### Pitfall 8: Not Documenting and Learning

**The Problem:**
Teams run the same failed tests repeatedly. Learnings don't compound. Knowledge stays in individuals' heads.

**Why It Happens:**
- No documentation system
- Staff turnover
- Siloed teams
- "We'll remember" mentality

**How to Avoid:**
```
RULES:
1. Document every test in central repository
2. Include hypothesis, results, and learnings
3. Record screenshots of both variations
4. Review past tests before proposing new ones
5. Quarterly review of testing learnings
```

### Pitfall 9: Sample Ratio Mismatch (SRM)

**The Problem:**
Test tool assigns unequal traffic, invalidating results. If you expected 50/50 but got 48/52, something's wrong.

**Why It Happens:**
- Technical implementation errors
- Bot traffic not excluded equally
- Caching issues
- Redirect-based tests with unequal load times

**How to Avoid:**
```
RULES:
1. Always check sample ratio in results
2. Use statistical test for SRM (chi-squared)
3. Allow 1-2% variance, investigate beyond that
4. Exclude bots consistently across variations
5. QA test implementation thoroughly before launch
```

### Pitfall 10: Multiple Comparisons Problem

**The Problem:**
Testing many variations or metrics increases false positive rate. With 20 metrics, one will show p<0.05 by chance.

**Why It Happens:**
- Testing many variations without correction
- Looking at every possible metric
- "Let's see what moves"
- Post-hoc analysis without adjustment

**How to Avoid:**
```
RULES:
1. Pre-define primary metric before test
2. Limit number of variations
3. Apply Bonferroni correction for multiple comparisons
4. Secondary metrics are directional, not conclusive
5. Replicate "surprising" findings before acting
```

---

## Section 7: Templates and Examples

### Hypothesis Documentation Template

```
=================================================================
TEST HYPOTHESIS DOCUMENT
=================================================================

TEST NAME: [Descriptive name for the test]
TEST ID: [Unique identifier]
DATE PROPOSED: [Date]
PROPOSED BY: [Name]

-----------------------------------------------------------------
BACKGROUND
-----------------------------------------------------------------

Page/Element Being Tested:
[URL and description]

Current Performance:
- Conversion Rate: [X%]
- Monthly Traffic: [X]
- Monthly Conversions: [X]
- Revenue Impact: [$X per 1% lift]

Research Supporting This Test:
- Quantitative: [Analytics findings]
- Qualitative: [User research findings]
- Competitive: [Competitor insights, if relevant]

-----------------------------------------------------------------
HYPOTHESIS
-----------------------------------------------------------------

We believe that:
[Specific change being made]

Will result in:
[Specific outcome expected, with magnitude]

Because:
[Research-based reasoning]

LIFT Factor(s) Addressed:
[ ] Value Proposition
[ ] Relevance
[ ] Clarity
[ ] Anxiety
[ ] Distraction
[ ] Urgency

-----------------------------------------------------------------
TEST DESIGN
-----------------------------------------------------------------

Test Type: [ ] A/B [ ] MVT

Control (Current):
[Description of current state]

Variation(s):
[Description of each variation]

Primary Metric:
[Single metric that determines success]

Secondary Metrics:
[Other metrics to monitor]

Success Criteria:
- Minimum lift for implementation: [X%]
- Statistical confidence required: [95%]

-----------------------------------------------------------------
SAMPLE SIZE & DURATION
-----------------------------------------------------------------

Current Daily Traffic: [X]
Current Conversion Rate: [X%]
Number of Variations: [X]
Conversions Needed per Variation: [100-400]
Estimated Days to Significance: [X]
Planned Test Duration: [X days, minimum 10]

-----------------------------------------------------------------
RISKS & CONSIDERATIONS
-----------------------------------------------------------------

Implementation Risks:
[Technical or operational risks]

Business Risks:
[Revenue or brand risks if variation performs poorly]

Segments of Interest:
[Any segments to analyze separately]

Seasonality Considerations:
[Any timing factors to consider]

-----------------------------------------------------------------
APPROVAL
-----------------------------------------------------------------

Approved by: ___________________ Date: ___________
```

### Hypothesis Examples by LIFT Factor

#### Value Proposition Hypothesis Examples

**Example 1: SaaS Product Homepage**
```
TEST NAME: Homepage Headline - Benefit vs Feature Focus

We believe that:
Changing the homepage headline from "AI-Powered Marketing Automation Platform"
to "Get 3X More Leads Without Hiring More Marketers"

Will result in:
15-25% increase in demo request conversion rate

Because:
User testing revealed that 8/10 participants couldn't explain what the product
does or why they should care after viewing the current homepage. Customer
interviews consistently showed that "getting more leads with existing resources"
is the #1 desired outcome. The current headline focuses on technology (features)
rather than customer benefit.

LIFT Factor: Value Proposition
Success Criteria: >15% lift at 95% confidence
```

**Example 2: E-commerce Category Page**
```
TEST NAME: Category Page - Unique Selling Proposition Addition

We believe that:
Adding a USP banner ("Handmade by Fair Trade Artisans • Free Returns •
Ships in 24 Hours") to the top of category pages

Will result in:
10-20% increase in category-to-product page click-through rate

Because:
Exit surveys show visitors leave to "compare with Amazon" without understanding
our differentiation. Customer interviews reveal ethical sourcing and fast
shipping are key decision factors, but neither is mentioned on category pages.
Competitive analysis shows our shipping is faster than competitors but we don't
communicate it.

LIFT Factor: Value Proposition
Success Criteria: >10% lift at 95% confidence
```

#### Relevance Hypothesis Examples

**Example 1: Paid Search Landing Page**
```
TEST NAME: Landing Page Message Match - "Free Trial" Campaign

We believe that:
Creating a dedicated landing page for the "free trial" ad campaign that
headlines with "Start Your Free 14-Day Trial - No Credit Card Required"
(matching the ad copy)

Will result in:
30-50% increase in free trial signups from this campaign

Because:
Current generic landing page leads with product features and buries the free
trial offer below the fold. This creates cognitive disconnect with ad that
promises "Free Trial." Campaign currently converts at 1.2% vs 3.1% site
average. Bounce rate from this campaign is 71% vs 52% site average.

LIFT Factor: Relevance
Success Criteria: >30% lift at 95% confidence
```

**Example 2: Segment-Specific Content**
```
TEST NAME: Enterprise vs SMB Messaging

We believe that:
Showing enterprise visitors (detected via firmographic data) enterprise-specific
messaging ("Trusted by 500+ Fortune 1000 Companies") vs SMB visitors seeing
SMB-specific messaging ("Built for Growing Teams Like Yours")

Will result in:
20-30% increase in conversion rate for both segments

Because:
Currently all visitors see the same messaging which tries to appeal to everyone
and resonates with no one. Enterprise visitors convert at 0.8% vs 2.4% SMB,
suggesting message mismatch. Customer interviews reveal enterprise buyers need
validation and scale proof while SMB buyers need relatability and simplicity.

LIFT Factor: Relevance
Success Criteria: >20% lift for each segment at 95% confidence
```

#### Clarity Hypothesis Examples

**Example 1: Form Simplification**
```
TEST NAME: Lead Form Field Reduction

We believe that:
Reducing the lead form from 8 fields (Name, Email, Company, Title, Phone,
Company Size, Industry, Message) to 3 fields (Name, Email, Company)

Will result in:
40-60% increase in form submissions

Because:
Form analytics show 67% of users who start the form abandon it. Session
recordings show significant hesitation at "Company Size" and "Industry" fields.
User testing revealed 6/10 participants said the form was "too long" or felt
"invasive." The extra fields are "nice to have" for sales but create friction
for visitors.

LIFT Factor: Clarity (reduced complexity)
Success Criteria: >40% lift at 95% confidence
Trade-off Monitored: Lead quality (SQL conversion rate)
```

**Example 2: Pricing Clarity**
```
TEST NAME: Pricing Page Simplification

We believe that:
Restructuring the pricing page from a 15-row feature comparison table to
3 simple plan cards with 4-5 key differentiators each

Will result in:
25-40% increase in pricing page-to-signup conversion

Because:
Heatmaps show users scrolling up and down the pricing table repeatedly
(confusion indicator). Average time on page is 4.2 minutes (decision paralysis).
Exit surveys show "pricing was confusing" as #2 reason for not signing up.
User testing showed 7/10 participants couldn't explain the difference between
plans after viewing the page.

LIFT Factor: Clarity
Success Criteria: >25% lift at 95% confidence
```

#### Anxiety Hypothesis Examples

**Example 1: Social Proof Addition**
```
TEST NAME: Checkout Page Trust Elements

We believe that:
Adding trust elements to the checkout page (customer count: "Join 50,000+
Happy Customers," security badges: McAfee Secure and SSL verified, and
money-back guarantee badge)

Will result in:
15-25% reduction in cart abandonment

Because:
Post-abandonment survey shows 38% cite "didn't trust the site with my credit
card" and 24% cite "wasn't sure about quality/returns." Company is 3 years old
with limited brand recognition. Competitor analysis shows established players
prominently display trust signals we lack. Session recordings show hesitation
and mouse hovering near payment fields before abandonment.

LIFT Factor: Anxiety reduction
Success Criteria: >15% reduction in abandonment at 95% confidence
```

**Example 2: Guarantee Emphasis**
```
TEST NAME: Money-Back Guarantee Prominence

We believe that:
Moving the 30-day money-back guarantee from the FAQ page to a prominent
badge directly next to the price and CTA button

Will result in:
20-30% increase in purchases

Because:
Customer interviews revealed that risk of "what if it doesn't work for me?"
is the #1 objection, yet the guarantee (which addresses this directly) is
buried where 93% of visitors never see it. Heat maps confirm the FAQ page
gets minimal traffic. Surveys show 45% of visitors didn't know a guarantee
existed.

LIFT Factor: Anxiety reduction
Success Criteria: >20% lift at 95% confidence
```

#### Distraction Hypothesis Examples

**Example 1: Navigation Removal**
```
TEST NAME: Landing Page Navigation Removal

We believe that:
Removing the main navigation menu from paid advertising landing pages
(keeping only logo and primary CTA)

Will result in:
25-40% increase in conversion rate from paid traffic

Because:
Heatmaps show 27% of paid traffic visitors click navigation to explore
other pages, diluting the focused conversion intent they arrived with.
Only 3% of these navigation clickers eventually convert vs 4.2% of those
who stay on the landing page. These visitors were acquired at $15/click
to convert on THIS page, not to browse.

LIFT Factor: Distraction reduction
Success Criteria: >25% lift at 95% confidence
```

**Example 2: Single CTA Focus**
```
TEST NAME: Product Page CTA Consolidation

We believe that:
Replacing the 4 CTAs on product pages ("Buy Now," "Add to Cart," "Save for
Later," "Request Info") with a single primary CTA ("Add to Cart") with
secondary link for "Have Questions? Chat with Us"

Will result in:
20-30% increase in Add-to-Cart rate

Because:
Heatmaps show clicks distributed across all 4 CTAs, with "Save for Later"
receiving 24% of clicks (these users rarely return to purchase). Session
recordings show users deliberating between options. User testing revealed
confusion about the difference between "Buy Now" and "Add to Cart." Hick's
Law predicts choice reduction will increase action-taking.

LIFT Factor: Distraction reduction
Success Criteria: >20% lift at 95% confidence
```

#### Urgency Hypothesis Examples

**Example 1: Inventory Scarcity**
```
TEST NAME: Real-Time Inventory Display

We believe that:
Displaying real-time inventory count ("Only X left in stock!") for
products with fewer than 15 units available

Will result in:
15-25% increase in conversion rate for low-stock items

Because:
The scarcity is genuine (inventory data is real-time accurate). Analytics
show visitors who add-to-cart but don't purchase rarely return (84% never
complete purchase). Customer interviews reveal assumption that "it'll be
available later" when no urgency signals exist. Loss aversion research
shows fear of missing out is a stronger motivator than potential gain.

LIFT Factor: Urgency (legitimate scarcity)
Success Criteria: >15% lift at 95% confidence
Note: No fake scarcity - only shown when inventory genuinely low
```

**Example 2: Sale Deadline**
```
TEST NAME: Sale Countdown Timer

We believe that:
Adding a countdown timer showing exact time remaining in the current
legitimate sale event (sale dates are published and real)

Will result in:
25-40% increase in conversion rate during sale period

Because:
Analytics show 52% of sale-period conversions occur in final 24 hours,
indicating shoppers respond to deadlines but may not be tracking them.
The timer makes the existing deadline salient without creating false
urgency. Customer behavior data shows visitors browse during sales but
delay purchase, often missing the deadline.

LIFT Factor: Urgency (deadline visibility)
Success Criteria: >25% lift at 95% confidence
Note: Timer only for legitimate sales with published end dates
```

### Test Results Documentation Template

```
=================================================================
TEST RESULTS DOCUMENT
=================================================================

TEST NAME: [Name]
TEST ID: [ID]
DATE STARTED: [Start date]
DATE ENDED: [End date]
TEST DURATION: [X days]

-----------------------------------------------------------------
RESULTS SUMMARY
-----------------------------------------------------------------

OUTCOME: [ ] Winner [ ] Loser [ ] Inconclusive

Control Performance:
- Visitors: [X]
- Conversions: [X]
- Conversion Rate: [X%]

Variation Performance:
- Visitors: [X]
- Conversions: [X]
- Conversion Rate: [X%]

Observed Lift: [X%]
Statistical Confidence: [X%]
Confidence Interval: [X% to X%]

Sample Ratio Check:
- Expected: [50/50]
- Actual: [X/X]
- SRM Status: [ ] Pass [ ] Fail

-----------------------------------------------------------------
SEGMENT ANALYSIS
-----------------------------------------------------------------

Device Breakdown:
| Segment  | Control | Variation | Lift    | Confidence |
|----------|---------|-----------|---------|------------|
| Desktop  | X%      | X%        | X%      | X%         |
| Mobile   | X%      | X%        | X%      | X%         |
| Tablet   | X%      | X%        | X%      | X%         |

Traffic Source Breakdown:
| Source   | Control | Variation | Lift    | Confidence |
|----------|---------|-----------|---------|------------|
| Organic  | X%      | X%        | X%      | X%         |
| Paid     | X%      | X%        | X%      | X%         |
| Email    | X%      | X%        | X%      | X%         |

Any Concerning Segment Variations: [Yes/No, explain]

-----------------------------------------------------------------
HYPOTHESIS VALIDATION
-----------------------------------------------------------------

Original Hypothesis:
[Paste from hypothesis document]

Was Hypothesis Supported?
[ ] Yes - proceed with implementation
[ ] Partially - [explain what was/wasn't supported]
[ ] No - hypothesis was incorrect

Key Learnings:
1. [Learning 1]
2. [Learning 2]
3. [Learning 3]

Why We Think This Happened:
[Explanation of results based on LIFT framework]

-----------------------------------------------------------------
RECOMMENDATION
-----------------------------------------------------------------

[ ] IMPLEMENT: Variation is clear winner
    - Projected annual revenue impact: [$X]
    - Implementation complexity: [Low/Medium/High]
    - Timeline: [X weeks]

[ ] DO NOT IMPLEMENT: Control performed better
    - Learnings to apply: [Summary]
    - Next test recommendation: [Brief description]

[ ] ITERATE: Results inconclusive or need refinement
    - Why inconclusive: [Explanation]
    - Next iteration: [Brief description]
    - Changes to make: [List]

-----------------------------------------------------------------
NEXT TEST
-----------------------------------------------------------------

Based on these results, we recommend testing:
[Brief description of follow-up test]

Hypothesis for next test:
[1-2 sentence hypothesis]

-----------------------------------------------------------------
ATTACHMENTS
-----------------------------------------------------------------

[ ] Screenshots of Control
[ ] Screenshots of Variation(s)
[ ] Heat maps (if available)
[ ] Statistical calculations
```

### Quick Hypothesis Generation Checklist

When Claude generates test hypotheses, use this checklist:

```
HYPOTHESIS QUALITY CHECKLIST

[ ] SPECIFIC: Change is clearly defined (not "improve the page")
[ ] MEASURABLE: Success metric is identified
[ ] RESEARCH-BASED: Connected to qualitative or quantitative data
[ ] LIFT-CONNECTED: Explains which LIFT factor is addressed
[ ] MAGNITUDE ESTIMATED: Includes expected % lift range
[ ] TESTABLE: Can be isolated and measured
[ ] ACTIONABLE: Implementation is feasible
[ ] BUSINESS-RELEVANT: Connects to meaningful outcomes

HYPOTHESIS RED FLAGS (Avoid These)

[ ] "Let's try this and see what happens" (no reasoning)
[ ] "Competitor does this" (not research-based)
[ ] "Best practice says..." (cargo cult testing)
[ ] "I think users will like..." (opinion, not data)
[ ] "Make it pop more" (not specific or measurable)
[ ] "Test everything at once" (can't isolate effects)
```

---

## Appendix: Statistical Tables Quick Reference

### Sample Size Requirements by Effect Size and Baseline

```
CONVERSIONS NEEDED PER VARIATION (95% confidence, 80% power)

Baseline     | 5% MDE | 10% MDE | 15% MDE | 20% MDE | 25% MDE
Rate         |        |         |         |         |
-------------|--------|---------|---------|---------|--------
1%           | 31,000 | 7,800   | 3,500   | 2,000   | 1,300
2%           | 15,500 | 3,900   | 1,750   | 1,000   | 640
3%           | 10,400 | 2,600   | 1,200   | 670     | 430
5%           | 6,300  | 1,600   | 710     | 400     | 260
10%          | 3,200  | 800     | 360     | 210     | 135
15%          | 2,200  | 540     | 250     | 145     | 95
20%          | 1,600  | 400     | 190     | 110     | 72

MDE = Minimum Detectable Effect (relative lift)
Example: 2% baseline with 10% MDE means detecting lift from 2% to 2.2%
```

### Test Duration Guidelines

```
MINIMUM TEST DURATION BY CONVERSION VOLUME

Daily Conversions | Min Duration | Reasoning
------------------|--------------|----------------------------------
< 10              | 30+ days     | Need more data; consider bolder tests
10-25             | 20+ days     | Account for weekly variation
25-50             | 14+ days     | Standard testing window
50-100            | 10 days      | Minimum to capture 2 weekends
100-200           | 10 days      | Can detect medium effects quickly
200+              | 10 days      | Can detect smaller effects

ALWAYS run minimum 10 days regardless of sample size to capture full week cycle
```

### Confidence Level Reference

```
CONFIDENCE LEVEL INTERPRETATION

Confidence | p-value | False Positive | When to Use
Level      |         | Risk           |
-----------|---------|----------------|---------------------------
99%        | < 0.01  | 1%             | High-stakes, irreversible
95%        | < 0.05  | 5%             | Standard testing
90%        | < 0.10  | 10%            | Exploration only
```

---

## Using This Reference: Instructions for Claude

When generating test hypotheses:

1. **Always start with research basis** - What data supports this test?

2. **Use the LIFT framework** - Which factor does this hypothesis address?

3. **Be specific about the change** - Exactly what will be different?

4. **Estimate effect size** - Based on similar tests or the boldness of change

5. **Include success criteria** - What lift is needed to implement?

6. **Consider segments** - Will this work for all visitors or specific groups?

7. **Flag risks** - What could go wrong?

8. **Use the templates** - Fill in all sections for completeness

When recommending test prioritization:

1. **Calculate PIE scores** - Rate Potential, Importance, Ease 1-10

2. **Consider traffic volume** - Can this page reach significance?

3. **Check for conflicts** - Any active tests that would interfere?

4. **Sequence logically** - Fix foundational issues before optimization

When analyzing test results:

1. **Verify statistical validity** - Did we meet sample size and duration requirements?

2. **Check for SRM** - Was traffic split as expected?

3. **Examine segments** - Consistent results across device, source, etc.?

4. **Connect to hypothesis** - Was our reasoning correct?

5. **Document learnings** - What do we now know that we didn't before?

6. **Recommend next steps** - Implement, iterate, or move on?
