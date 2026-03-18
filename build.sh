#!/usr/bin/env bash
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
PROG="${0##*/}"
USAGE="\
Usage:  ${PROG} [OPTIONS]

Options:
    -h  Show this help message and exit
    -p  Pretify HTML and skip minify
    -x  Clear Lektor plugins

Description:
    Build website in docs/ dirctory.
"

#### FUNCTIONS ################################################################

error_exit() {
    # Echo error message and exit with error
    echo -e "${E31}ERROR:${E0} ${*}" 1>&2
    exit 1
}

print_header() {
    # Print 80 character wide black on white heading with time
    printf "${E30}${E107}# %-69s$(date '+%T') ${E0}\n" "${@}"
}

#### MAIN #####################################################################

cd "${DIR_REPO}"
if [[ -n "${*:-}" ]]
then
    for _arg in "${@}"
    do
        case "${_arg}" in
            -p ) PRETIFY=1 ;;
            -x ) CLEAR_PLUGINS=1 ;;
            -px | -xp )
                PRETIFY=1
                CLEAR_PLUGINS=1
                ;;
            -h )
                echo "${USAGE}"
                exit
                ;;
            *)
                error_exit "unsupported option: ${_arg}"
                ;;
        esac
    done
fi

print_header 'Removing contents of build dir (docs/)'
echo "$(rm -rfv docs/* | wc -l) files and directories removed"
echo

if [[ -n "${CLEAR_PLUGINS:-}" ]]; then
    print_header 'Lektor: flushing cache'
    uv run lektor plugins flush-cache
    echo

    print_header 'Lektor: installing all plugins'
    uv run lektor plugins reinstall 2>&1 \
        | grep --fixed-strings --invert-match \
            'specify --upgrade to force replacement'
    echo
fi

./combine_css.sh

if [[ -n "${PRETIFY:-}" ]]
then
    print_header 'Lektor: building site with pretify'
    uv run lektor build --extra-flag pretifyhtml --output-path ../docs
else
    print_header 'Lektor: building site with minify'
    uv run lektor build --extra-flag minify --output-path ../docs
fi
echo
cp -v source/assets/_redirects docs/
echo

./sri_hashes.sh

print_header 'Updating custom CSS SRI in layout template'
sha512=$(cat docs/static/custom.css | openssl dgst -sha512 -binary \
    | openssl base64 -A)
grep --fixed-strings --recursive --files-with-matches static/custom.css docs \
    | xargs \
        gsed -r \
            -e"s|(/custom[.]css.+integrity=\")([^\"]+)|\\1sha512-${sha512}|" \
            -i source/templates/layout.html
echo done.
