build() {
	ansible-galaxy collection build --force
}

# $1: <tarball path>
install() {
	ansible-galaxy collection install $1 --force
}

install_dev() {
	build
	install calian-airgap-1.0.0.tar.gz
}

prerequisites() {
	ansible-galaxy collection install https://github.com/thailekha/airgap/raw/master/calian-airgap-1.0.0.tar.gz
	ansible-galaxy collection install community.docker ansible.posix
	pip install docker ansible-core dirsync
}

setup_dev() {
	cd ~/ansible
	. hacking/env-setup
	cd -
}

$@
