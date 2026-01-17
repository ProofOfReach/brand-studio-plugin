#!/bin/bash
# Headline Analyzer - Scores headlines using the 4 U's framework
# Usage: headline-analyzer.sh "Your Headline Here"

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Power words that trigger emotional response
POWER_WORDS=(
    # Urgency words
    "now" "today" "immediately" "instant" "fast" "quick" "hurry" "limited" "deadline" "expires"
    "last chance" "don't miss" "act now" "before" "running out" "final"
    # Exclusivity words
    "secret" "exclusive" "insider" "private" "hidden" "unknown" "revealed" "discover"
    "confidential" "members-only" "invitation" "vip"
    # Value words
    "free" "bonus" "save" "discount" "bargain" "affordable" "cheap" "value" "deal"
    "guaranteed" "proven" "results" "benefit" "advantage" "gain"
    # Emotion words
    "amazing" "incredible" "remarkable" "extraordinary" "stunning" "powerful" "ultimate"
    "essential" "critical" "vital" "crucial" "important" "breakthrough" "revolutionary"
    # Fear/Safety words
    "warning" "danger" "risk" "mistake" "avoid" "stop" "never" "protect" "safe" "secure"
    # Curiosity words
    "why" "how" "what" "when" "who" "which" "surprising" "shocking" "unexpected" "strange"
    "weird" "little-known" "rarely" "untold"
    # Social proof words
    "everyone" "people" "experts" "research" "studies" "science" "data" "statistics"
    # Simplicity words
    "simple" "easy" "effortless" "straightforward" "step-by-step" "beginner" "guide"
    # Transformation words
    "transform" "change" "improve" "boost" "increase" "grow" "double" "triple" "maximize"
    "master" "dominate" "crush" "skyrocket"
)

# Question starters that engage readers
QUESTION_STARTERS=("why" "how" "what" "when" "who" "which" "where" "are" "is" "do" "does" "can" "will" "should" "would" "could")

print_header() {
    echo ""
    echo -e "${BOLD}${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${BLUE}║            HEADLINE ANALYZER - 100-POINT SCORING             ║${NC}"
    echo -e "${BOLD}${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_section() {
    echo -e "${BOLD}${CYAN}━━━ $1 ━━━${NC}"
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

    printf "${color}["
    for ((i=0; i<filled; i++)); do printf "█"; done
    for ((i=0; i<empty; i++)); do printf "░"; done
    printf "] %d/%d${NC}" "$score" "$max"
}

