#!/bin/bash
source ./enviornment_variables.sh
dir=pop-plots
mkdir $dir

for i in {0..4}; do

    gwk_scatter2d \
        --data data/realization_$i/injections.dat \
        --output $dir/m1m2_inj_$i.png \
        --x-value-column-name mass_1_source \
        --y-value-column-name mass_2_source \
        --xlabel "\$m_1/M_\odot$" \
        --ylabel "\$m_2/M_\odot$" \
        --color data/realization_$i/color.dat \
        --x-scale "log" \
        --y-scale "log" \
        --legend "BBH (Power Law)" "BBH (Peak)" "BNS" "NSBH"

    gwk_batch_scatter2d \
        --data "data/realization_$i/posteriors/event_*.dat" \
        --output $dir/m1m2_batch_$i.png \
        --x-value-column-name mass_1_source \
        --y-value-column-name mass_2_source \
        --xlabel "\$m_1\$" \
        --ylabel "\$m_2\$" \
        --title "Posterior Data (Realization $i)"

done
