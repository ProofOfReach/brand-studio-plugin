#!/bin/bash
# Landing Page Scorer - 100-Point Scoring System
# Based on Maria Veloso's SQ methodology, LIFT Model, and Krug's usability principles
# Usage: landing-page-scorer.sh [--help] [--export filename]

set -e

# ═══════════════════════════════════════════════════════════════════════════════
# COLORS AND FORMATTING
# ═══════════════════════════════════════════════════════════════════════════════
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
BOLD='\033[1m'
DIM='\033[2m'
UNDERLINE='\033[4m'
NC='\033[0m' # No Color

# ═══════════════════════════════════════════════════════════════════════════════
# GLOBAL VARIABLES
# ═══════════════════════════════════════════════════════════════════════════════
EXPORT_FILE=""
TOTAL_SCORE=0
declare -A SECTION_SCORES
declare -A SUBSECTION_SCORES

# ═══════════════════════════════════════════════════════════════════════════════
# USAGE AND HELP
# ═══════════════════════════════════════════════════════════════════════════════
show_usage() {
    cat << 'USAGE_EOF'

╔══════════════════════════════════════════════════════════════════════════════╗
║              LANDING PAGE SCORER - 100-POINT SCORING SYSTEM                   ║
║                                                                               ║
║   Based on: Maria Veloso's Selling Quotient (SQ) Methodology                  ║
║            LIFT Model (Widerfunnel)                                           ║
║            Steve Krug's Usability Principles                                  ║
╚══════════════════════════════════════════════════════════════════════════════╝

USAGE:
    landing-page-scorer.sh [OPTIONS]

OPTIONS:
    --help, -h          Show this help message and methodology overview
    --export, -e FILE   Export final score report to specified file
    --methodology, -m   Show detailed methodology breakdown
    --quick, -q         Quick scoring mode (fewer prompts)

EXAMPLES:
    landing-page-scorer.sh                    # Full interactive scoring
    landing-page-scorer.sh --quick            # Quick assessment mode
    landing-page-scorer.sh --export report.md # Export results to file
    landing-page-scorer.sh --methodology      # View scoring methodology

SCORING CATEGORIES (100 Points Total):
    1. First Impression         0-20 points
    2. LIFT Model Factors       0-30 points
    3. Trust & Credibility      0-15 points
    4. CTA Effectiveness        0-15 points
    5. Usability                0-10 points
    6. Technical                0-10 points

GRADING SCALE:
    90-100: Excellent    - Ready for high-traffic campaigns
    75-89:  Good         - Minor optimizations recommended
    60-74:  Needs Work   - Address key issues before scaling
    Below 60: Major Issues - Significant revision required

METHODOLOGY SOURCES:
    - Maria Veloso's "Web Copy That Sells" - Selling Quotient framework
    - Widerfunnel's LIFT Model - Conversion optimization factors
    - Steve Krug's "Don't Make Me Think" - Usability heuristics

USAGE_EOF
}

