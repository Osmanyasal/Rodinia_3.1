CUDA_SDK_PATH = /af10/sc5nf/NVIDIA_CUDA_SDK

all: euler3d_cpu #euler3d_cpu_double pre_euler3d_cpu pre_euler3d_cpu_double euler3d_cpu_offload
 
euler3d_cpu: euler3d_cpu.cpp
	g++ -O3 -Dblock_length=1  euler3d_cpu.cpp -o euler3d_cpu_th_1 -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp
	g++ -O3 -Dblock_length=2  euler3d_cpu.cpp -o euler3d_cpu_th_2 -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp
	g++ -O3 -Dblock_length=4  euler3d_cpu.cpp -o euler3d_cpu_th_4 -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp
	g++ -O3 -Dblock_length=8  euler3d_cpu.cpp -o euler3d_cpu_th_8 -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp
	g++ -O3 -Dblock_length=16 euler3d_cpu.cpp -o euler3d_cpu_th_16 -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp
	touch euler3d_cpu

##euler3d_cpu_offload:
##	icc -g -O3 -DOMP_OFFLOAD -Dblock_length=$(MIC_OMP_NUM_THREADS) -fopenmp -offload-option,mic,compiler,"-no-opt-prefetch" ../../optkit_cwrapper.o  euler3d_cpu.cpp -o euler3d_cpu_offload -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp
##
##euler3d_cpu_double: euler3d_cpu_double.cpp
##	g++ -O3 -Dblock_length=$(OMP_NUM_THREADS) -fopenmp ../../optkit_cwrapper.o  euler3d_cpu_double.cpp -o euler3d_cpu_double -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp
##
##pre_euler3d_cpu: pre_euler3d_cpu.cpp
##	g++ -O3 -Dblock_length=$(OMP_NUM_THREADS) -fopenmp ../../optkit_cwrapper.o  pre_euler3d_cpu.cpp -o pre_euler3d_cpu -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp
##
##pre_euler3d_cpu_double: pre_euler3d_cpu_double.cpp
##	g++ -O3 -Dblock_length=$(OMP_NUM_THREADS) -fopenmp ../../optkit_cwrapper.o  pre_euler3d_cpu_double.cpp -o pre_euler3d_cpu_double -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp


clean:
#	rm -f euler3d
	rm -f euler3d_cpu_th*
	rm euler3d_cpu
#	rm -f euler3d_cpu_offload
#	rm -f euler3d_double
#	rm -f euler3d_cpu_double

#	rm -f pre_euler3d
#	rm -f pre_euler3d_cpu
#	rm -f pre_euler3d_double
#	rm -f pre_euler3d_cpu_double
