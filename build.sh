#!/bin/bash
#
# -x to remove and reinstall plugins
# -p to pretify (and skip minify)
#### SETUP ####################################################################
set -o errexit
set -o errtrace
set -o nounset

trap '_es=${?};
    printf "${0}: line ${LINENO}: \"${BASH_COMMAND}\"";
    printf " exited with a status of ${_es}\n";
    exit ${_es}' ERR

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
if [[ -n "${@:-}" ]]
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
                echo "ERROR: unsupported option: ${_arg}" 1>&2
                echo 1>&2
                echo "${USAGE}" 1>&2
                exit 1
                ;;
        esac
    done
fi

printf "\e[1m\e[7m %-80s\e[0m\n" 'Removing contents of build dir (docs/)'
echo "$(rm -rfv docs/* | wc -l) files and directories removed"
echo
echo

if [[ -n "${CLEAR_PLUGINS:-}" ]]; then
    printf "\e[1m\e[7m %-80s\e[0m\n" 'Lektor: uninstalling all plugins'
    uv run lektor plugins flush-cache
    echo
    echo

    printf "\e[1m\e[7m %-80s\e[0m\n" 'Lektor: installing all plugins'
    uv run lektor plugins reinstall 2>&1 \
        | fgrep -v 'pecify --upgrade to force replacement'
    echo
    echo
fi

./combine_css.sh


if [[ -n "${PRETIFY:-}" ]]
then
    printf "\e[1m\e[7m %-80s\e[0m\n" 'Lektor: building site with pretify'
    uv run lektor build --extra-flag pretifyhtml --output-path ../docs
else
    printf "\e[1m\e[7m %-80s\e[0m\n" 'Lektor: building site with minify'
    uv run lektor build --extra-flag minify --output-path ../docs
fi
echo
cp -v source/assets/_redirects docs/
echo

./sri_hashes.sh
echo
echo


printf "\e[1m\e[7m %-80s\e[0m\n" 'Updating custom CSS SRI in layout template'
sha512=$(cat docs/static/custom.css | openssl dgst -sha512 -binary \
    | openssl base64 -A)
grep --fixed-strings --recursive --files-with-matches static/custom.css docs \
    | xargs \
        gsed -r \
            -e"s|(/custom[.]css.+integrity=\")([^\"]+)|\\1sha512-${sha512}|" \
            -i source/templates/layout.html
echo done.