# ═══════════════════════════════════════════════════════════════════════════════
# METHODOLOGY DOCUMENTATION
# ═══════════════════════════════════════════════════════════════════════════════
show_methodology() {
    cat << 'METHODOLOGY_EOF'

╔══════════════════════════════════════════════════════════════════════════════╗
║                    DETAILED METHODOLOGY BREAKDOWN                             ║
╚══════════════════════════════════════════════════════════════════════════════╝

═══════════════════════════════════════════════════════════════════════════════
MARIA VELOSO'S SELLING QUOTIENT (SQ) METHODOLOGY
═══════════════════════════════════════════════════════════════════════════════

Maria Veloso's approach focuses on web-specific copywriting that sells. Her SQ
methodology evaluates how effectively copy addresses the psychological needs
of web visitors and moves them toward conversion.

Key Principles Applied:

  1. THE 5-SECOND RULE
     Visitors decide in 5 seconds whether to stay or leave. Your value
     proposition must be immediately clear and compelling.

  2. THE TRIFECTA NEURO-AFFECTIVE PRINCIPLE
     Copy must simultaneously:
     - Capture attention (pattern interrupt)
     - Establish relevance (this is for me)
     - Create engagement (I want to know more)

  3. THE EMOTIONAL SELLING PROPOSITION
     Beyond USP - tap into emotional drivers:
     - What do they secretly desire?
     - What are they afraid of?
     - What frustrates them most?

  4. INVOLVEMENT DEVICES
     Interactive elements that create engagement:
     - Questions that make them think
     - Mental exercises and visualizations
     - Self-identification prompts

  5. THE LINEAR PATH
     Guide visitors through a single, focused journey:
     - One offer
     - One audience
     - One desired action

═══════════════════════════════════════════════════════════════════════════════
LIFT MODEL (WIDERFUNNEL)
═══════════════════════════════════════════════════════════════════════════════

The LIFT Model identifies six factors that affect conversion rates.

FOUNDATION:
  Value Proposition - The core exchange of value

CONVERSION DRIVERS (+):
  1. RELEVANCE - Does the page content match visitor expectations?
  2. CLARITY - How clear is the message and design?
  3. URGENCY - Why should they act now vs. later?

CONVERSION INHIBITORS (-):
  4. ANXIETY - What concerns might prevent action?
  5. DISTRACTION - What elements compete for attention?

═══════════════════════════════════════════════════════════════════════════════
STEVE KRUG'S USABILITY PRINCIPLES
═══════════════════════════════════════════════════════════════════════════════

From "Don't Make Me Think" - fundamental principles for web usability.

KRUG'S FIRST LAW: "Don't make me think!"
KRUG'S SECOND LAW: "Clicks should be mindless and unambiguous."

KEY PRINCIPLES:
  1. CREATE VISUAL HIERARCHY
  2. TAKE ADVANTAGE OF CONVENTIONS
  3. BREAK PAGES INTO CLEARLY DEFINED AREAS
  4. MAKE IT OBVIOUS WHAT'S CLICKABLE
  5. MINIMIZE NOISE
  6. MAKE CONTENT SCANNABLE

METHODOLOGY_EOF
}

# ═══════════════════════════════════════════════════════════════════════════════
# UTILITY FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

print_header() {
    clear
    echo ""
    echo -e "${BOLD}${BLUE}╔══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${BLUE}║              LANDING PAGE SCORER - 100-POINT SCORING SYSTEM                  ║${NC}"
    echo -e "${BOLD}${BLUE}║   ${WHITE}Maria Veloso's SQ${BLUE}  |  ${WHITE}LIFT Model${BLUE}  |  ${WHITE}Krug's Usability Principles${BLUE}           ║${NC}"
    echo -e "${BOLD}${BLUE}╚══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_section_header() {
    local number=$1
    local title=$2
    local max_points=$3
    echo ""
    echo -e "${BOLD}${MAGENTA}╔══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${MAGENTA}║  SECTION $number: $title${NC}"
    echo -e "${BOLD}${MAGENTA}║  ${DIM}Maximum Points: $max_points${NC}"
    echo -e "${BOLD}${MAGENTA}╚══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_subsection() {
    local title=$1
    local points=$2
    echo ""
    echo -e "  ${BOLD}${CYAN}━━━ $title ${DIM}(0-$points points)${NC} ${BOLD}${CYAN}━━━${NC}"
    echo ""
}

print_criteria() {
    local criteria=$1
    echo -e "  ${DIM}→${NC} $criteria"
}

print_divider() {
    echo -e "${DIM}──────────────────────────────────────────────────────────────────────────────${NC}"
}

score_bar() {
    local score=$1
    local max=$2
    local percentage=$((score * 100 / max))
    local filled=$((percentage / 5))
    local empty=$((20 - filled))

    local color=$RED
    if [ $percentage -ge 80 ]; then
        color=$GREEN
    elif [ $percentage -ge 60 ]; then
        color=$YELLOW
    fi

    printf "  ${color}["
    for ((i=0; i<filled; i++)); do printf "█"; done
    for ((i=0; i<empty; i++)); do printf "░"; done
    printf "]${NC} %d/%d points (%d%%)\n" "$score" "$max" "$percentage"
}

get_score() {
    local prompt=$1
    local max=$2
    local score=0

    while true; do
        echo -ne "  ${YELLOW}?${NC} $prompt ${DIM}(0-$max):${NC} "
        read -r input
        if [[ -z "$input" ]]; then
            echo -e "  ${RED}Please enter a number between 0 and $max${NC}"
            continue
        fi
        if [[ "$input" =~ ^[0-9]+$ ]]; then
            if [ "$input" -ge 0 ] && [ "$input" -le "$max" ]; then
                score=$input
                break
            fi
        fi
        echo -e "  ${RED}Please enter a valid number between 0 and $max${NC}"
    done
    echo "$score"
}

