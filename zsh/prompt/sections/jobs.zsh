#
# Background jobs
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

PROMPT_JOBS_PREFIX=""
PROMPT_JOBS_SUFFIX=" "
PROMPT_JOBS_SYMBOL="✦"
PROMPT_JOBS_COLOR="yellow"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show icon if there's a working jobs in the background
prompt_jobs() {
  local jobs_amount=$( (jobs) | wc -l )

  [[ $jobs_amount -gt 0 ]] || return
  [[ $jobs_amount -eq 1 ]] && jobs_amount=''

  prompt::section \
    "$PROMPT_JOBS_COLOR" \
    "$PROMPT_JOBS_PREFIX" \
    "${PROMPT_JOBS_SYMBOL}${jobs_amount}" \
    "$PROMPT_JOBS_SUFFIX"
}
