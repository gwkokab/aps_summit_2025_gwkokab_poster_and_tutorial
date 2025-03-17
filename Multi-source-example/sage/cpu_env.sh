#!/bin/bash

export JAX_PLATFORMS=cpu

# Use full logical CPUs
export NPROC=32
export OMP_NUM_THREADS=$NPROC
export MKL_NUM_THREADS=$NPROC
export OPENBLAS_NUM_THREADS=$NPROC
export intra_op_parallelism_threads=$NPROC

# Disable GPU settings
unset CUDA_VISIBLE_DEVICES

# XLA Configuration
#export XLA_FLAGS="--xla_cpu_multi_thread_eigen=true intra_op_parallelism_threads=$NPROC"
#export XLA_PYTHON_CLIENT_ALLOCATOR=platform
#export XLA_PYTHON_CLIENT_PREALLOCATE=false

# Enable higher precision (optional)
export JAX_ENABLE_X64=1

# Set JAX Compilation Cache (recommended)
export JAX_COMPILATION_CACHE_DIR="$HOME/jax_cache"