display_subsection_score() {
    local name=$1
    local score=$2
    local max=$3
    echo ""
    echo -e "  ${BOLD}$name Score:${NC}"
    score_bar "$score" "$max"
    local percentage=$((score * 100 / max))
    if [ $percentage -ge 80 ]; then
        echo -e "  ${GREEN}Excellent! This area is strong.${NC}"
    elif [ $percentage -ge 60 ]; then
        echo -e "  ${YELLOW}Good, but room for improvement.${NC}"
    elif [ $percentage -ge 40 ]; then
        echo -e "  ${YELLOW}Needs attention - prioritize improvements here.${NC}"
    else
        echo -e "  ${RED}Critical area - address before launch.${NC}"
    fi
}

# ═══════════════════════════════════════════════════════════════════════════════
# SECTION 1: FIRST IMPRESSION (20 Points)
# ═══════════════════════════════════════════════════════════════════════════════

score_first_impression() {
    print_section_header "1" "FIRST IMPRESSION" "20"
    local section_total=0

    print_subsection "Headline Clarity and Benefit" "8"
    echo "    Score 7-8: Headline immediately communicates primary benefit"
    echo "    Score 4-6: Benefit present but could be stronger"
    echo "    Score 1-3: Vague or feature-focused headline"
    echo "    Score 0: No headline or completely unclear"
    echo ""
    local headline_score=$(get_score "Headline clarity and benefit score" 8)
    SUBSECTION_SCORES["headline"]=$headline_score
    section_total=$((section_total + headline_score))
    display_subsection_score "Headline" "$headline_score" 8

    print_subsection "Value Proposition Visible in 5 Seconds" "6"
    echo "    Score 5-6: Value prop above fold, immediately visible"
    echo "    Score 3-4: Visible but not prominently placed"
    echo "    Score 1-2: Buried below the fold"
    echo "    Score 0: No clear value proposition"
    echo ""
    local value_prop_score=$(get_score "Value proposition visibility score" 6)
    SUBSECTION_SCORES["value_prop"]=$value_prop_score
    section_total=$((section_total + value_prop_score))
    display_subsection_score "Value Proposition Visibility" "$value_prop_score" 6

    print_subsection "Message Match to Traffic Source" "6"
    echo "    Score 5-6: Headline matches ad/email/link copy perfectly"
    echo "    Score 3-4: General topic matches but language differs"
    echo "    Score 1-2: Weak connection to traffic source"
    echo "    Score 0: Complete disconnect from traffic source"
    echo ""
    local message_match_score=$(get_score "Message match score" 6)
    SUBSECTION_SCORES["message_match"]=$message_match_score
    section_total=$((section_total + message_match_score))
    display_subsection_score "Message Match" "$message_match_score" 6

    SECTION_SCORES["first_impression"]=$section_total
    TOTAL_SCORE=$((TOTAL_SCORE + section_total))
    echo ""
    print_divider
    echo -e "${BOLD}${MAGENTA}SECTION 1 TOTAL:${NC}"
    score_bar "$section_total" 20
}

# ═══════════════════════════════════════════════════════════════════════════════
# SECTION 2: LIFT MODEL FACTORS (30 Points)
# ═══════════════════════════════════════════════════════════════════════════════