analyze_headline() {
    local headline="$1"
    local headline_lower=$(echo "$headline" | tr '[:upper:]' '[:lower:]')
    local word_count=$(echo "$headline" | wc -w | tr -d ' ')
    local char_count=${#headline}

    local total_score=0

    print_header
    echo -e "${BOLD}Analyzing:${NC} \"$headline\""
    echo -e "${BOLD}Word Count:${NC} $word_count | ${BOLD}Character Count:${NC} $char_count"
    echo ""

    # ═══════════════════════════════════════════════════════════════
    # SECTION 1: THE 4 U'S (60 points total - 15 each)
    # ═══════════════════════════════════════════════════════════════
    print_section "THE 4 U's FRAMEWORK (60 points)"
    echo ""

    # 1. USEFUL (15 points)
    local useful_score=0
    local useful_reasons=()

    # Check for benefit-oriented words
    local benefit_words=("how to" "ways to" "tips" "guide" "learn" "discover" "get" "achieve" "improve" "boost" "increase" "save" "gain" "build" "create" "master" "become" "make")
    for word in "${benefit_words[@]}"; do
        if [[ "$headline_lower" == *"$word"* ]]; then
            useful_score=$((useful_score + 5))
            useful_reasons+=("Contains benefit word: '$word'")
            break
        fi
    done

    # Check for problem-solving language
    local problem_words=("solve" "fix" "stop" "eliminate" "overcome" "beat" "avoid" "prevent" "escape" "end" "cure" "heal")
    for word in "${problem_words[@]}"; do
        if [[ "$headline_lower" == *"$word"* ]]; then
            useful_score=$((useful_score + 5))
            useful_reasons+=("Addresses a problem: '$word'")
            break
        fi
    done

    # Check for outcome/result language
    local outcome_words=("results" "outcome" "success" "winning" "profit" "growth" "revenue" "leads" "sales" "customers" "clients" "subscribers")
    for word in "${outcome_words[@]}"; do
        if [[ "$headline_lower" == *"$word"* ]]; then
            useful_score=$((useful_score + 5))
            useful_reasons+=("Promises outcomes: '$word'")
            break
        fi
    done

    [ $useful_score -gt 15 ] && useful_score=15
    total_score=$((total_score + useful_score))

    echo -e "${BOLD}1. USEFUL${NC} (Does it promise a benefit?)"
    echo -n "   Score: "
    score_bar $useful_score 15
    echo ""
    for reason in "${useful_reasons[@]}"; do
        echo -e "   ${GREEN}✓${NC} $reason"
    done
    [ ${#useful_reasons[@]} -eq 0 ] && echo -e "   ${RED}✗${NC} No clear benefit language detected"
    echo ""

    # 2. URGENT (15 points)
    local urgent_score=0
    local urgent_reasons=()

    # Check for time-sensitive language
    local time_words=("now" "today" "tonight" "this week" "this month" "immediately" "instant" "quick" "fast" "hurry" "deadline" "limited" "expires" "last chance" "before" "soon" "finally")
    for word in "${time_words[@]}"; do
        if [[ "$headline_lower" == *"$word"* ]]; then
            urgent_score=$((urgent_score + 8))
            urgent_reasons+=("Contains urgency word: '$word'")
            break
        fi
    done

    # Check for scarcity language
    local scarcity_words=("only" "exclusive" "rare" "few" "limited" "running out" "almost gone" "spots left" "remaining")
    for word in "${scarcity_words[@]}"; do
        if [[ "$headline_lower" == *"$word"* ]]; then
            urgent_score=$((urgent_score + 7))
            urgent_reasons+=("Creates scarcity: '$word'")
            break
        fi
    done

    [ $urgent_score -gt 15 ] && urgent_score=15
    total_score=$((total_score + urgent_score))

    echo -e "${BOLD}2. URGENT${NC} (Does it create time pressure?)"
    echo -n "   Score: "
    score_bar $urgent_score 15
    echo ""
    for reason in "${urgent_reasons[@]}"; do
        echo -e "   ${GREEN}✓${NC} $reason"
    done
    [ ${#urgent_reasons[@]} -eq 0 ] && echo -e "   ${YELLOW}○${NC} No urgency language (not always needed)"
    echo ""

    # 3. UNIQUE (15 points)
    local unique_score=0
    local unique_reasons=()

    # Check for differentiating language
    local unique_words=("only" "first" "new" "never before" "revolutionary" "breakthrough" "secret" "hidden" "unknown" "exclusive" "original" "unconventional" "counterintuitive" "surprising" "unexpected" "weird" "strange")
    for word in "${unique_words[@]}"; do
        if [[ "$headline_lower" == *"$word"* ]]; then
            unique_score=$((unique_score + 8))
            unique_reasons+=("Differentiating word: '$word'")
            break
        fi
    done

    # Check for specific methodology or approach
    local method_words=("method" "system" "formula" "framework" "strategy" "technique" "approach" "hack" "trick" "secret")
    for word in "${method_words[@]}"; do
        if [[ "$headline_lower" == *"$word"* ]]; then
            unique_score=$((unique_score + 7))
            unique_reasons+=("Implies unique method: '$word'")
            break
        fi
    done

    [ $unique_score -gt 15 ] && unique_score=15
    total_score=$((total_score + unique_score))

    echo -e "${BOLD}3. UNIQUE${NC} (Is it differentiated from competitors?)"
    echo -n "   Score: "
    score_bar $unique_score 15
    echo ""
    for reason in "${unique_reasons[@]}"; do
        echo -e "   ${GREEN}✓${NC} $reason"
    done
    [ ${#unique_reasons[@]} -eq 0 ] && echo -e "   ${RED}✗${NC} Could be more distinctive"
    echo ""

    # 4. ULTRA-SPECIFIC (15 points)
    local specific_score=0
    local specific_reasons=()

    # Check for numbers
    if [[ "$headline" =~ [0-9]+ ]]; then
        specific_score=$((specific_score + 8))
        local numbers=$(echo "$headline" | grep -oE '[0-9]+' | head -1)
        specific_reasons+=("Contains specific number: $numbers")
    fi

    # Check for percentages or statistics
    if [[ "$headline" =~ [0-9]+% ]] || [[ "$headline_lower" =~ "percent" ]]; then
        specific_score=$((specific_score + 4))
        specific_reasons+=("Contains percentage/statistic")
    fi

    # Check for time frames
    local timeframe_pattern="[0-9]+ (day|week|month|year|hour|minute|second)"
    if [[ "$headline_lower" =~ $timeframe_pattern ]]; then
        specific_score=$((specific_score + 4))
        specific_reasons+=("Contains specific timeframe")
    fi

    # Check for specific audience targeting
    local audience_words=("beginner" "expert" "entrepreneur" "marketer" "developer" "designer" "writer" "founder" "ceo" "manager" "parent" "student" "professional")
    for word in "${audience_words[@]}"; do
        if [[ "$headline_lower" == *"$word"* ]]; then
            specific_score=$((specific_score + 4))
            specific_reasons+=("Targets specific audience: '$word'")
            break
        fi
    done

    [ $specific_score -gt 15 ] && specific_score=15
    total_score=$((total_score + specific_score))

    echo -e "${BOLD}4. ULTRA-SPECIFIC${NC} (Does it include precise details?)"
    echo -n "   Score: "
    score_bar $specific_score 15
    echo ""
    for reason in "${specific_reasons[@]}"; do
        echo -e "   ${GREEN}✓${NC} $reason"
    done
    [ ${#specific_reasons[@]} -eq 0 ] && echo -e "   ${RED}✗${NC} Add numbers or specific details"
    echo ""

    # ═══════════════════════════════════════════════════════════════
    # SECTION 2: STRUCTURE & FORMAT (25 points)
    # ═══════════════════════════════════════════════════════════════
    print_section "STRUCTURE & FORMAT (25 points)"
    echo ""

    local structure_score=0
    local structure_reasons=()

    # Word count (optimal 6-12 words) - 8 points
    if [ $word_count -ge 6 ] && [ $word_count -le 12 ]; then
        structure_score=$((structure_score + 8))
        structure_reasons+=("Optimal word count (6-12 words): $word_count words")
    elif [ $word_count -ge 4 ] && [ $word_count -le 14 ]; then
        structure_score=$((structure_score + 5))
        structure_reasons+=("Acceptable word count: $word_count words (optimal: 6-12)")
    else
        structure_reasons+=("Word count outside optimal range: $word_count (aim for 6-12)")
    fi

    # Character count (optimal 50-70 for social/email) - 5 points
    if [ $char_count -ge 50 ] && [ $char_count -le 70 ]; then
        structure_score=$((structure_score + 5))
        structure_reasons+=("Ideal character length for sharing: $char_count chars")
    elif [ $char_count -ge 40 ] && [ $char_count -le 80 ]; then
        structure_score=$((structure_score + 3))
        structure_reasons+=("Good character length: $char_count chars")
    fi

    # Power words (5 points)
    local power_word_count=0
    local found_power_words=()
    for word in "${POWER_WORDS[@]}"; do
        if [[ "$headline_lower" == *"$word"* ]]; then
            power_word_count=$((power_word_count + 1))
            found_power_words+=("$word")
        fi
    done

    if [ $power_word_count -ge 2 ]; then
        structure_score=$((structure_score + 5))
        structure_reasons+=("Strong power words: ${found_power_words[*]}")
    elif [ $power_word_count -eq 1 ]; then
        structure_score=$((structure_score + 3))
        structure_reasons+=("Power word found: ${found_power_words[0]}")
    else
        structure_reasons+=("Consider adding emotional power words")
    fi

    # Question format check (4 points)
    if [[ "$headline" == *"?" ]]; then
        structure_score=$((structure_score + 4))
        structure_reasons+=("Uses question format (engages curiosity)")
    fi

    # "How to" format check (3 points)
    if [[ "$headline_lower" == "how to"* ]] || [[ "$headline_lower" == *" how to "* ]]; then
        structure_score=$((structure_score + 3))
        structure_reasons+=("Uses proven 'How to' format")
    fi

    [ $structure_score -gt 25 ] && structure_score=25
    total_score=$((total_score + structure_score))

    echo -n "   Score: "
    score_bar $structure_score 25
    echo ""
    for reason in "${structure_reasons[@]}"; do
        if [[ "$reason" == *"outside"* ]] || [[ "$reason" == *"Consider"* ]]; then
            echo -e "   ${YELLOW}○${NC} $reason"
        else
            echo -e "   ${GREEN}✓${NC} $reason"
        fi
    done
    echo ""

    # ═══════════════════════════════════════════════════════════════
    # SECTION 3: EMOTIONAL IMPACT (15 points)
    # ═══════════════════════════════════════════════════════════════
    print_section "EMOTIONAL IMPACT (15 points)"
    echo ""

    local emotional_score=0
    local emotional_reasons=()

    # Check for emotional triggers
    local fear_words=("mistake" "wrong" "fail" "lose" "risk" "danger" "warning" "avoid" "never" "stop" "don't")
    local desire_words=("want" "need" "love" "dream" "wish" "imagine" "success" "wealth" "freedom" "happiness")
    local curiosity_words=("secret" "hidden" "revealed" "truth" "really" "actually" "surprising" "shocking" "unexpected")

    for word in "${fear_words[@]}"; do
        if [[ "$headline_lower" == *"$word"* ]]; then
            emotional_score=$((emotional_score + 5))
            emotional_reasons+=("Fear/pain trigger: '$word'")
            break
        fi
    done

    for word in "${desire_words[@]}"; do
        if [[ "$headline_lower" == *"$word"* ]]; then
            emotional_score=$((emotional_score + 5))
            emotional_reasons+=("Desire trigger: '$word'")
            break
        fi
    done

    for word in "${curiosity_words[@]}"; do
        if [[ "$headline_lower" == *"$word"* ]]; then
            emotional_score=$((emotional_score + 5))
            emotional_reasons+=("Curiosity trigger: '$word'")
            break
        fi
    done

    [ $emotional_score -gt 15 ] && emotional_score=15
    total_score=$((total_score + emotional_score))

    echo -n "   Score: "
    score_bar $emotional_score 15
    echo ""
    for reason in "${emotional_reasons[@]}"; do
        echo -e "   ${GREEN}✓${NC} $reason"
    done
    [ ${#emotional_reasons[@]} -eq 0 ] && echo -e "   ${YELLOW}○${NC} Consider adding emotional triggers"
    echo ""

    # ═══════════════════════════════════════════════════════════════
    # FINAL SCORE
    # ═══════════════════════════════════════════════════════════════
    echo -e "${BOLD}${BLUE}══════════════════════════════════════════════════════════════${NC}"
    echo ""

    # Determine grade
    local grade=""
    local grade_color=$RED
    local recommendation=""

    if [ $total_score -ge 90 ]; then
        grade="A+"
        grade_color=$GREEN
        recommendation="Exceptional headline! Ready to test."
    elif [ $total_score -ge 80 ]; then
        grade="A"
        grade_color=$GREEN
        recommendation="Strong headline. Minor tweaks possible."
    elif [ $total_score -ge 70 ]; then
        grade="B"
        grade_color=$YELLOW
        recommendation="Good foundation. Add specificity or urgency."
    elif [ $total_score -ge 60 ]; then
        grade="C"
        grade_color=$YELLOW
        recommendation="Needs work. Focus on the 4 U's framework."
    elif [ $total_score -ge 50 ]; then
        grade="D"
        grade_color=$RED
        recommendation="Weak headline. Consider rewriting."
    else
        grade="F"
        grade_color=$RED
        recommendation="Start over with benefit-focused approach."
    fi

    echo -e "${BOLD}FINAL SCORE: ${grade_color}${total_score}/100 (Grade: $grade)${NC}"
    echo ""
    echo -n "   "
    score_bar $total_score 100
    echo ""
    echo ""
    echo -e "${BOLD}Recommendation:${NC} $recommendation"
    echo ""

    # Quick improvement tips
    echo -e "${BOLD}${CYAN}Quick Improvement Tips:${NC}"
    [ $useful_score -lt 10 ] && echo "  → Add a clear benefit or promise"
    [ $specific_score -lt 10 ] && echo "  → Include specific numbers or timeframes"
    [ $unique_score -lt 10 ] && echo "  → Differentiate with 'secret', 'new', or 'only'"
    [ $emotional_score -lt 10 ] && echo "  → Add emotional trigger words"
    [ $power_word_count -eq 0 ] && echo "  → Include power words for impact"
    echo ""
}

# Main execution
if [ $# -eq 0 ]; then
    echo ""
    echo "Usage: headline-analyzer.sh \"Your Headline Here\""
    echo ""
    echo "Example:"
    echo "  headline-analyzer.sh \"7 Secrets Top Marketers Use to Double Their Email Open Rates\""
    echo ""
    exit 1
fi

analyze_headline "$*"
