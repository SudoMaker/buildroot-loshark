################################################################################
#
# jfsutils
#
################################################################################

JFSUTILS_VERSION = dbb24e4d77146216ab0c4a4035893a9ec43cfc0d
JFSUTILS_SITE = $(call github,SudoMaker,jfsutils,$(JFSUTILS_VERSION))
JFSUTILS_INSTALL_STAGING = YES
JFSUTILS_LICENSE = GPLv3

$(eval $(autotools-package))
$(eval $(host-autotools-package))
