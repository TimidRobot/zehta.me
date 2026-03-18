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
print_header 'Generating SRI hashes'
while IFS= read -r -d '' _file
do
    printf "%-40s %s\n" "${_file}"  "\"${_file#docs}\""
    sha512=$(cat "${_file}" | openssl dgst -sha512 -binary | openssl base64 -A)
    echo "sha512-${sha512}" | tee -a "${_file}.sha512"
    echo
done < <(find docs -type f \( -iname '*.js' -o -iname '*.css' \) -print0)
