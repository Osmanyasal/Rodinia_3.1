include common/make.config

RODINIA_BASE_DIR := $(shell pwd)

CUDA_BIN_DIR := $(RODINIA_BASE_DIR)/bin/linux/cuda
OMP_BIN_DIR := $(RODINIA_BASE_DIR)/bin/linux/omp

CUDA_DIRS := cfd heartwall kmeans lavaMD 
OMP_DIRS  := cfd heartwall kmeans lavaMD 
OCL_DIRS  := cfd heartwall kmeans lavaMD 

all: wrapper CUDA OMP ##OPENCL

wrapper:
	g++ -c optkit_cwrapper.cc -o optkit_cwrapper.o -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread

CUDA:  
	cd cuda/cfd; 			make;	cp euler3d euler3d_double pre_euler3d pre_euler3d_double $(CUDA_BIN_DIR)
	cd cuda/heartwall;  	make;	cp heartwall $(CUDA_BIN_DIR)
	cd cuda/kmeans; 		make;	cp kmeans $(CUDA_BIN_DIR)
	cd cuda/lavaMD;			make;	cp lavaMD $(CUDA_BIN_DIR)
	
OMP:
	cd openmp/cfd; 					make;	cp euler3d_cpu euler3d_cpu_double pre_euler3d_cpu pre_euler3d_cpu_double $(OMP_BIN_DIR)
	cd openmp/heartwall;  			make;	cp heartwall $(OMP_BIN_DIR)
	cd openmp/kmeans/kmeans_openmp;	make;	cp kmeans $(OMP_BIN_DIR)
	cd openmp/lavaMD;				make;	cp lavaMD $(OMP_BIN_DIR)

clean: CUDA_clean OMP_clean wrapper_clean

wrapper_clean:
	rm ./optkit_cwrapper.o

CUDA_clean:
	cd $(CUDA_BIN_DIR); rm -f *
	for dir in $(CUDA_DIRS) ; do cd cuda/$$dir ; make clean ; cd ../.. ; done
	
OMP_clean:
	cd $(OMP_BIN_DIR); rm -f *
	for dir in $(OMP_DIRS) ; do cd openmp/$$dir ; make clean ; cd ../.. ; done

