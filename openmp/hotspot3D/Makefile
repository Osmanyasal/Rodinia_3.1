CC = gcc
CCFLAGS = -g -fopenmp -O3
OUTPUT = *.out

CPP = g++

all: 3D
	$(CPP) ../../optkit_cwrapper.o  3D.o -o 3D  -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp

3D:
	$(CC) -c -o 3D.o $(CCFLAGS) 3D.c -lm 

clean:
	rm -f 3D $(OUTPUT)
	rm -f ./*.o