score_lift_model() {
    print_section_header "2" "LIFT MODEL FACTORS" "30"
    local section_total=0

    print_subsection "Relevance to Audience" "6"
    echo "    Score 5-6: Content directly addresses target audience"
    echo "    Score 3-4: Generally relevant but could be more targeted"
    echo "    Score 1-2: Content feels generic or mass-market"
    echo "    Score 0: Complete mismatch between content and audience"
    echo ""
    local relevance_score=$(get_score "Relevance to audience score" 6)
    SUBSECTION_SCORES["relevance"]=$relevance_score
    section_total=$((section_total + relevance_score))
    display_subsection_score "Relevance" "$relevance_score" 6

    print_subsection "Clarity of Message and Design" "6"
    echo "    Score 5-6: Message understood in seconds, clear hierarchy"
    echo "    Score 3-4: Understandable but requires some effort"
    echo "    Score 1-2: Visitors need to think to understand"
    echo "    Score 0: Message is confusing or contradictory"
    echo ""
    local clarity_score=$(get_score "Clarity of message and design score" 6)
    SUBSECTION_SCORES["clarity"]=$clarity_score
    section_total=$((section_total + clarity_score))
    display_subsection_score "Clarity" "$clarity_score" 6

    print_subsection "Urgency to Act" "6"
    echo "    Score 5-6: Clear, credible reason to act immediately"
    echo "    Score 3-4: Some urgency elements present"
    echo "    Score 1-2: Weak or generic urgency"
    echo "    Score 0: No urgency whatsoever"
    echo ""
    local urgency_score=$(get_score "Urgency to act score" 6)
    SUBSECTION_SCORES["urgency"]=$urgency_score
    section_total=$((section_total + urgency_score))
    display_subsection_score "Urgency" "$urgency_score" 6

    print_subsection "Anxiety Reduction" "6"
    echo "    Score 5-6: Major objections proactively addressed"
    echo "    Score 3-4: Some trust signals present"
    echo "    Score 1-2: Limited trust signals"
    echo "    Score 0: No trust signals present"
    echo ""
    local anxiety_score=$(get_score "Anxiety reduction score" 6)
    SUBSECTION_SCORES["anxiety"]=$anxiety_score
    section_total=$((section_total + anxiety_score))
    display_subsection_score "Anxiety Reduction" "$anxiety_score" 6

    print_subsection "Distraction Minimization" "6"
    echo "    Score 5-6: Single focused goal, no competing elements"
    echo "    Score 3-4: Clear primary goal but some competing elements"
    echo "    Score 1-2: Multiple competing CTAs or offers"
    echo "    Score 0: Cluttered page with many competing elements"
    echo ""
    local distraction_score=$(get_score "Distraction minimization score" 6)
    SUBSECTION_SCORES["distraction"]=$distraction_score
    section_total=$((section_total + distraction_score))
    display_subsection_score "Distraction Minimization" "$distraction_score" 6

    SECTION_SCORES["lift_model"]=$section_total
    TOTAL_SCORE=$((TOTAL_SCORE + section_total))
    echo ""
    print_divider
    echo -e "${BOLD}${MAGENTA}SECTION 2 TOTAL:${NC}"
    score_bar "$section_total" 30
}

# ═══════════════════════════════════════════════════════════════════════════════
# SECTION 3: TRUST & CREDIBILITY (15 Points)
# ═══════════════════════════════════════════════════════════════════════════════

score_trust_credibility() {
    print_section_header "3" "TRUST & CREDIBILITY" "15"
    local section_total=0

    print_subsection "Social Proof Present" "5"
    echo "    Score 5: Multiple types of social proof (testimonials, numbers, logos)"
    echo "    Score 3-4: Some social proof present"
    echo "    Score 1-2: Minimal social proof"
    echo "    Score 0: No social proof whatsoever"
    echo ""
    local social_proof_score=$(get_score "Social proof score" 5)
    SUBSECTION_SCORES["social_proof"]=$social_proof_score
    section_total=$((section_total + social_proof_score))
    display_subsection_score "Social Proof" "$social_proof_score" 5

    print_subsection "Credibility Indicators" "5"
    echo "    Score 5: Relevant credentials prominently displayed"
    echo "    Score 3-4: Some credentials present"
    echo "    Score 1-2: Few credibility indicators"
    echo "    Score 0: No credibility indicators"
    echo ""
    local credibility_score=$(get_score "Credibility indicators score" 5)
    SUBSECTION_SCORES["credibility"]=$credibility_score
    section_total=$((section_total + credibility_score))
    display_subsection_score "Credibility Indicators" "$credibility_score" 5

    print_subsection "Guarantee/Risk Reversal" "5"
    echo "    Score 5: Strong, specific guarantee prominently displayed"
    echo "    Score 3-4: Guarantee present but not prominent"
    echo "    Score 1-2: Weak guarantee or hard to find"
    echo "    Score 0: No guarantee offered"
    echo ""
    local guarantee_score=$(get_score "Guarantee/risk reversal score" 5)
    SUBSECTION_SCORES["guarantee"]=$guarantee_score
    section_total=$((section_total + guarantee_score))
    display_subsection_score "Guarantee/Risk Reversal" "$guarantee_score" 5

    SECTION_SCORES["trust_credibility"]=$section_total
    TOTAL_SCORE=$((TOTAL_SCORE + section_total))
    echo ""
    print_divider
    echo -e "${BOLD}${MAGENTA}SECTION 3 TOTAL:${NC}"
    score_bar "$section_total" 15
}

# ═══════════════════════════════════════════════════════════════════════════════
# SECTION 4: CTA EFFECTIVENESS (15 Points)
# ═══════════════════════════════════════════════════════════════════════════════

