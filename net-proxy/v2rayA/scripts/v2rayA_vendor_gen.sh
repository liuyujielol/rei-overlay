#/bin/bash

set -ex

PN="v2rayA"
PV="1.5.9.1698.1"
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

_GO="/usr/bin/go"
GO_WORKDIR="${GIT_WORKDIR}/service"

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

pack_yarn_cache() {
	cd "${WORK}" || die "cd failed"
	${_TAR} -acf "${WORK}/${P}-yarn_cache.tar.gz" yarn_cache
}

pack_yarn_offline_mirror() {
	cd "${WORK}" || die "cd failed"
	${_TAR} -acf "${WORK}/${P}-yarn_mirror.tar.gz" yarn_offline_mirror
}

go_mod_download() {
	cd ${GO_WORKDIR} || die "cd failed"
	export GOPROXY="https://goproxy.cn/"

	export GOMODCACHE="${WORK}"/go-mod
	# -modcacherw makes the build cache read/write
	# -v prints the names of packages as they are compiled
	# -x prints commands as they are executed
	${_GO} mod download -modcacherw -x
}

go_mod_vendor() {
	cd ${GO_WORKDIR} || die "cd failed"
	export GOPROXY="https://goproxy.cn/"

	export GOMODCACHE="${WORK}"/go-mod
	${_GO} mod vendor
}

pack_go_module() {
	cd ${WORK} || die "cd failed"
	${_TAR} -acf "${WORK}/${P}-go-deps.tar.gz" go-mod/
}

pack_go_vendor() {
	cd ${GO_WORKDIR} || die "cd failed"
	${_TAR} -acf "${WORK}/${P}-go-vendor.tar.gz" vendor/
}

main() {
	if [[ ! -e "${WORK}" ]]; then
		mkdir "${WORK}"
#	else
#		rm -rf "${WORK}"
#		mkdir "${WORK}"
	fi

	# comment out unwanted steps
	# git
	clone_repo
	checkout_tag
	# yarn
	yarn_fetch
	pack_yarn_cache
	pack_yarn_offline_mirror
	# go
	go_mod_download
	go_mod_vendor
	pack_go_module
	pack_go_vendor
}

main
