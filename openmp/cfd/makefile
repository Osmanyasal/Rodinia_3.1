CUDA_SDK_PATH = /af10/sc5nf/NVIDIA_CUDA_SDK

all: euler3d_cpu
 
euler3d_cpu: euler3d_cpu.cpp
	echo "Being created for 1"; \
	g++ -O3 -Dblock_length=1 euler3d_cpu.cpp -o euler3d_cpu_th_1 -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp; \
	i=1; \
	while [ $$i -lt $(shell nproc) ]; do \
        i=$$(($$i * 2)); \
        echo "Being created for $$i"; \
        g++ -O3 -Dblock_length=$$i euler3d_cpu.cpp -o euler3d_cpu_th_$$i -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp; \
    done

clean:
	rm -f euler3d_cpu_th*
	rm euler3d_cpu