score_cta_effectiveness() {
    print_section_header "4" "CTA EFFECTIVENESS" "15"
    local section_total=0

    print_subsection "Single Focused Action" "5"
    echo "    Score 5: Single, clear primary CTA"
    echo "    Score 3-4: Clear primary CTA with subordinate secondary options"
    echo "    Score 1-2: Multiple competing CTAs"
    echo "    Score 0: No clear primary CTA"
    echo ""
    local single_focus_score=$(get_score "Single focused action score" 5)
    SUBSECTION_SCORES["single_focus"]=$single_focus_score
    section_total=$((section_total + single_focus_score))
    display_subsection_score "Single Focused Action" "$single_focus_score" 5

    print_subsection "Action-Oriented Copy" "5"
    echo "    Score 5: Strong action verb with benefit (e.g., 'Get My Free Guide')"
    echo "    Score 3-4: Action verb present but generic"
    echo "    Score 1-2: Weak or passive language"
    echo "    Score 0: No action verb or confusing"
    echo ""
    local action_copy_score=$(get_score "Action-oriented copy score" 5)
    SUBSECTION_SCORES["action_copy"]=$action_copy_score
    section_total=$((section_total + action_copy_score))
    display_subsection_score "Action-Oriented Copy" "$action_copy_score" 5

    print_subsection "Visual Prominence" "5"
    echo "    Score 5: CTA is most visually prominent element"
    echo "    Score 3-4: CTA visible but not dominant"
    echo "    Score 1-2: CTA blends in with other elements"
    echo "    Score 0: CTA hard to find"
    echo ""
    local visual_prominence_score=$(get_score "Visual prominence score" 5)
    SUBSECTION_SCORES["visual_prominence"]=$visual_prominence_score
    section_total=$((section_total + visual_prominence_score))
    display_subsection_score "Visual Prominence" "$visual_prominence_score" 5

    SECTION_SCORES["cta_effectiveness"]=$section_total
    TOTAL_SCORE=$((TOTAL_SCORE + section_total))
    echo ""
    print_divider
    echo -e "${BOLD}${MAGENTA}SECTION 4 TOTAL:${NC}"
    score_bar "$section_total" 15
}

# ═══════════════════════════════════════════════════════════════════════════════
# SECTION 5: USABILITY (10 Points)
# ═══════════════════════════════════════════════════════════════════════════════

score_usability() {
    print_section_header "5" "USABILITY" "10"
    local section_total=0

    print_subsection "Krug's Laws Compliance" "5"
    echo "    Score 5: Page is instantly understandable, no cognitive load"
    echo "    Score 3-4: Generally easy to understand"
    echo "    Score 1-2: Page requires thinking to navigate"
    echo "    Score 0: Page is actively confusing"
    echo ""
    local krug_score=$(get_score "Krug's laws compliance score" 5)
    SUBSECTION_SCORES["krug_laws"]=$krug_score
    section_total=$((section_total + krug_score))
    display_subsection_score "Krug's Laws" "$krug_score" 5

    print_subsection "Scannable Formatting" "5"
    echo "    Score 5: Clear hierarchy, short paragraphs, bulleted lists"
    echo "    Score 3-4: Generally scannable"
    echo "    Score 1-2: Walls of text, few visual breaks"
    echo "    Score 0: Impossible to scan"
    echo ""
    local scannable_score=$(get_score "Scannable formatting score" 5)
    SUBSECTION_SCORES["scannable"]=$scannable_score
    section_total=$((section_total + scannable_score))
    display_subsection_score "Scannable Formatting" "$scannable_score" 5

    SECTION_SCORES["usability"]=$section_total
    TOTAL_SCORE=$((TOTAL_SCORE + section_total))
    echo ""
    print_divider
    echo -e "${BOLD}${MAGENTA}SECTION 5 TOTAL:${NC}"
    score_bar "$section_total" 10
}

# ═══════════════════════════════════════════════════════════════════════════════
# SECTION 6: TECHNICAL (10 Points)
# ═══════════════════════════════════════════════════════════════════════════════

