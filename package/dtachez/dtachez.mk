################################################################################
#
# dtachez
#
################################################################################

DTACHEZ_VERSION = v1.0.0
DTACHEZ_SITE = $(call github,SudoMaker,dtachez,$(DTACHEZ_VERSION))
DTACHEZ_INSTALL_STAGING = YES
DTACHEZ_LICENSE = GPLv3

$(eval $(cmake-package))
