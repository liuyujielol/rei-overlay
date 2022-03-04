#/bin/bash

#set -ex

PN="v2rayA"
PV="1.5.6.2"
P="${PN}-${PV}"

WORK="$(pwd)/work"

_GIT="/usr/bin/git"
GIT_REPO_URI="https://github.com/v2rayA/v2rayA.git"
GIT_MASTER_BRANCH="master"
TAG_PREFIX="v"
GIT_TAG="${TAG_PREFIX}${PV}"

GIT_WORKDIR="${WORK}/${P}"

_YARN="/usr/bin/yarn"
YARN_WORKDIR="${GIT_WORKDIR}/gui"
YARN_CACHE_FOLDER="${WORK}/yarn_cache"
#YARN_REGISTRY="https://registry.yarnpkg.com"
YARN_REGISTRY="https://registry.npmmirror.com"
#YARN_REGISTRY="https://registry.npm.taobao.org"
YARN_OFFLINE_MIRROR="${WORK}/yarn_offline_mirror"

_WGET="/usr/bin/wget"

_TAR="/bin/tar"

die() { echo "$*" 1>&2 ; exit 1; }

clone_repo() {
	if [[ -e "${GIT_WORKDIR}/.git" ]]; then
		cd "${GIT_WORKDIR}" || die "cd failed"
		${_GIT} checkout ${GIT_MASTER_BRANCH}
		${_GIT} pull
	else
		${_GIT} clone ${GIT_REPO_URI} ${GIT_WORKDIR}
	fi
}

checkout_tag() {
	cd ${GIT_WORKDIR} || die "cd failed"
	${_GIT} checkout ${GIT_TAG}
}

yarn_install() {
	cd ${YARN_WORKDIR} || die "cd failed"
	${_YARN} install --frozen-lockfile --cache-folder "${YARN_CACHE_FOLDER}" --checkfiles
}

yarn_set_offline_mirror() {
	if [[ ! -e "${YARN_WORKDIR}" ]]; then
		mkdir "${YARN_WORKDIR}" || die "mkdir failed"
	fi
	if [[ ! -e "${YARN_OFFLINE_MIRROR}" ]]; then
		mkdir "${YARN_OFFLINE_MIRROR}" || die "mkdir failed"
	fi

	echo "registry \"${YARN_REGISTRY}\"" > "${YARN_WORKDIR}/.yarnrc"
	echo "yarn-offline-mirror \"${YARN_OFFLINE_MIRROR}\"" > "${YARN_WORKDIR}/.yarnrc"
	echo "yarn-offline-mirror-pruning true" >> "${YARN_WORKDIR}/.yarnrc"
}

yarn_fetch() {
	yarn_set_offline_mirror
	yarn_install
}

pack_cache() {
	cd "${WORK}" || die "cd failed"
	${_TAR} -czf "${WORK}/${P}-yarn_cache.tar.gz" -C ${WORK} "./yarn_cache"
}

pack_offline_mirror() {
	cd "${WORK}" || die "cd failed"
	${_TAR} -czf "${WORK}/${P}-yarn_mirror.tar.gz" -C ${WORK} "./yarn_offline_mirror"
}

main() {
	if [[ ! -e "${WORK}" ]]; then
		mkdir "${WORK}"
	else
		rm -r "${WORK}"
		mkdir "${WORK}"
	fi

	# comment out unwanted steps
	clone_repo
	checkout_tag
	yarn_fetch
	#pack_cache
	pack_offline_mirror
}

main
