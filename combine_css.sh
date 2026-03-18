#!/usr/bin/env bash
#
# https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity
#### SETUP ####################################################################
set -o errtrace
set -o nounset

DIR_REPO="$(cd -P -- "${0%/*}" && pwd -P)"
# https://en.wikipedia.org/wiki/ANSI_escape_code
E0="$(printf "\e[0m")"        # reset
E30="$(printf "\e[30m")"      # foreground: black
E107="$(printf "\e[107m")"    # background: bright white

#### FUNCTIONS ################################################################

print_header() {
    # Print 80 character wide black on white heading with time
    printf "${E30}${E107}# %-69s$(date '+%T') ${E0}\n" "${@}"
}

#### MAIN #####################################################################

cd "${DIR_REPO}" || exit 1
print_header 'Combining layout CSS'
pushd ./source/assets/static >/dev/null || exit 1
{
    cat normalize.css
    cat skeleton.css
    cat pygments-monokai.css
} > layout.css
popd >/dev/null || exit 1
echo 'done.'
echo
