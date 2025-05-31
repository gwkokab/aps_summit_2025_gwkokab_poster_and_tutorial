#!/bin/bash

source ./cpu_env.sh

ppd_n_pls_m_gs \
    --filename ppd_weighted.hdf5 \
    --constants constants.json \
    --nf-samples-mapping nf_samples_mapping.json \
    --range mass_1_source 0.5 100.0 500 \
    --range mass_2_source 0.5 100.0 500 \
    --range a_1 0.001 1.0 2 \
    --range a_2 0.001 1.0 2 \
    --sample-filename "./sampler_data/nf_samples_unweighted.dat" \
    --spin-truncated-normal \
    --batch-size 1000 

#ppd_n_pls_m_gs \
#    --filename ppd_weighted.hdf5 \
#    --constants constants.json \
#    --nf-samples-mapping nf_samples_mapping.json \
#    --range mass_1_source 2.0 100.0 200 \
#    --range mass_2_source 2.0 100.0 200 \
#    --range ecc 0.01 1.0 200 \
#    --sample-filename "./sampler_data/nf_samples_weighted.dat" \
#    --n-threads 64
