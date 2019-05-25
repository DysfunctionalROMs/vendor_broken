# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# Broken OTA update package

# Build colors

ifneq ($(BUILD_WITH_COLORS),0)
  CL_SLIM="\033[38;5;24m"
  CL_SGRY="\033[38;5;239m"
  CL_RED="\033[31m"
  CL_GRN="\033[32m"
  CL_YLW="\033[33m"
  CL_BLU="\033[34m"
  CL_MAG="\033[35m"
  CL_CYN="\033[36m"
  CL_RST="\033[0m"
endif

BROKEN_TARGET_PACKAGE := $(PRODUCT_OUT)/$(BROKEN_MOD_VERSION).zip

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(BROKEN_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(BROKEN_TARGET_PACKAGE) > $(BROKEN_TARGET_PACKAGE).md5sum
	@echo -e ${CL_CYN}"   @@@@@@@   @@@@@@@    @@@@@@   @@@  @@@  @@@@@@@@  @@@  @@@   "${CL_CYN}
	@echo -e ${CL_CYN}"   @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@  @@@  @@@@@@@@  @@@@ @@@   "${CL_CYN}
	@echo -e ${CL_CYN}"   @@!  @@@  @@!  @@@  @@!  @@@  @@!  !@@  @@!       @@!@!@@@   "${CL_CYN}
	@echo -e ${CL_CYN}"   !@   @!@  !@!  @!@  !@!  @!@  !@!  @!!  !@!       !@!!@!@!   "${CL_CYN}
	@echo -e ${CL_CYN}"   @!@!@!@   @!@!!@!   @!@  !@!  @!@@!@!   @!!!:!    @!@ !!@!   "${CL_CYN}
	@echo -e ${CL_CYN}"   !!!@!!!!  !!@!@!    !@!  !!!  !!@!!!    !!!!!:    !@!  !!!   "${CL_CYN}
	@echo -e ${CL_CYN}"   !!:  !!!  !!: :!!   !!:  !!!  !!: :!!   !!:       !!:  !!!   "${CL_CYN}
	@echo -e ${CL_CYN}"   :!:  !:!  :!:  !:!  :!:  !:!  :!:  !:!  :!:       :!:  !:!   "${CL_CYN}
	@echo -e ${CL_CYN}"   :: ::::   ::   :::  ::::: ::   ::  :::   :: ::::   ::   ::   "${CL_CYN}
	@echo -e ${CL_CYN}"   :: : ::    :   : :   : :  :    :   :::  : :: ::   ::    :    "${CL_CYN}
	@echo -e ${CL_CYN}"                                                                "${CL_CYN}
	@echo -e ${CL_CYN}"                        @@@@@@    @@@@@@                        "${CL_CYN}
	@echo -e ${CL_CYN}"                       @@@@@@@@  @@@@@@@                        "${CL_CYN}
	@echo -e ${CL_CYN}"                       @@!  @@@  !@@                            "${CL_CYN}
	@echo -e ${CL_CYN}"                       !@!  @!@  !@!                            "${CL_CYN}
	@echo -e ${CL_CYN}"                       @!@  !@!  !!@@!!                         "${CL_CYN}
	@echo -e ${CL_CYN}"                       !@!  !!!   !!@!!!                        "${CL_CYN}
	@echo -e ${CL_CYN}"                       !!:  !!!       !:!                       "${CL_CYN}
	@echo -e ${CL_CYN}"                       :!:  !:!      !:!                        "${CL_CYN}
	@echo -e ${CL_CYN}"                       ::::: ::  :::: ::                        "${CL_CYN}
	@echo -e ${CL_CYN}"                        : :  :   :: : :                         "${CL_CYN}
	@echo -e ${CL_CYN}"                                                                "${CL_CYN}
	@echo -e ${CL_YLW}"                    Its Done     Getcha Some                    "${CL_YLW}
	@echo -e ${CL_YLW}"                          #StayBroken                           "${CL_YLW}
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_BLU}"================================================================"${CL_BLU}
	@echo -e ${CL_RST}"$(BROKEN_TARGET_PACKAGE)"${CL_RST}
	@echo -e ${CL_BLU}"================================================================"${CL_BLU}
	@echo -e ${CL_CYN}"Package Complete: $(BROKEN_TARGET_PACKAGE)"${CL_RST}
