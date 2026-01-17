#!/bin/bash
# Copy Checklist - 10-Section Audit for Professional Copywriting
# Usage: copy-checklist.sh [--interactive] [--export filename]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m' # No Color

# Parse arguments
INTERACTIVE=false
EXPORT_FILE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --interactive|-i)
            INTERACTIVE=true
            shift
            ;;
        --export|-e)
            EXPORT_FILE="$2"
            shift 2
            ;;
        --help|-h)
            echo ""
            echo "Copy Checklist - 10-Section Audit for Professional Copywriting"
            echo ""
            echo "Usage: copy-checklist.sh [options]"
            echo ""
            echo "Options:"
            echo "  --interactive, -i    Interactive mode (answer each question)"
            echo "  --export, -e FILE    Export checklist to file"
            echo "  --help, -h           Show this help message"
            echo ""
            echo "Examples:"
            echo "  copy-checklist.sh                    # Display full checklist"
            echo "  copy-checklist.sh --interactive      # Interactive audit mode"
            echo "  copy-checklist.sh --export audit.md  # Export to markdown file"
            echo ""
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

print_header() {
    echo ""
    echo -e "${BOLD}${BLUE}╔══════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${BLUE}║          PROFESSIONAL COPY CHECKLIST - 10-SECTION AUDIT                  ║${NC}"
    echo -e "${BOLD}${BLUE}║                    100+ Point Quality Assessment                         ║${NC}"
    echo -e "${BOLD}${BLUE}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_section_header() {
    local number=$1
    local title=$2
    local points=$3
    echo ""
    echo -e "${BOLD}${MAGENTA}┌──────────────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${BOLD}${MAGENTA}│  SECTION $number: $title ${NC}"
    echo -e "${BOLD}${MAGENTA}│  ${DIM}($points points possible)${NC}"
    echo -e "${BOLD}${MAGENTA}└──────────────────────────────────────────────────────────────────────────┘${NC}"
}

print_check_item() {
    local category=$1
    local item=$2
    echo -e "  ${CYAN}□${NC} ${BOLD}$category:${NC} $item"
}

print_sub_item() {
    local item=$1
    echo -e "      ${DIM}→${NC} $item"
}

# Function for interactive mode
interactive_check() {
    local question=$1
    if [ "$INTERACTIVE" = true ]; then
        echo -ne "  ${YELLOW}?${NC} $question ${DIM}(y/n/s):${NC} "
        read -r answer
        case $answer in
            y|Y) echo -e "  ${GREEN}✓${NC} Confirmed" && return 0 ;;
            n|N) echo -e "  ${RED}✗${NC} Needs work" && return 1 ;;
            s|S) echo -e "  ${YELLOW}○${NC} Skipped" && return 2 ;;
            *) echo -e "  ${DIM}○${NC} Skipped" && return 2 ;;
        esac
    fi
}

