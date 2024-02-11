# C compiler
CC = gcc
CC_FLAGS = -g -fopenmp -O2 
CPP = g++

kmeans: cluster.o getopt.o kmeans.o kmeans_clustering.o 
	$(CPP) $(CC_FLAGS) ../../../optkit_cwrapper.o cluster.o getopt.o kmeans.o kmeans_clustering.o  -o kmeans -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread

%.o: %.[ch]
	$(CC) $(CC_FLAGS) $< -c

cluster.o: cluster.c 
	$(CC) $(CC_FLAGS) cluster.c -c
	
getopt.o: getopt.c 
	$(CC) $(CC_FLAGS) getopt.c -c
	
kmeans.o: kmeans.c 
	$(CC) $(CC_FLAGS) kmeans.c -c

kmeans_clustering.o: kmeans_clustering.c kmeans.h
	$(CC) $(CC_FLAGS) kmeans_clustering.c -c

clean:
	rm -f *.o *~ kmeans 
