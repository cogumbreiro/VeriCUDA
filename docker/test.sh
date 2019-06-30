#!/bin/bash

vericuda vectorAdd.cu vectorAdd1
vericuda vectorAdd.cu vectorAdd
vericuda scp.cu scp
vericuda rotate.cu rotate
vericuda matrixMul.cu matrixMulCUDA
vericuda count_up.cu count_up
vericuda diffusion1d.cu diffusion1d_naive
vericuda mask.cu mask
vericuda mask.cu nonterm
vericuda tests.cu modify_param
vericuda tests.cu test1

# vericuda vectorAdd.cu vectorAdd_non_unif # Non-provable
# vericuda vectorAdd.cu vectorAddDownward  # Non-provable
# vericuda matrixMul.cu matrixMul          # Non-provable
# vericuda matrixMul.cu matrixMul2         # Non-provable
# vericuda matrixMul.cu matrixMul4         # Gets stuck
# vericuda matrixMul.cu matrixMulk         # Gets stuck
# vericuda diffusion1d.cu diffusion1d      # Gets stuck
# vericuda mask.cu uniform                 # Crashes: Stack overflow