generate_checklist() {
    print_header

    if [ "$INTERACTIVE" = true ]; then
        echo -e "${YELLOW}Interactive Mode:${NC} Answer each question with:"
        echo "  y = Yes (confirmed/complete)"
        echo "  n = No (needs work)"
        echo "  s = Skip"
        echo ""
    fi

    # ═══════════════════════════════════════════════════════════════════════════
    # SECTION 1: STRATEGIC FOUNDATION (15 points)
    # ═══════════════════════════════════════════════════════════════════════════
    print_section_header "1" "STRATEGIC FOUNDATION" "15 points"
    echo ""
    echo -e "  ${BOLD}${CYAN}Target Audience Definition${NC}"
    print_check_item "Avatar" "Specific demographic profile defined"
    print_sub_item "Age, gender, income, location, occupation"
    print_check_item "Psychographics" "Values, beliefs, aspirations identified"
    print_sub_item "What do they believe about themselves and the world?"
    print_check_item "Pain Points" "Top 3-5 problems/frustrations documented"
    print_sub_item "What keeps them up at night?"
    print_check_item "Desires" "Top 3-5 goals/dreams identified"
    print_sub_item "What does their ideal outcome look like?"
    print_check_item "Language" "Voice of customer research completed"
    print_sub_item "Using exact words/phrases from target audience"
    echo ""
    echo -e "  ${BOLD}${CYAN}Offer Clarity${NC}"
    print_check_item "Core Offer" "Single, clear offer defined"
    print_check_item "Transformation" "Before/after state articulated"
    print_check_item "Mechanism" "Unique mechanism or method explained"
    print_check_item "Differentiation" "Why this vs. alternatives clear"
    print_check_item "Risk Reversal" "Guarantee or safety net defined"

    # ═══════════════════════════════════════════════════════════════════════════
    # SECTION 2: HEADLINE (15 points)
    # ═══════════════════════════════════════════════════════════════════════════
    print_section_header "2" "HEADLINE" "15 points"
    echo ""
    echo -e "  ${BOLD}${CYAN}The 4 U's Framework${NC}"
    print_check_item "Useful" "Promises clear benefit to reader"
    print_check_item "Urgent" "Creates reason to act now"
    print_check_item "Unique" "Differentiates from competition"
    print_check_item "Ultra-Specific" "Includes numbers, timeframes, or specifics"
    echo ""
    echo -e "  ${BOLD}${CYAN}Technical Elements${NC}"
    print_check_item "Length" "6-12 words (optimal for comprehension)"
    print_check_item "Power Words" "Contains emotional trigger words"
    print_check_item "Clarity" "Understood in 3 seconds or less"
    print_check_item "Curiosity" "Creates information gap"
    print_check_item "Congruence" "Matches the body copy promise"
    echo ""
    echo -e "  ${BOLD}${CYAN}Headline Formulas (choose one)${NC}"
    print_check_item "How To" "\"How to [achieve desired result] without [pain point]\""
    print_check_item "Number List" "\"X Ways/Secrets/Steps to [outcome]\""
    print_check_item "Question" "\"Are You Making These [X] Mistakes?\""
    print_check_item "Command" "\"Stop [pain point] and Start [benefit]\""
    print_check_item "News" "\"Announcing/Introducing/New [breakthrough]\""

    # ═══════════════════════════════════════════════════════════════════════════
    # SECTION 3: LEAD/OPENING (10 points)
    # ═══════════════════════════════════════════════════════════════════════════
    print_section_header "3" "LEAD/OPENING" "10 points"
    echo ""
    echo -e "  ${BOLD}${CYAN}Hook Quality${NC}"
    print_check_item "Attention" "First sentence demands attention"
    print_check_item "Relevance" "Immediately relevant to target audience"
    print_check_item "Promise" "Hints at valuable payoff for reading"
    print_check_item "Momentum" "Creates pull to keep reading"
    echo ""
    echo -e "  ${BOLD}${CYAN}Lead Types (choose appropriate)${NC}"
    print_check_item "Problem-Agitation" "Opens with pain point, amplifies it"
    print_check_item "Story" "Opens with engaging narrative"
    print_check_item "Question" "Opens with provocative question"
    print_check_item "Bold Claim" "Opens with surprising statement"
    print_check_item "Fascination" "Opens with curiosity-driven bullets"
    print_check_item "Direct" "Opens with straight offer (for warm audiences)"

    # ═══════════════════════════════════════════════════════════════════════════
    # SECTION 4: BODY COPY (15 points)
    # ═══════════════════════════════════════════════════════════════════════════
    print_section_header "4" "BODY COPY" "15 points"
    echo ""
    echo -e "  ${BOLD}${CYAN}Structure${NC}"
    print_check_item "Logical Flow" "Clear progression from problem to solution"
    print_check_item "Subheadings" "Scannable with compelling subheads"
    print_check_item "Short Paragraphs" "2-4 sentences max per paragraph"
    print_check_item "Varied Length" "Mix of short and medium sentences"
    print_check_item "White Space" "Adequate breathing room"
    echo ""
    echo -e "  ${BOLD}${CYAN}Content Quality${NC}"
    print_check_item "Benefits > Features" "Focus on what it does FOR them"
    print_check_item "Specificity" "Concrete examples and details"
    print_check_item "Future Pacing" "Helps reader visualize outcome"
    print_check_item "Story Elements" "Narrative woven throughout"
    print_check_item "Bucket Brigades" "Transition phrases that pull forward"
    print_sub_item "\"Here's the thing...\", \"But wait...\", \"And that's not all...\""

    # ═══════════════════════════════════════════════════════════════════════════
    # SECTION 5: PERSUASION ELEMENTS (10 points)
    # ═══════════════════════════════════════════════════════════════════════════
    print_section_header "5" "PERSUASION ELEMENTS" "10 points"
    echo ""
    echo -e "  ${BOLD}${CYAN}Cialdini's Principles${NC}"
    print_check_item "Reciprocity" "Value given before asking"
    print_check_item "Social Proof" "Others have succeeded/chosen this"
    print_check_item "Authority" "Credibility established"
    print_check_item "Liking" "Relatable, likable voice"
    print_check_item "Scarcity" "Limited time/quantity/access"
    print_check_item "Commitment" "Small yeses lead to big yes"
    echo ""
    echo -e "  ${BOLD}${CYAN}Emotional Triggers${NC}"
    print_check_item "Fear/Pain" "What they'll lose or suffer"
    print_check_item "Desire/Pleasure" "What they'll gain or enjoy"
    print_check_item "Belonging" "Part of a group or movement"
    print_check_item "Status" "How others will perceive them"

    # ═══════════════════════════════════════════════════════════════════════════
    # SECTION 6: PROOF & CREDIBILITY (10 points)
    # ═══════════════════════════════════════════════════════════════════════════
    print_section_header "6" "PROOF & CREDIBILITY" "10 points"
    echo ""
    echo -e "  ${BOLD}${CYAN}Social Proof Types${NC}"
    print_check_item "Testimonials" "Specific, results-focused testimonials"
    print_sub_item "Full names, photos, specific results"
    print_check_item "Case Studies" "Detailed success stories"
    print_check_item "Numbers" "User counts, sales figures, ratings"
    print_check_item "Logos" "Recognized brands or media mentions"
    print_check_item "Expert Endorsements" "Authority figures backing claims"
    echo ""
    echo -e "  ${BOLD}${CYAN}Credibility Builders${NC}"
    print_check_item "Credentials" "Relevant qualifications stated"
    print_check_item "Experience" "Years/projects/clients mentioned"
    print_check_item "Methodology" "Process or system explained"
    print_check_item "Transparency" "Honest about limitations"

    # ═══════════════════════════════════════════════════════════════════════════
    # SECTION 7: OBJECTION HANDLING (10 points)
    # ═══════════════════════════════════════════════════════════════════════════
    print_section_header "7" "OBJECTION HANDLING" "10 points"
    echo ""
    echo -e "  ${BOLD}${CYAN}Common Objections Addressed${NC}"
    print_check_item "Price" "Value justified vs. cost"
    print_check_item "Time" "Time investment addressed"
    print_check_item "Trust" "\"Will this work for me?\" answered"
    print_check_item "Need" "\"Do I really need this?\" answered"
    print_check_item "Urgency" "\"Why now vs. later?\" answered"
    echo ""
    echo -e "  ${BOLD}${CYAN}Risk Mitigation${NC}"
    print_check_item "Guarantee" "Strong guarantee clearly stated"
    print_check_item "FAQ" "Common questions answered"
    print_check_item "Comparison" "vs. alternatives addressed"
    print_check_item "Concerns" "Hidden concerns surfaced and resolved"

    # ═══════════════════════════════════════════════════════════════════════════
    # SECTION 8: CTA & CLOSE (10 points)
    # ═══════════════════════════════════════════════════════════════════════════
    print_section_header "8" "CTA & CLOSE" "10 points"
    echo ""
    echo -e "  ${BOLD}${CYAN}Call-to-Action Quality${NC}"
    print_check_item "Clarity" "Crystal clear next step"
    print_check_item "Action Verb" "Strong command (Get, Start, Join, Claim)"
    print_check_item "Benefit" "CTA includes benefit, not just action"
    print_sub_item "\"Get Instant Access\" vs. \"Submit\""
    print_check_item "Urgency" "Reason to act now included"
    print_check_item "Visibility" "CTA stands out visually"
    print_check_item "Repetition" "CTA appears multiple times"
    echo ""
    echo -e "  ${BOLD}${CYAN}Close Structure${NC}"
    print_check_item "Summary" "Key benefits restated"
    print_check_item "Final Push" "Last persuasion element"
    print_check_item "P.S." "P.S. with urgency or key benefit"
    print_sub_item "One of most-read parts of any copy"

    # ═══════════════════════════════════════════════════════════════════════════
    # SECTION 9: COPY MECHANICS (10 points)
    # ═══════════════════════════════════════════════════════════════════════════
    print_section_header "9" "COPY MECHANICS" "10 points"
    echo ""
    echo -e "  ${BOLD}${CYAN}Readability${NC}"
    print_check_item "Grade Level" "8th grade or below reading level"
    print_check_item "Sentence Length" "Average 15-20 words per sentence"
    print_check_item "Jargon-Free" "No unexplained technical terms"
    print_check_item "Active Voice" "Active voice predominates"
    print_check_item "Conversational" "Reads like human speech"
    echo ""
    echo -e "  ${BOLD}${CYAN}Technical Quality${NC}"
    print_check_item "Grammar" "No grammatical errors"
    print_check_item "Spelling" "No spelling mistakes"
    print_check_item "Punctuation" "Correct punctuation throughout"
    print_check_item "Formatting" "Consistent formatting"
    print_check_item "Links" "All links work correctly"

    # ═══════════════════════════════════════════════════════════════════════════
    # SECTION 10: OVERALL EFFECTIVENESS (5 points)
    # ═══════════════════════════════════════════════════════════════════════════
    print_section_header "10" "OVERALL EFFECTIVENESS" "5 points"
    echo ""
    echo -e "  ${BOLD}${CYAN}Final Assessment${NC}"
    print_check_item "Single Focus" "One offer, one audience, one action"
    print_check_item "Emotional Journey" "Takes reader from problem to solution"
    print_check_item "Congruence" "All elements support main message"
    print_check_item "Believability" "Claims are credible and supported"
    print_check_item "Momentum" "Pulls reader through to CTA"
    echo ""
    echo -e "  ${BOLD}${CYAN}The 'Mom Test'${NC}"
    print_check_item "Clarity Test" "Would your mom understand the offer?"
    print_check_item "Value Test" "Is the value obviously greater than price?"
    print_check_item "Trust Test" "Would she believe the claims?"

    # ═══════════════════════════════════════════════════════════════════════════
    # SCORING GUIDE
    # ═══════════════════════════════════════════════════════════════════════════
    echo ""
    echo -e "${BOLD}${BLUE}══════════════════════════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "${BOLD}SCORING GUIDE:${NC}"
    echo ""
    echo -e "  ${GREEN}90-100 points${NC}  →  A+ Copy: Ready to launch, expect strong results"
    echo -e "  ${GREEN}80-89 points${NC}   →  A Copy: Solid, minor refinements possible"
    echo -e "  ${YELLOW}70-79 points${NC}   →  B Copy: Good foundation, needs strengthening"
    echo -e "  ${YELLOW}60-69 points${NC}   →  C Copy: Functional but missing key elements"
    echo -e "  ${RED}50-59 points${NC}   →  D Copy: Major revisions needed"
    echo -e "  ${RED}Below 50${NC}       →  F Copy: Significant rewrite required"
    echo ""
    echo -e "${BOLD}${CYAN}Quick Tips for Each Score Level:${NC}"
    echo ""
    echo "  A+ → Test variations, don't overthink"
    echo "  A  → Look for one weak section to improve"
    echo "  B  → Focus on proof elements and objection handling"
    echo "  C  → Revisit strategic foundation and headline"
    echo "  D  → Consider hiring professional review"
    echo "  F  → Start fresh with audience research"
    echo ""
}

# Export to file if requested
if [ -n "$EXPORT_FILE" ]; then
    # Strip colors for export
    generate_checklist | sed 's/\x1b\[[0-9;]*m//g' > "$EXPORT_FILE"
    echo "Checklist exported to: $EXPORT_FILE"
else
    generate_checklist
fi
