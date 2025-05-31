#!/bin/bash

source ./enviornment_variables.sh

taskset -c 70-100 time sage_n_pls_m_gs \
	--n-pl 1 \
	--n-g 3 \
	--vt-json "./vt.json" \
	--posterior-regex "../genie/data/realization_0/posteriors/*.dat" \
	--prior-json ./prior.json \
	--pmean-json ./pmean.json \
	--flowMC-json ./flowMC.json \
	--posterior-columns mass_1_source mass_2_source a_1 a_2 \
	--add-truncated-normal-spin
