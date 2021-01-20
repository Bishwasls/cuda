/* This program queries the device information using the built-in API functions, and outputs everything to STDOUT */
/* No GPU programming is involved */

#include <stdio.h>

int main(int argc, char **argv)
{
  int device;
  cudaDeviceProp prop;
   
  device = 0;
  if(argc > 1) device = atoi(argv[1]);
  cudaGetDeviceProperties(&prop, device);
  
  printf("%s%s\n", "Device name: ", prop.name);
  printf("%s%d%s%d\n", "Compute capability: ", prop.major, ".", prop.minor);
  printf("%s%d\n", "Number of MPs is ", prop.multiProcessorCount);
  printf("%s%lu%s\n", "Device memmory is ", prop.totalGlobalMem / 1024 / 1024, " MB"); // %lu -- size_t, long unsigned int
  printf("%s%d%s\n", "L2 cache memory is ", prop.l2CacheSize / 1024 / 1024,  " MB");
  printf("%s%d%s%d%s\n", "Maximum number of threads: ", prop.maxThreadsPerBlock, " per block, ",
	 prop.maxThreadsPerMultiProcessor, " per MP");
  printf("%s%d%s%d%s\n", "Register memory: ",  prop.regsPerBlock / 256, " kB per block, ",
	 prop.regsPerMultiprocessor / 256, " kB per MP");
  printf("%s%lu%s%lu%s\n", "Shared memory: ", prop.sharedMemPerBlock / 1024, " kB per block, ",
	 prop.sharedMemPerMultiprocessor / 1024," kB per MP");
  
  printf("%s%d\n", "Single precision perfornamce ratio: ", prop.singleToDoublePrecisionPerfRatio);
  
  return 0;
}
