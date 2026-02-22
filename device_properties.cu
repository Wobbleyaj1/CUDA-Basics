#include <stdio.h>
#include <cuda_runtime.h>

int main() {

    // Ask CUDA how many GPUs are available
    int deviceCount = 0;
    cudaError_t err = cudaGetDeviceCount(&deviceCount);

    // Loop over each GPU and print its properties
    for (int i = 0; i < deviceCount; i++) {

        // cudaDeviceProp is a struct that holds all device info
        cudaDeviceProp prop;
        cudaGetDeviceProperties(&prop, i);

        printf("Device: %s\n", prop.name);
        printf("Compute Capability: %d.%d\n", prop.major, prop.minor);
        printf("Multiprocessors (SMs): %d\n", prop.multiProcessorCount);
        printf("Max Threads per SM: %d\n", prop.maxThreadsPerMultiProcessor);
        printf("Max Threads per Block: %d\n", prop.maxThreadsPerBlock);

        int clockRateKHz = 0;
        cudaDeviceGetAttribute(&clockRateKHz, cudaDevAttrClockRate, i);
        printf("Clock Rate: %d kHz\n", clockRateKHz);
    }

    return 0;
}
