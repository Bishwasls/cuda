#include <stdio.h>
#include <cuda_runtime.h>
#include <curand_kernel.h>

// Initialize the RNG state for each thread
__global__ void SetUpRNG(int seed, curandState_t* rstates)
{
  int id = blockIdx.x * blockDim.x + threadIdx.x;
  curand_init(seed, id, 0, &rstates[id]);
}

int main(int argc, char **argv)
{
  float *ptr_d;
  size_t pitch;
  int nblocks = 4, tpb = 54;
  int nx = 150, ny = 50;

// RNG
  curandState_t *rstates;
  cudaMalloc(&rstates, nblocks * tpb * sizeof(curandState_t));   

  SetUpRNG<<<nblocks, tpb>>>(time(NULL), rstates);

  cudaFree(rstates);

  // Device memory
  cudaMallocPitch(&ptr_d, &pitch, nx * sizeof(float), ny);

  printf("%s %lu\n", "Pitch is ", pitch);

  cudaFree(ptr_d);

  return 0;
}
