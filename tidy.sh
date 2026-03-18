#!/bin/bash
#### SETUP ####################################################################
set -o errexit
set -o errtrace
set -o nounset

# shellcheck disable=SC2154
trap '_es=${?};
    printf "${0}: line ${LINENO}: \"${BASH_COMMAND}\"";
    printf " exited with a status of ${_es}\n";
    exit ${_es}' ERR

DIR_REPO="$(cd -P -- "${0%/*}" && pwd -P)"
# https://en.wikipedia.org/wiki/ANSI_escape_code
E0="$(printf "\e[0m")"        # reset
E30="$(printf "\e[30m")"      # foreground: black
E31="$(printf "\e[31m")"      # foreground: red
E107="$(printf "\e[107m")"    # background: bright white

#### FUNCTIONS ################################################################

print_header() {
    # Print 80 character wide black on white heading with time
    printf "${E30}${E107}# %-69s$(date '+%T') ${E0}\n" "${@}"
}

#### MAIN #####################################################################

cd "${DIR_REPO}" || exit 1
for _file in docs/**/*.html docs/*.html
do
    result=$(tidy -errors -indent -wrap 80 -quiet -utf8 \
                --drop-empty-elements no \
                --drop-empty-paras no \
                --quote-ampersand no \
                --quote-nbsp no \
                "${_file}" 2>&1 || true)
    [[ -n "${result}" ]] || continue
    print_header "${_file}"
    echo "${result}"
    echo
done
