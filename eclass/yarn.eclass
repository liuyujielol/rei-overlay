# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: yarn.eclass
# @MAINTAINER:
# liuyujielol <2073201758GD@gmail.com>
# @AUTHOR:
# liuyujielol <2073201758GD@gmail.com>
# @SUPPORTED_EAPIS: 7 8
# @BLURB: common build functions for nodejs package uses yarn
# @DESCRIPTION:
# This eclass provides functions to build nodejs package via yarn offline.
#
# @EXAMPLE:
#
# @CODE
#
# inherit yarn
#
# EYARN_RESOLVED=(
#   "@ampproject/remapping/-/remapping-2.0.4.tgz"
#   "ansi-html-community/-/ansi-html-community-0.0.8.tgz"
# )
#
# yarn_set_globals
#
# SRC_URI="https://github.com/example/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
#		   ${EYARN_RESOLVED_SRC_URI}"
#
# YARN_WORKDIR="${WORKDIR}/web"
#
# src_unpack() {
#	unpack "${P}.tar.gz"
#	yarn_set_offline_mirror
# ...
# }
#
#src_prepare(){
#	default
#	yarn_offline_install
# ...
# }
# @CODE

if [[ ! ${_YARN_ECLASS} ]]; then

case ${EAPI} in
	7|8) ;;
	*) die "${ECLASS}: EAPI ${EAPI} unsupported."
esac

BDEPEND="
	net-libs/nodejs
	sys-apps/yarn
"

EXPORT_FUNCTIONS src_unpack src_prepare

# @ECLASS-VARIABLE: EYARN_RESOLVED
# @REQUIRED
# @DESCRIPTION:
# This is an array based on yarn.lock file content
# from inside the target package.
# e.g.:
# sed -r -n -e 's/^[ ]*resolved \"(.*)\#.*\"$/\1/g; s/https:\/\/registry.yarnpkg.com\//\0/g; s/https:\/\/registry.yarnpkg.com\///p' yarn.lock | sort | uniq | sed 's/\(.*\)/"\1"/g'

# @ECLASS-VARIABLE: EYARN_RESOLVED_SRC_URI
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# Coverted real src_uri and corresponding filename.

# @ECLASS-VARIABLE: _YARN_RESOLVED_MAP
# @INTERNAL
# @DESCRIPTION:
# Mapping back from Gentoo distfile name to upstream distfile path.
declare -A -g _YARN_RESOLVED_MAP

# @ECLASS-VARIABLE: _YARN_OFFLINE_MIRROR
# @INTERNAL
# @DESCRIPTION:
# The temporary offline mirror directory for YARN
_YARN_OFFLINE_MIRROR="${T}/yarn-mirror/"

# @ECLASS-VARIABLE: YARN_WORKDIR
# @DESCRIPTION:
# The source file directory for yarn to work with
# By default sets to ${WORKDIR}
YARN_WORKDIR="${WORKDIR}"

# @FUNCTION: yarn_set_globals
# @DESCRIPTION:
# Generate real src_uri variables and set yarn registry
yarn_set_globals() {
	debug-print-function "${FUNCNAME}" "$@"

	# used make SRC_URI easier to read
	local newline=$'\n'
	local line

	for line in "${EYARN_RESOLVED[@]}"; do
		_distfile=${line//\//:2F}
		# SRC_URI
		_uri="mirror://yarn/${line}"
		EYARN_RESOLVED_SRC_URI+=" ${_uri} -> ${_distfile}${newline}"
		_YARN_RESOLVED_MAP["${_distfile}"]=1
	done

	_YARN_SET_GLOBALS_CALLED=1
}

# @FUNCTION: yarn_src_unpack
# @DESCRIPTION:
# and unpack other targets.
yarn_src_unpack() {
	debug-print-function "${FUNCNAME}" "$@"

	if [[ "${#EYARN_RESOLVED[@]}" -gt 0 ]]; then
		yarn_set_offline_mirror
	else
		default
	fi
}

# @FUNCTION: yarn_set_offline_mirror
# @DESCRIPTION:
# If your ebuild redefines src_unpack and uses EYARN_RESOLVED you need to call
# this function in src_unpack.
# Soft link the local yarn pkg from ${DISTDIR} to ${_YARN_OFFLINE_MIRROR}
# and set up yarn to use offline mirror.
yarn_set_offline_mirror() {
	debug-print-function "${FUNCNAME}" "$@"

	if [[ ! ${_YARN_SET_GLOBALS_CALLED} ]]; then
		die "yarn_set_globals must be called in global scope"
	fi

	mkdir -p "${_YARN_OFFLINE_MIRROR}" || die

	local f df
	for f in ${A}; do
		if [[ -n ${_YARN_RESOLVED_MAP["${f}"]} ]]; then
			df="$(echo ${f//:2F//} | sed -r -e 's#(@([^@/]+))?\/?([^@/]+)\/\-\/([^/]+).tgz#yarn-\1-\4.tgz#g')"
			df="$(echo ${df#yarn--})"
			df="$(echo ${df#yarn-})"
			ln -s "${DISTDIR}/${f}" "${_YARN_OFFLINE_MIRROR}/${df}" || die
		fi
	done

	if [[ -e "${YARN_WORKDIR}" ]]; then
		echo "yarn-offline-mirror \"${_YARN_OFFLINE_MIRROR}\"" >> "${YARN_WORKDIR}/.yarnrc" || die
	else
		die "the yarn workdir ${YARN_WORKDIR} does not exist"
	fi
}

# @FUNCTION: yarn_src_prepare
# @DESCRIPTION:
# General function for prepare source files with yarn.
yarn_src_prepare(){
	default
	yarn_offline_install
}

# @FUNCTION: yarn_offline_install
# @DESCRIPTION:
# Let yarn install dependencies from offline mirror.
yarn_offline_install() {
	debug-print-function "${FUNCNAME}" "$@"

	cd "${YARN_WORKDIR}" || die "cd failed"
	yarn install --offline || die
}

_YARN_ECLASS=1
fi
