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
  CL_BROKEN="\033[38;5;24m"
  CL_SGRY="\033[38;5;239m"
  CL_RST="\033[0m"
endif

BROKEN_TARGET_PACKAGE := $(PRODUCT_OUT)/$(BROKEN_MOD_VERSION).zip

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(BROKEN_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(BROKEN_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(BROKEN_TARGET_PACKAGE).md5sum
	@echo -e " "
	@echo -e ${CL_BROKEN}" "${CL_BROKEN}
	@echo -e ${CL_BROKEN}"                              _______________________________________________  "${CL_BROKEN}
	@echo -e ${CL_BROKEN}"                             /                                  brokenroms.org | "${CL_BROKEN}
	@echo -e ${CL_BROKEN}"                            /   _____________________________________________| "${CL_BROKEN}
	@echo -e ${CL_BROKEN}"                           /   /                                               "${CL_BROKEN}
	@echo -e ${CL_BROKEN}"                          /   /  _  _      "${CL_SGRY}" ______                             "${CL_BROKEN}
	@echo -e ${CL_BROKEN}"                         /   /  | |(_)     "${CL_SGRY}"(_____ \                            "${CL_BROKEN}
	@echo -e ${CL_BROKEN}"                        /   /   | | _ _____ "${CL_SGRY}"_____) )___  _____  ___            "${CL_BROKEN}
	@echo -e ${CL_BROKEN}"  _____________________/   /    | || |     |"${CL_SGRY}"  __  // _ \|     |/___)           "${CL_BROKEN}
	@echo -e ${CL_BROKEN}" |                        /     | || | | | |"${CL_SGRY}" |  \ \ |_| | | | |___ |           "${CL_BROKEN}
	@echo -e ${CL_BROKEN}" |_______________________/       \_)_|_|_|_|"${CL_SGRY}"_|   |_\___/|_|_|_(___/            "${CL_BROKEN}
	@echo -e ${CL_BROKEN}" "${CL_BROKEN}
	@echo -e ${CL_CYN}"Package Complete: $(BROKEN_TARGET_PACKAGE)"${CL_RST}
