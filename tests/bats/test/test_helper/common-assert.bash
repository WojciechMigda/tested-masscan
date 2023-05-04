# assert_line_count
# =================
#
# Summary: Fail if count of the expected line in the output does not equal.
#
# Usage: assert_line_count [-p | -e] [--] <count> <expected>
#
# Options:
#   -p, --partial     Match if `expected` is a substring of `$output`
#   -e, --regexp      Treat `expected` as an extended regular expression
#   <count>           The total count of lines matching <expected>
#   <expected>        The expected line string, substring, or regular expression
#
# IO:
#   STDERR - details, on failure
#            error message, on error
# Globals:
#   output
#   lines
# Returns:
#   0 - if matching line found
#   1 - otherwise
#
# @test "assert_line_count() looking for have-" {
#     run bash -c 'echo "have-1"; echo "have-2"; echo "have-3"'
#
#     assert_line_count -p 3 "have-"
# }
#
assert_line_count() {
  local -i is_mode_partial=0
  local -i is_mode_regexp=0
  : "${lines?}"

  # Handle options.
  while (( $# > 0 )); do
    case "$1" in
    -p|--partial) is_mode_partial=1; shift ;;
    -e|--regexp) is_mode_regexp=1; shift ;;
    --) shift; break ;;
    *) break ;;
    esac
  done

  if (( is_mode_partial )) && (( is_mode_regexp )); then
    echo "\`--partial' and \`--regexp' are mutually exclusive" \
    | batslib_decorate 'ERROR: assert_line' \
    | fail
    return $?
  fi

  # Arguments.
  local -ir _count="$1"; shift
  local -r expected="$1"

  if (( is_mode_regexp == 1 )) && [[ '' =~ $expected ]] || (( $? == 2 )); then
    echo "Invalid extended regular expression: \`$expected'" \
    | batslib_decorate 'ERROR: assert_line' \
    | fail
    return $?
  fi

  # accumulate matched lines here
  local -i n_lines=0

  # Contained in output.
  if (( is_mode_regexp )); then
    local -i idx
    for (( idx = 0; idx < ${#lines[@]}; ++idx )); do
      [[ ${lines[$idx]} =~ $expected ]] && (( ++n_lines ))
    done
  elif (( is_mode_partial )); then
    local -i idx
    for (( idx = 0; idx < ${#lines[@]}; ++idx )); do
      [[ ${lines[$idx]} == *"$expected"* ]] && (( ++n_lines ))
    done
  else
    local -i idx
    for (( idx = 0; idx < ${#lines[@]}; ++idx )); do
      [[ ${lines[$idx]} == "$expected" ]] && (( ++n_lines ))
    done
  fi

  if [[ $n_lines != $_count ]]; then
    batslib_print_kv_single_or_multi 8 \
    'expected' "$n_lines" \
    'actual'   "$_count" \
    | batslib_decorate 'line counts do not equal' \
    | fail
  fi

  return 0
}
