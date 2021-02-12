#include <stdio.h>
#include <cuda_runtime.h>

#define N 64

__global__ void add(int *a, int *b, int *c)
{
  int idx = threadIdx.x;
  if (idx < N)
    {
      c[idx] = a[idx] + b[idx];
    }
}

int main()
{
  int *a, *b, *c;
  int *dev_a, *dev_b, *dev_c;
  
  // Allocate memory space for host a, b, and c
  a = (int *)malloc(N*sizeof(int));
  b = (int *)malloc(N*sizeof(int));
  c = (int *)malloc(N*sizeof(int));
  
  // Allocate memory space for device copies of a, b, and c
  cudaMalloc((void **) &dev_a, N*sizeof(int));
  cudaMalloc((void **) &dev_b, N*sizeof(int));
  cudaMalloc((void **) &dev_c, N*sizeof(int));
  
  // Fill host Arrays
  for (int i = 0; i < N; i++)
    {
      a[i] = i;
      b[i] = 1;
    }

  // Copy from host to device
  cudaMemcpy(dev_a, a, N*sizeof(int), cudaMemcpyHostToDevice);
  cudaMemcpy(dev_b, b, N*sizeof(int), cudaMemcpyHostToDevice);

  // Launch the add() kernel on GPU
  add<<<1,N>>>(dev_a, dev_b, dev_c); // 1 block of N threads

  // Copy result back to host
  cudaMemcpy(c, dev_c, N*sizeof(int), cudaMemcpyDeviceToHost);

  // Free device memory
  cudaFree(dev_a);
  cudaFree(dev_b);
  cudaFree(dev_c);
  
    // Print the result
  for (int i = 0; i < N; i++)
    {
      printf("%d + %d = %d\n", a[i], b[i], c[i]);
    }
  
  return 0;
}
