#include <libinit_utils.h>
#include <libinit_variant.h>
#include <vector>
static const variant_info_t serenity_info = {
    .hwc_value = "",
    .sku_value = "",
    .brand = "Redmi",
    .device = "serenity",
    .marketname = "Redmi Note 13",
    .model = "25028RN03A",
    .build_fingerprint = "Redmi/mivendor_ums9230/mivendor_ums9230:15/AP3A.240905.015.A2/A15.0.11.0.VGWIDXM:user/release-keys",
};
static const std::vector<variant_info_t> variants = {
    serenity_info,
};
void vendor_load_properties() {
    search_variant(variants);
}
