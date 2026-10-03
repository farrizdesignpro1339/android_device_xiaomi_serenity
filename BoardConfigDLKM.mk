#
# DLKM kernel modules - Redmi A5 (serenity)
# From stock dump (kernel 5.15.194).
# NOTE: do NOT set BOARD_VENDOR_KERNEL_MODULES (kernel.mk populates
# vendor_dlkm automatically from all built modules). Only the LOAD
# list is needed (drives modules.load, basename format).
#

# Stock boot load order (vendor_dlkm/modules.load; ntfs3.ko absent in dump).
BOARD_VENDOR_KERNEL_MODULES_LOAD += \
    unisoc_userlog.ko \
    trusty.ko \
    trusty-pm.ko \
    trusty-log.ko \
    trusty-irq.ko \
    trusty-ipc.ko \
    trusty-virtio.ko \
    sprd_shm.ko \
    cfg80211.ko \
    sprd-bc1p2.ko \
    sprd_usbpinmux.ko \
    sprd_aphang.ko \
    unisoc_mm_emem.ko \
    sprd-dma.ko \
    system_heap.ko \
    unisoc-iommu.ko \
    ion_ipc_trusty.ko \
    cma_heap.ko \
    apsys-dvfs.ko \
    unisoc_multi_control.ko \
    sprd_cpu_cooling.ko \
    extcon-usb-gpio.ko \
    core.ko \
    gpio.ko \
    pinctrl.ko \
    leds-sc27xx-bltc.ko \
    ledtrig-pattern.ko \
    pinctrl-sprd.ko \
    pinctrl-sprd-qogirl6.ko \
    spi-sprd.ko \
    pwm-sprd.ko \
    sc27xx_adc.ko \
    sc27xx-poweroff.ko \
    sc27xx_tsensor_thermal.ko \
    sprd_ddr_dvfs.ko \
    dmc_drv.ko \
    unisoc_last_kmsg.ko \
    cpufreq_userspace.ko \
    sprd_freq_limit.ko \
    sprd_bcl.ko \
    thermal-generic-adc.ko \
    sprd_virt_thm.ko \
    sprd_tcpm.ko \
    phy-sprd-commonphy.ko \
    phy-sprd-qogirl6.ko \
    sc27xx_typec.ko \
    sprd_battery_info.ko \
    sc27xx_fuel_gauge.ko \
    sprd_uid.ko \
    sgm41513-charger.ko \
    sprd-charger-manager.ko \
    sprd_typec_displayport.ko \
    sc27xx_pd.ko \
    sprd_map.ko \
    ims_bridge.ko \
    sprd_pmic_wdt.ko \
    musb_hdrc.ko \
    musb_sprd.ko \
    cpufreq_userspace.ko \
    sprd_cp_dvfs.ko \
    mipiserdes_base.ko \
    ums9230_serdes.ko \
    sprd_coresight.ko \
    sprd_coresight-tmc.ko \
    sprd_coresight-funnel.ko \
    sprd_coresight-replicator.ko \
    sprd_coresight-etm4x.ko \
    sprd_coresight-apetb-ctrl.ko \
    sprd_coresight-apetb-main.ko \
    kts_sync.ko \
    unisoc_mm_reclaim.ko \
    zram.ko \
    zsmalloc.ko \
    unisoc_pnp.ko \
    cpumaxfreq.ko \
    unisoc_binder.ko \
    sla_core.ko \
    kprobe_iomonitor.ko \
    sprd_powerupcause.ko \
