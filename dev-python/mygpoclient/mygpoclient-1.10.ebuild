# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="A gpodder.net client library"
HOMEPAGE="
	https://github.com/gpodder/mygpoclient/
	https://pypi.org/project/mygpoclient/
	https://mygpoclient.readthedocs.io/en/latest/
"
SRC_URI="
	https://github.com/gpodder/mygpoclient/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64 x86"

BDEPEND="
	test? (
		dev-python/minimock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
