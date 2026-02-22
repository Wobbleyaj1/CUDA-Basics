CUDA Device Properties
======================

Prints hardware properties for all CUDA-capable GPUs on the machine.

Compile:
    nvcc device_properties.cu -o device_properties

Run:
    .\device_properties
    
Note (Windows): nvcc requires cl.exe in PATH:
    cmd /c "vcvars64.bat && nvcc device_properties.cu -o device_properties"
