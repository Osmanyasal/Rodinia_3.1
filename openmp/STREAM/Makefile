CC = gcc
CFLAGS = -O2 -fopenmp

FC = gfortran
FFLAGS = -O2 -fopenmp

all: stream


stream : stream.o
	g++ $(CFLAGS) ../../optkit_cwrapper.o stream.o -o stream -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp

stream.o: stream.c
	$(CC) -c $(CFLAGS) stream.c -o stream.o

clean:
	rm -f stream_f.exe stream_c.exe *.o

# an example of a more complex build line for the Intel icc compiler
stream.icc: stream.c
	icc -O3 -xCORE-AVX2 -ffreestanding -qopenmp -DSTREAM_ARRAY_SIZE=80000000 -DNTIMES=20 stream.c -o stream.omp.AVX2.80M.20x.icc
