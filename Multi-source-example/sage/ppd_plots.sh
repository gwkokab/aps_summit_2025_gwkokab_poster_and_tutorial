#!/bin/bash

source ./cpu_env.sh
dir=inf-plots
mkdir $dir

gwk_ppd_plot \
    --data "./rate_scaled_ppd_weighted.hdf5" \
    --prefix "rate_" \
    --dir $dir \
    --size 14 7 \
    --grid \
    --font-family "Times New Roman" \
    --grid-which "major" \
    --use-latex \
    --x-labels "\$m_{1}\,[M_{\odot}]\$" "\$m_{2},[M_{\odot}]\$" null null \
    --y-labels "\$\frac{\mathrm{d}\mathcal{R}}{dm_{1}} [\mathrm{Gpc}^{-3}\,\mathrm{yr}^{-1}\,M_{\odot}^{-1}]\$" "\$\frac{\mathrm{d}\mathcal{R}}{dm_{2}} [\mathrm{Gpc}^{-3}\,\mathrm{yr}^{-1}\,M_{\odot}^{-1}]\$" null null \
    --titles "Mass (PPD)" "Mass (PPD)" null null \
    --y-scale "log" \
    --x-range 1.0 90.0 \
    --x-range 1.0 90.0 \
    --x-range 0.0 1.0 \
    --x-range 0.0 1.0 \
    --y-range 1e-2 1e5 \
    --y-range 1e-2 1e5

#gwk_ppd_plot \
#    --data "./ppd.hdf5" \
#    --dir $dir \
#    --size 14 7 \
#    --x-range 1.0 100.0 \
#    --x-range 1.0 100.0 \
#    --x-range 0.0 0.5 &
