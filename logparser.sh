#!/usr/bin/env bash
#
# This script parses logs from /var/log/messages or journalctl
#
# Joey Grant - 10/24/2022

function systemd_exists {
  if [[ -d /run/systemd/system ]]; then
    return 0
  else
    return 1
  fi
}

function get_unique_process_names {
  echo "$logs" | cut -d " " -f 5 | sed -E -e 's/\[[^][]*\]:|://g' | sort | uniq
}

function get_messages_by_process {
  echo "$logs" | grep -P "$process\[.*?\]:|$process:" | awk -F: '{$1=$2=$3=""; print $0}' | sort | uniq -c | sort -bgr
}

function gather_logs {
  if systemd_exists; then
    /usr/bin/journalctl --no-pager
  else
    cat /var/log/messages*
  fi
}

function display_formated_results {
  for process in $processes
  do
    printf "\n%b\n- - - - - -\n\n" "$process"
    printf "%b\n\n" "$(get_messages_by_process)"
  done
}

logs="$(gather_logs)"
processes="$(get_unique_process_names)"
display_formated_results

