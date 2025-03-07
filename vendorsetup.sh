echo 'Hello! we need to clone stuffs needed for your device, please wait tll process complete'

echo 'Nuke Source stuffs'
#	rm -rf hardware/qcom-caf/sm8450/audio/agm
#	rm -rf hardware/qcom-caf/sm8450/audio/pal
	rm -rf hardware/qcom-caf/sm8450/audio/graphservices/*
	rm -rf hardware/qcom-caf/sm8450/audio/graphservices/.github

cd hardware/qcom-caf/sm8450/audio/agm
git checkout 62ac0643c907e9566ed99929d947127d8e3b123e
cd ../pal
git checkout 4dfc6be2ac56b7d4aa5b2d919823e612ce1c711b
git revert f3af214667071cd42394f05708633b0ae75eb819
cd ../../../../..

echo 'Cloning Basic Call Recorder Tree'
	git clone https://github.com/xiaomi-sm8450-marble/android_vendor_bcr -b 15 vendor/bcr

#echo 'Cloning Hardware Audio Tree'
#	git clone https://github.com/xiaomi-sm8450-marble/android_vendor_qcom_opensource_agm -b 15 hardware/qcom-caf/sm8450/audio/agm
#	git clone https://github.com/xiaomi-sm8450-marble/android_vendor_qcom_opensource_arpal-lx -b 15 hardware/qcom-caf/sm8450/audio/pal

#echo 'Cloning Hardware Display Tree'
#	git clone https://github.com/Evolution-X/hardware_qcom_display -b lineage-22.1-caf-sm8450 hardware/qcom-caf/sm8450/display

echo 'Cloning Kernel Tree'
	git clone --depth=1 https://github.com/xiaomi-sm8450-marble/android_kernel_xiaomi_sm8450.git -b 15 kernel/xiaomi/sm8450
	git clone --depth=1 https://github.com/cupid-development/android_kernel_xiaomi_sm8450-modules -b lineage-22.1 kernel/xiaomi/sm8450-modules
	git clone --depth=1 https://github.com/cupid-development/android_kernel_xiaomi_sm8450-devicetrees -b lineage-22.1 kernel/xiaomi/sm8450-devicetrees