score_technical() {
    print_section_header "6" "TECHNICAL" "10"
    local section_total=0

    print_subsection "Form Optimization" "5"
    echo "    Score 5: Minimal fields, smart defaults, clear validation"
    echo "    Score 3-4: Reasonable number of fields"
    echo "    Score 1-2: Too many required fields"
    echo "    Score 0: Form is broken or has major issues"
    echo ""
    local form_score=$(get_score "Form optimization score" 5)
    SUBSECTION_SCORES["form"]=$form_score
    section_total=$((section_total + form_score))
    display_subsection_score "Form Optimization" "$form_score" 5

    print_subsection "Mobile Considerations" "5"
    echo "    Score 5: Fully responsive, touch-friendly, fast load"
    echo "    Score 3-4: Mobile responsive but not optimized"
    echo "    Score 1-2: Mobile experience is poor"
    echo "    Score 0: Page doesn't work on mobile"
    echo ""
    local mobile_score=$(get_score "Mobile considerations score" 5)
    SUBSECTION_SCORES["mobile"]=$mobile_score
    section_total=$((section_total + mobile_score))
    display_subsection_score "Mobile Considerations" "$mobile_score" 5

    SECTION_SCORES["technical"]=$section_total
    TOTAL_SCORE=$((TOTAL_SCORE + section_total))
    echo ""
    print_divider
    echo -e "${BOLD}${MAGENTA}SECTION 6 TOTAL:${NC}"
    score_bar "$section_total" 10
}

# ═══════════════════════════════════════════════════════════════════════════════
# FINAL RESULTS
# ═══════════════════════════════════════════════════════════════════════════════

display_final_results() {
    echo ""
    echo -e "${BOLD}${BLUE}╔══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${BLUE}║                           FINAL SCORING RESULTS                              ║${NC}"
    echo -e "${BOLD}${BLUE}╚══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo ""

    echo -e "${BOLD}SECTION BREAKDOWN:${NC}"
    echo ""
    echo -e "  1. First Impression:     "; score_bar "${SECTION_SCORES["first_impression"]}" 20
    echo -e "  2. LIFT Model Factors:   "; score_bar "${SECTION_SCORES["lift_model"]}" 30
    echo -e "  3. Trust & Credibility:  "; score_bar "${SECTION_SCORES["trust_credibility"]}" 15
    echo -e "  4. CTA Effectiveness:    "; score_bar "${SECTION_SCORES["cta_effectiveness"]}" 15
    echo -e "  5. Usability:            "; score_bar "${SECTION_SCORES["usability"]}" 10
    echo -e "  6. Technical:            "; score_bar "${SECTION_SCORES["technical"]}" 10

    echo ""
    print_divider
    echo ""

    local grade="" grade_color=$RED grade_description="" recommendation=""

    if [ $TOTAL_SCORE -ge 90 ]; then
        grade="EXCELLENT"; grade_color=$GREEN
        grade_description="Ready for high-traffic campaigns"
        recommendation="Your landing page is well-optimized. Consider A/B testing variations."
    elif [ $TOTAL_SCORE -ge 75 ]; then
        grade="GOOD"; grade_color=$GREEN
        grade_description="Minor optimizations recommended"
        recommendation="Solid foundation. Focus on your lowest-scoring sections for quick wins."
    elif [ $TOTAL_SCORE -ge 60 ]; then
        grade="NEEDS WORK"; grade_color=$YELLOW
        grade_description="Address key issues before scaling"
        recommendation="Several areas need attention before scaling traffic."
    else
        grade="MAJOR ISSUES"; grade_color=$RED
        grade_description="Significant revision required"
        recommendation="This page needs significant work before it's ready for traffic."
    fi

    echo -e "${BOLD}${WHITE}FINAL SCORE:${NC}"
    echo ""
    echo -e "     ${BOLD}${grade_color}╔══════════════════════════════════════════╗${NC}"
    printf "     ${BOLD}${grade_color}║           %3d / 100 POINTS               ║${NC}\n" "$TOTAL_SCORE"
    printf "     ${BOLD}${grade_color}║             %-12s                 ║${NC}\n" "$grade"
    echo -e "     ${BOLD}${grade_color}╚══════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${DIM}$grade_description${NC}"
    echo ""

    echo -e "${BOLD}Score Visualization:${NC}"
    score_bar "$TOTAL_SCORE" 100
    echo ""

    print_divider
    echo ""
    echo -e "${BOLD}GRADING SCALE:${NC}"
    echo ""
    [ $TOTAL_SCORE -ge 90 ] && echo -e "  ${GREEN}>>> 90-100: EXCELLENT${NC}" || echo -e "  ${DIM}    90-100: Excellent${NC}"
    [ $TOTAL_SCORE -ge 75 ] && [ $TOTAL_SCORE -lt 90 ] && echo -e "  ${GREEN}>>>  75-89: GOOD${NC}" || echo -e "  ${DIM}     75-89: Good${NC}"
    [ $TOTAL_SCORE -ge 60 ] && [ $TOTAL_SCORE -lt 75 ] && echo -e "  ${YELLOW}>>>  60-74: NEEDS WORK${NC}" || echo -e "  ${DIM}     60-74: Needs Work${NC}"
    [ $TOTAL_SCORE -lt 60 ] && echo -e "  ${RED}>>> Below 60: MAJOR ISSUES${NC}" || echo -e "  ${DIM}  Below 60: Major Issues${NC}"
    echo ""

    print_divider
    echo ""
    echo -e "${BOLD}${CYAN}RECOMMENDATION:${NC}"
    echo ""
    echo "$recommendation"
    echo ""

    echo -e "${BOLD}${CYAN}RECOMMENDED RESOURCES:${NC}"
    echo ""
    echo "  BOOKS:"
    echo "    - \"Web Copy That Sells\" by Maria Veloso"
    echo "    - \"Don't Make Me Think\" by Steve Krug"
    echo "    - \"Landing Page Optimization\" by Tim Ash"
    echo ""
}

