# Temporary override for Nord SoC bring-up.
# Nord kernel support is available in the 'qcom-next' branch with
# tag: qcom-next-7.3-rc4-20261013, but we can't move to this tag
# globally yet due to test failures on other SoCs.
# To work around this, only use this tag for Nord. Drop this file once
# all SoCs are functional against a single 'qcom-next' tag.

# tag: qcom-next-7.3-rc4-20261013
LINUX_VERSION:nord = "7.2+7.3-rc4+nord"
SRCREV:nord = "cb7a416d2476d022a449e7d52475c28a6feb390d"

