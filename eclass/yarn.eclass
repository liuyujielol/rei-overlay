# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: yarn.eclass
# @MAINTAINER:
# liuyujielol <2073201758GD@gmail.com>
# @AUTHOR:
# liuyujielol <2073201758GD@gmail.com>
# @SUPPORTED_EAPIS: 7 8
# @BLURB: set up a basic env for building nodejs package which uses yarn.
# @DESCRIPTION:
# This eclass provides functions to prepare yarn dependencies for portage
# and makes yarn install them offline.
#
# This eclass does not set any metadata variables nor export any phase
# functions. It can be inherited safely.
#
# @EXAMPLE:
#
# @CODE
#
# inherit yarn
#
# EYARN_LOCK=(
#   "@ampproject/remapping/-/remapping-2.0.4.tgz"
#   "ansi-html-community/-/ansi-html-community-0.0.8.tgz"
# )
#
# yarn_set_globals
#
# SRC_URI="https://github.com/example/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
#		   ${EYARN_LOCK_SRC_URI}"
#
# YARN_WORKDIR="${S}/web"
#
# src_unpack() {
#	unpack "${P}.tar.gz"
#	yarn_set_offline_mirror
# ...
# }
#
# src_prepare(){
#	default
#	yarn_offline_install
# ...
# }
#
# @CODE

if [[ ! ${_YARN_ECLASS} ]]; then

case ${EAPI} in
	7|8) ;;
	*) die "${ECLASS}: EAPI ${EAPI} unsupported."
esac

BDEPEND="
	>=net-libs/nodejs-14.16
	sys-apps/yarn
"

# @ECLASS_VARIABLE: EYARN_LOCK
# @REQUIRED
# @DESCRIPTION:
# This is an array based on yarn.lock file content
# from inside the target package.
# e.g.:
# sed -r -n -e 's/^[ ]*resolved \"(.*)\#.*\"$/\1/g; s/https:\/\/registry.yarnpkg.com\//\0/g; s/https:\/\/registry.yarnpkg.com\///p' yarn.lock | sort | uniq | sed 's/\(.*\)/"\1"/g'

# @ECLASS_VARIABLE: EYARN_LOCK_SRC_URI
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# Coverted real src_uri and corresponding filename.

# @ECLASS_VARIABLE: _YARN_RESOLVED_MAP
# @INTERNAL
# @DESCRIPTION:
# Variable for recording whether a distfile belongs to yarn.
declare -A -g _YARN_RESOLVED_MAP

# @ECLASS_VARIABLE: _YARN_OFFLINE_MIRROR
# @INTERNAL
# @DESCRIPTION:
# The temporary offline mirror directory for YARN
_YARN_OFFLINE_MIRROR="${T}/yarn-mirror/"

# @ECLASS_VARIABLE: YARN_REGISTRY
# @USER_VARIABLE
# @DEFAULT_UNSET
# @DESCRIPTION:
# Mirror for yarn registry.
# Used by yarn_live_src_unpack to set yarn mirror.
# This is intended to be set by users.
# Ebuilds must not set it.
#
# Default is not set.

# @ECLASS_VARIABLE: EYARN_REGISTRY_DIR
# @USER_VARIABLE
# @DEFAULT_UNSET
# @DESCRIPTION:
# Storage directory for yarn registry.
# Used by yarn_live_src_unpack to cache downloads.
# This is intended to be set by users.
# Ebuilds must not set it.
#
# Defaults to "${DISTDIR}/yarn-registry" it not set.

# @ECLASS_VARIABLE: EYARN_OFFLINE
# @USER_VARIABLE
# @DEFAULT_UNSET
# @DESCRIPTION:
# If non-empty, this variable prevents online operations in
# yarn_live_src_unpack.
# Inherits value of EVCS_OFFLINE if not set explicitly.

# @ECLASS_VARIABLE: YARN_WORKDIR
# @DESCRIPTION:
# The source file directory for yarn to work with
# By default sets to ${S}
: "${YARN_WORKDIR:=${S}}"

# @FUNCTION: eyarn
# @USAGE: [<args>...]
# @DESCRIPTION:
# Call yarn, passing the supplied arguments.
# This function dies if yarn fails. It also supports being called via 'nonfatal'.
# If you need to call yarn directly in your ebuilds, this is the way it
# should be done.
eyarn() {
	set -- yarn "$@"
	echo "$@" >&2
	"$@" || die -n "${*} failed"
}

# @FUNCTION: yarn_gen_config
# @DESCRIPTION:
# Generate yarn config file
yarn_gen_config() {
	debug-print-function "${FUNCNAME}" "$@"

	[[ ${YARN_WORKDIR} ]] && die "YARN_WORKDIR is not set when it should be"
	[[ ! -d "${YARN_WORKDIR}" ]] && die "YARN_WORKDIR: ${YARN_WORKDIR} does not exist"

	# set yarn-offline-mirror
	echo "yarn-offline-mirror \"${_YARN_OFFLINE_MIRROR}\"" >> "${YARN_WORKDIR}/.yarnrc" || die
	# enable downloaded files pruning
	echo "yarn-offline-mirror-pruning true" >> "${YARN_WORKDIR}/.yarnrc" || die

	_YARN_GEN_CONFIG_CALLED=1
}