# ═══════════════════════════════════════════════════════════════════════════════
# EXPORT FUNCTION
# ═══════════════════════════════════════════════════════════════════════════════

export_results() {
    local filename=$1
    {
        echo "# Landing Page Score Report"
        echo "Generated: $(date)"
        echo ""
        echo "## Final Score: $TOTAL_SCORE/100"
        echo ""
        local grade=""
        [ $TOTAL_SCORE -ge 90 ] && grade="EXCELLENT"
        [ $TOTAL_SCORE -ge 75 ] && [ $TOTAL_SCORE -lt 90 ] && grade="GOOD"
        [ $TOTAL_SCORE -ge 60 ] && [ $TOTAL_SCORE -lt 75 ] && grade="NEEDS WORK"
        [ $TOTAL_SCORE -lt 60 ] && grade="MAJOR ISSUES"
        echo "**Grade:** $grade"
        echo ""
        echo "## Section Breakdown"
        echo "| Section | Score | Max |"
        echo "|---------|-------|-----|"
        echo "| First Impression | ${SECTION_SCORES["first_impression"]} | 20 |"
        echo "| LIFT Model Factors | ${SECTION_SCORES["lift_model"]} | 30 |"
        echo "| Trust & Credibility | ${SECTION_SCORES["trust_credibility"]} | 15 |"
        echo "| CTA Effectiveness | ${SECTION_SCORES["cta_effectiveness"]} | 15 |"
        echo "| Usability | ${SECTION_SCORES["usability"]} | 10 |"
        echo "| Technical | ${SECTION_SCORES["technical"]} | 10 |"
        echo ""
        echo "---"
        echo "*Methodology: Maria Veloso's SQ, LIFT Model, Krug's Usability Principles*"
    } > "$filename"
    echo -e "${GREEN}Results exported to: $filename${NC}"
}

# ═══════════════════════════════════════════════════════════════════════════════
# QUICK MODE
# ═══════════════════════════════════════════════════════════════════════════════

