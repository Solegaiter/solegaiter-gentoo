# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem
DESCRIPTION="Manage class instances with dictionary"
HOMEPAGE="https://rubygems.org/gems/instance_storage/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~riscv ~x86"

all_ruby_prepare() {
	sed -i -e '/bundler/ s:^:#:' Rakefile test/instance_storage_test.rb || die
}
