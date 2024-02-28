CC = g++
CFLAGS = -O2 -fopenmp -mcmodel=medium
 
 
stream_c.exe: stream.cc
	$(CC) $(CFLAGS) stream.cc -o stream_c.exe -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp

clean:
	rm -f stream_f.exe stream_c.exe *.o
