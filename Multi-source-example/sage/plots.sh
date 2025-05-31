#!/bin/bash
source ./cpu_env.sh
dir=inf-plots
mkdir $dir

gwk_corner_plot \
    --data "./sampler_data/nf_samples_unweighted.dat" \
    --output $dir/nf_samples_unweighted.png \
    --bin 50 \
    --scale 3 \
    --show-titles \
    --labels alpha_pl_0 beta_pl_0 m1_loc_g_0 m1_loc_g_1 m1_loc_g_2 m2_loc_g_0 m1_scale_g_0 m1_scale_g_1 m1_scale_g_2 mmax_pl_0 mmin_pl_0 chi1_scale_g_0 chi1_scale_g_1 chi1_scale_g_2 chi1_scale_pl_0 log_rate_0 log_rate_1 log_rate_2 log_rate_3 \
    --truths 3.0 0.2 40.0 1.5 15.0 20.0 4.0 1.5 4.0 86.0 5.0 0.3 0.05 0.4 0.2 6.0 3.0 8.0 6.0 \
    --smooth 

gwk_corner_plot \
    --data "./sampler_data/nf_samples_weighted.dat" \
    --output $dir/nf_samples_weighted.png \
    --bin 50 \
    --scale 3 \
    --show-titles \
    --labels alpha_pl_0 beta_pl_0 m1_loc_g_0 m1_loc_g_1 m1_loc_g_2 m2_loc_g_0 m1_scale_g_0 m1_scale_g_1 m1_scale_g_2 mmax_pl_0 mmin_pl_0 chi1_scale_g_0 chi1_scale_g_1 chi1_scale_g_2 chi1_scale_pl_0 log_rate_0 log_rate_1 log_rate_2 log_rate_3 \
    --truths 3.0 0.2 40.0 1.5 15.0 20.0 4.0 1.5 4.0 86.0 5.0 0.3 0.05 0.4 0.2 6.0 3.0 8.0 6.0 \
    --smooth


gwk_chain_plot \
    --data "./sampler_data/local_accs.dat" \
    --output $dir/local_accs.png \
    --dimension 2 \
    --label "training" "production" \
    --title "Local Acceptance Rates" \
    --width 10 \
    --alpha 1.0

gwk_chain_plot \
    --data "./sampler_data/global_accs.dat" \
    --output $dir/global_accs.png \
    --dimension 2 \
    --label "training" "production" \
    --title "Global Acceptance Rates" \
    --width 10 \
    --alpha 1.0 

gwk_chain_plot \
    --data "./sampler_data/train_chains_*.dat" \
    --output $dir/train_chains.png \
    --dimension 16 \
    --labels alpha_pl_0 beta_pl_0 m1_loc_g_0 m1_loc_g_1 m1_loc_g_2 m2_loc_g_0 mmax_pl_0 mmin_pl_0 chi1_scale_g_0 chi1_scale_g_1 chi1_scale_pl_0 chi2_scale_g_2 log_rate_0 log_rate_1 log_rate_2 log_rate_3 \
    --title "Training Chains" \
    --width 8 \
    --alpha 0.5

gwk_chain_plot \
    --data "./sampler_data/prod_chains_*.dat" \
    --output $dir/prod_chains.png \
    --dimension 16 \
    --title "Production Chains" \
    --width 8 \
    --labels alpha_pl_0 beta_pl_0 m1_loc_g_0 m1_loc_g_1 m1_loc_g_2 m2_loc_g_0 mmax_pl_0 mmin_pl_0 chi1_scale_g_0 chi1_scale_g_1 chi1_scale_pl_0 chi2_scale_g_2 log_rate_0 log_rate_1 log_rate_2 log_rate_3 \
    --alpha 0.5

gwk_chain_plot \
    --data "./sampler_data/log_prob_*.dat" \
    --output $dir/log_prob.png \
    --dimension 2 \
    --label "training" "production" \
    --title "log probs" \
    --width 10

gwk_chain_plot \
    --data "./sampler_data/loss.dat" \
    --output $dir/loss.png \
    --dimension 1 \
    --label "nf loss" \
    --title "NF Sampler Loss" \
    --width 7 \
    --height 7 \
    --alpha 1.0

gwk_r_hat_plot \
    --chains-regex "./sampler_data/prod_chains_*.dat" \
    --labels alpha_pl_0 beta_pl_0 m1_loc_g_0 m1_loc_g_1 m1_loc_g_2 m2_loc_g_0 m1_scale_g_0 m1_scale_g_1 m1_scale_g_2 mmax_pl_0 mmin_pl_0 chi1_scale_g_0 chi1_scale_g_1 chi1_scale_g_2 chi1_scale_pl_0 log_rate_0 log_rate_1 log_rate_2 log_rate_3 \
    --output $dir/r_hat_prod.png

gwk_r_hat_plot \
    --chains-regex "./sampler_data/train_chains_*.dat" \
    --labels alpha_pl_0 beta_pl_0 m1_loc_g_0 m1_loc_g_1 m1_loc_g_2 m2_loc_g_0 m1_scale_g_0 m1_scale_g_1 m1_scale_g_2 mmax_pl_0 mmin_pl_0 chi1_scale_g_0 chi1_scale_g_1 chi1_scale_g_2 chi1_scale_pl_0 log_rate_0 log_rate_1 log_rate_2 log_rate_3 \
    --output $dir/r_hat_train.png

gwk_ess_plot \
    --train-chain-regex "./sampler_data/train_chains_*.dat" \
    --production-chain-regex "./sampler_data/prod_chains_*.dat" \
    --output $dir/ess.png \
    --labels alpha_pl_0 beta_pl_0 m1_loc_g_0 m1_loc_g_1 m1_loc_g_2 m2_loc_g_0 m1_scale_g_0 m1_scale_g_1 m1_scale_g_2 mmax_pl_0 mmin_pl_0 chi1_scale_g_0 chi1_scale_g_1 chi1_scale_g_2 chi1_scale_pl_0 log_rate_0 log_rate_1 log_rate_2 log_rate_3 \
    --width 15 \
    --height 5 

