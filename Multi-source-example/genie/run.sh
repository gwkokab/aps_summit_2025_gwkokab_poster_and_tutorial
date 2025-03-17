#!/bin/bash

source enviornment_variables.sh

taskset -c 21-40 genie_n_pls_m_gs \
    --vt-json "./vt.json" \
    --error-size 2000 \
    --num-realizations 5 \
    --model-json "./model.json" \
    --err-json "./err.json" \
    --pmean-json "./pmean.json" \
    --no-eccentricity \
    --no-tilt \
    --no-redshift \
    --spin-truncated-normal
