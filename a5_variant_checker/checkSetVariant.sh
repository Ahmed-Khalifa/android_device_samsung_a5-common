dualsim_variants=( A500H A500G A500M A500F )
singlesim_variants=( A500FU A500L A500K A500S A500Y A500W )

for d in {1..4}
do
getprop ro.bootloader | grep -q ${dualsim_variants[d]}
if ["$?" == "0"]; then
if ["${dualsim_variants[d]}" == "A500H"]; then
echo "you're all set."
else
currentVariant=${dualsim_variants[d]}
echo "Your device is dual sim phone, SM-${dualsim_variants[d]}"
set_variant();
fi
fi
done

for s in {1..6}
do
getprop ro.bootloader | grep -q ${singlesim_variants[s]}
if ["$?" == "0"]; then
currentVariant=${singlesim_variants[s]}
echo "Your device is single sim phone, SM-${singlesim_variants[s]}"
set_variant();
fi
done

function set_variant(){
case "$currentVariant" in
A500G)
echo "ro.product.model=SM-$currentVariant" >> /system/build.prop
sed -i -e 's/ro.product.name=a53gxx/ro.product.name=a5ltedd/g' /system/build.prop
sed -i -e 's/ro.rr.device=a53g/ro.rr.device=a5lte/g' /system/build.prop
;;

A500M)
echo "ro.product.model=SM-$currentVariant" >> /system/build.prop
sed -i -e 's/ro.product.name=a53gxx/ro.product.name=a5lteub/g' /system/build.prop
sed -i -e 's/ro.rr.device=a53g/ro.rr.device=a5lte/g' /system/build.prop
;;

A500F)
echo "ro.product.model=SM-$currentVariant" >> /system/build.prop
sed -i -e 's/ro.product.name=a53gxx/ro.product.name=????/g' /system/build.prop
sed -i -e 's/ro.rr.device=a53g/ro.rr.device=a5lte/g' /system/build.prop
;;

#For single sim variants.
A500FU)
echo "ro.product.model=SM-$currentVariant" >> /system/build.prop
sed -i -e 's/ro.product.name=a53gxx/ro.product.name=a5ultexx/g' /system/build.prop
sed -i -e 's/ro.rr.device=a53g/ro.rr.device=a5ulte/g' /system/build.prop
sed -i -e 's/persist.radio.multisim.config=dsds/persist.radio.multisim.config=none/g' /system/build.prop
;;

A500L)
echo "ro.product.model=SM-$currentVariant" >> /system/build.prop
sed -i -e 's/ro.product.name=a53gxx/ro.product.name=a5lteub/g' /system/build.prop
sed -i -e 's/ro.rr.device=a53g/ro.rr.device=a5lte/g' /system/build.prop
sed -i -e 's/persist.radio.multisim.config=dsds/persist.radio.multisim.config=none/g' /system/build.prop
;;

A500K)
echo "ro.product.model=SM-$currentVariant" >> /system/build.prop
sed -i -e 's/ro.product.name=a53gxx/ro.product.name=a5lteub/g' /system/build.prop
sed -i -e 's/ro.rr.device=a53g/ro.rr.device=a5lte/g' /system/build.prop
sed -i -e 's/persist.radio.multisim.config=dsds/persist.radio.multisim.config=none/g' /system/build.prop
;;

A500S)
echo "ro.product.model=SM-$currentVariant" >> /system/build.prop
sed -i -e 's/ro.product.name=a53gxx/ro.product.name=a5lteub/g' /system/build.prop
sed -i -e 's/ro.rr.device=a53g/ro.rr.device=a5lte/g' /system/build.prop
sed -i -e 's/persist.radio.multisim.config=dsds/persist.radio.multisim.config=none/g' /system/build.prop
;;

A500Y)
echo "ro.product.model=SM-$currentVariant" >> /system/build.prop
sed -i -e 's/ro.product.name=a53gxx/ro.product.name=a5lteub/g' /system/build.prop
sed -i -e 's/ro.rr.device=a53g/ro.rr.device=a5lte/g' /system/build.prop
sed -i -e 's/persist.radio.multisim.config=dsds/persist.radio.multisim.config=none/g' /system/build.prop
;;

A500W)
echo "ro.product.model=SM-$currentVariant" >> /system/build.prop
sed -i -e 's/ro.product.name=a53gxx/ro.product.name=a5lteub/g' /system/build.prop
sed -i -e 's/ro.rr.device=a53g/ro.rr.device=a5lte/g' /system/build.prop
sed -i -e 's/persist.radio.multisim.config=dsds/persist.radio.multisim.config=none/g' /system/build.prop
;;
}