quick_mode() {
    print_header
    echo -e "${BOLD}QUICK SCORING MODE${NC}"
    echo "Rate each category on the scale indicated."
    echo ""
    print_divider

    echo -e "\n${BOLD}${CYAN}SECTION 1: FIRST IMPRESSION (0-20)${NC}"
    local s1_headline=$(get_score "Headline clarity/benefit" 8)
    local s1_value=$(get_score "Value prop in 5 seconds" 6)
    local s1_match=$(get_score "Message match" 6)
    SECTION_SCORES["first_impression"]=$((s1_headline + s1_value + s1_match))
    SUBSECTION_SCORES["headline"]=$s1_headline
    SUBSECTION_SCORES["value_prop"]=$s1_value
    SUBSECTION_SCORES["message_match"]=$s1_match

    echo -e "\n${BOLD}${CYAN}SECTION 2: LIFT MODEL (0-30)${NC}"
    local s2_relevance=$(get_score "Relevance" 6)
    local s2_clarity=$(get_score "Clarity" 6)
    local s2_urgency=$(get_score "Urgency" 6)
    local s2_anxiety=$(get_score "Anxiety reduction" 6)
    local s2_distraction=$(get_score "Distraction minimization" 6)
    SECTION_SCORES["lift_model"]=$((s2_relevance + s2_clarity + s2_urgency + s2_anxiety + s2_distraction))
    SUBSECTION_SCORES["relevance"]=$s2_relevance
    SUBSECTION_SCORES["clarity"]=$s2_clarity
    SUBSECTION_SCORES["urgency"]=$s2_urgency
    SUBSECTION_SCORES["anxiety"]=$s2_anxiety
    SUBSECTION_SCORES["distraction"]=$s2_distraction

    echo -e "\n${BOLD}${CYAN}SECTION 3: TRUST (0-15)${NC}"
    local s3_social=$(get_score "Social proof" 5)
    local s3_cred=$(get_score "Credibility" 5)
    local s3_guarantee=$(get_score "Guarantee" 5)
    SECTION_SCORES["trust_credibility"]=$((s3_social + s3_cred + s3_guarantee))
    SUBSECTION_SCORES["social_proof"]=$s3_social
    SUBSECTION_SCORES["credibility"]=$s3_cred
    SUBSECTION_SCORES["guarantee"]=$s3_guarantee

    echo -e "\n${BOLD}${CYAN}SECTION 4: CTA (0-15)${NC}"
    local s4_focus=$(get_score "Single focus" 5)
    local s4_action=$(get_score "Action copy" 5)
    local s4_visual=$(get_score "Visual prominence" 5)
    SECTION_SCORES["cta_effectiveness"]=$((s4_focus + s4_action + s4_visual))
    SUBSECTION_SCORES["single_focus"]=$s4_focus
    SUBSECTION_SCORES["action_copy"]=$s4_action
    SUBSECTION_SCORES["visual_prominence"]=$s4_visual

    echo -e "\n${BOLD}${CYAN}SECTION 5: USABILITY (0-10)${NC}"
    local s5_krug=$(get_score "Krug's Laws" 5)
    local s5_scan=$(get_score "Scannable" 5)
    SECTION_SCORES["usability"]=$((s5_krug + s5_scan))
    SUBSECTION_SCORES["krug_laws"]=$s5_krug
    SUBSECTION_SCORES["scannable"]=$s5_scan

    echo -e "\n${BOLD}${CYAN}SECTION 6: TECHNICAL (0-10)${NC}"
    local s6_form=$(get_score "Form optimization" 5)
    local s6_mobile=$(get_score "Mobile" 5)
    SECTION_SCORES["technical"]=$((s6_form + s6_mobile))
    SUBSECTION_SCORES["form"]=$s6_form
    SUBSECTION_SCORES["mobile"]=$s6_mobile

    TOTAL_SCORE=$((${SECTION_SCORES["first_impression"]} + ${SECTION_SCORES["lift_model"]} + ${SECTION_SCORES["trust_credibility"]} + ${SECTION_SCORES["cta_effectiveness"]} + ${SECTION_SCORES["usability"]} + ${SECTION_SCORES["technical"]}))

    display_final_results
}

# ═══════════════════════════════════════════════════════════════════════════════
# MAIN EXECUTION
# ═══════════════════════════════════════════════════════════════════════════════

main() {
    QUICK_MODE=false

    while [[ $# -gt 0 ]]; do
        case $1 in
            --help|-h) show_usage; exit 0 ;;
            --methodology|-m) show_methodology; exit 0 ;;
            --export|-e) EXPORT_FILE="$2"; shift 2 ;;
            --quick|-q) QUICK_MODE=true; shift ;;
            *) echo "Unknown option: $1"; exit 1 ;;
        esac
    done

    if [ "$QUICK_MODE" = true ]; then
        quick_mode
    else
        print_header
        echo -e "${BOLD}Welcome to the Landing Page Scorer!${NC}"
        echo ""
        echo "This tool evaluates your landing page using a 100-point scoring system."
        echo ""
        echo -e "${YELLOW}TIP: Have your landing page open while scoring.${NC}"
        echo ""
        echo -e "${DIM}Press Enter to begin...${NC}"
        read -r

        score_first_impression
        echo -e "\n${DIM}Press Enter to continue...${NC}"; read -r
        score_lift_model
        echo -e "\n${DIM}Press Enter to continue...${NC}"; read -r
        score_trust_credibility
        echo -e "\n${DIM}Press Enter to continue...${NC}"; read -r
        score_cta_effectiveness
        echo -e "\n${DIM}Press Enter to continue...${NC}"; read -r
        score_usability
        echo -e "\n${DIM}Press Enter to continue...${NC}"; read -r
        score_technical
        echo -e "\n${DIM}Press Enter for final results...${NC}"; read -r

        display_final_results
    fi

    [ -n "$EXPORT_FILE" ] && export_results "$EXPORT_FILE"
}

main "$@"