# @FUNCTION: yarn_set_globals
# @DESCRIPTION:
# Generate real src_uri variables
yarn_set_globals() {
	debug-print-function "${FUNCNAME}" "$@"

	# used make SRC_URI easier to read
	local newline=$'\n'
	local line

	for line in "${EYARN_LOCK[@]}"; do
		_distfile=${line//\//:2F}
		# SRC_URI
		_uri="mirror://yarn/${line}"
		EYARN_LOCK_SRC_URI+=" ${_uri} -> ${_distfile}${newline}"
		_YARN_RESOLVED_MAP["${_distfile}"]=1
	done

	# Ensure these variables are not changed past this point
	readonly EYARN_LOCK
	readonly EYARN_LOCK_SRC_URI
	readonly _YARN_RESOLVED_MAP

	_YARN_SET_GLOBALS_CALLED=1
}

# @FUNCTION: yarn_live_src_unpack
# @DESCRIPTION:
# NOTE: YARN_WORKDIR must have been set and must exist
# Runs 'yarn install' and downloaded pkgs for offline use, used in live ebuilds
yarn_live_src_unpack() {
	debug-print-function ${FUNCNAME} "$@"

	[[ "${PV}" == *9999* ]] || die "${FUNCNAME} only allowed in live/9999 ebuilds"
	[[ "${EBUILD_PHASE}" == unpack ]] || die "${FUNCNAME} only allowed in src_unpack"

	[[ ${YARN_WORKDIR} ]] && die "YARN_WORKDIR is not set when it should be"
	[[ ! -d "${YARN_WORKDIR}" ]] && die "YARN_WORKDIR: ${YARN_WORKDIR} does not exist"

	local distdir=${PORTAGE_ACTUAL_DISTDIR:-${DISTDIR}}
	: ${EYARN_REGISTRY_DIR:=${distdir}/yarn-registry}

	local offline="${EYARN_OFFLINE:-${EVCS_OFFLINE}}"

	if [[ ! -d ${EYARN_REGISTRY_DIR} && ! ${offline} ]]; then
		(
			addwrite "${EYARN_REGISTRY_DIR}"
			mkdir -p "${EYARN_REGISTRY_DIR}"
		) || die "Unable to create ${EYARN_REGISTRY_DIR}"
	fi

	if [[ ${offline} ]]; then
			if [[ ! -d ${EYARN_REGISTRY_DIR} ]]; then
				eerror "Networking activity has been disabled via EYARN_OFFLINE or EVCS_OFFLINE"
				eerror "However, no valid yarn registry available at ${EYARN_REGISTRY_DIR}"
				die "Unable to proceed with EYARN_OFFLINE/EVCS_OFFLINE."
			fi
	fi

	pushd "${YARN_WORKDIR}" > /dev/null || die

	# Let yarn fetch to system-wide location.
	# It will keep directory organized by 'yarn-offline-mirror-pruning true'.
	addwrite "${EYARN_REGISTRY_DIR}"

	if [[ ${YARN_REGISTRY} ]]; then
		# set yarn mirror registry
		echo "registry \"${YARN_REGISTRY}\"" > "${YARN_WORKDIR}/.yarnrc" || die
	fi
	# set yarn-offline-mirror
	echo "yarn-offline-mirror \"${EYARN_REGISTRY_DIR}\"" >> "${YARN_WORKDIR}/.yarnrc" || die
	# enable downloaded files pruning
	echo "yarn-offline-mirror-pruning true" >> "${YARN_WORKDIR}/.yarnrc" || die

	einfo "yarn install ${offline:+--offline}"
	yarn install --frozen-lockfile --check-files '${offline:+--offline}' || die #nowarn

	popd > /dev/null || die
}

# @FUNCTION: yarn_set_offline_mirror
# @DESCRIPTION:
# If your ebuild redefines src_unpack and uses EYARN_RESOLVED you need to call
# this function in src_unpack.
# Soft link the local yarn pkg from ${DISTDIR} to ${_YARN_OFFLINE_MIRROR}
# for setting up yarn to use offline mirror.
# NOTE:yarn_set_globals must be called before.
yarn_set_offline_mirror() {
	debug-print-function "${FUNCNAME}" "$@"

	if [[ ! ${_YARN_SET_GLOBALS_CALLED} ]]; then
		die "yarn_set_globals must be called in global scope"
	fi

	mkdir -p "${_YARN_OFFLINE_MIRROR}" || die
	# soft link targets
	local f df
	for f in ${A}; do
		if [[ -n ${_YARN_RESOLVED_MAP["${f}"]} ]]; then
			ebegin "Loading ${f} into yarn offline mirror"
			# make the filename be the exract filename yarn wants
			df="$(echo ${f//:2F//} | sed -r -e 's#(@([^@/]+))?\/?([^@/]+)\/\-\/([^/]+).tgz#yarn-\1-\4.tgz#g')"
			df="${df#yarn--}"
			df="${df#yarn-}"
			ln -s "${DISTDIR}/${f}" "${_YARN_OFFLINE_MIRROR}/${df}" || die
			eend $?
		fi
	done

	yarn_gen_config
}

# @FUNCTION: yarn_offline_install
# @DESCRIPTION:
# Let yarn install dependencies from offline mirror.
yarn_offline_install() {
	debug-print-function "${FUNCNAME}" "$@"

	[[ ${YARN_WORKDIR} ]] && die "YARN_WORKDIR is not set when it should be"
	[[ ! -d "${YARN_WORKDIR}" ]] && die "YARN_WORKDIR: ${YARN_WORKDIR} does not exist"

	if [[ ! ${_YARN_GEN_CONFIG_CALLED} ]]; then
		die "yarn_gen_config must be called before"
	fi

	cd "${YARN_WORKDIR}" || die "cd failed"
	eyarn install --offline --check-files
}

_YARN_ECLASS=1
fi
