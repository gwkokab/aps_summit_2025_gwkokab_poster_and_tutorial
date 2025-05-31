#!/bin/bash

source enviornment_variables.sh

numactl --cpunodebind=8,9 --physcpubind=64-79,192-207 --membind=8 genie_n_pls_m_gs \
    --vt-json "./vt.json" \
    --error-size 6000 \
    --num-realizations 5 \
    --model-json "./model.json" \
    --err-json "./err.json" \
    --pmean-json "./pmean.json" \
    --add-truncated-normal-spin
