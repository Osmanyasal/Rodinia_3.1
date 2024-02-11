all: OPENMP/kmeans SERIAL/kmeans ../../optkit_cwrapper.o

OPENMP/kmeans:
	cd kmeans_openmp; make
	
SERIAL/kmeans:
	cd kmeans_serial; make

../../optkit_cwrapper.o:
	cd ../../ && make wrapper

clean:
	cd kmeans_serial; make clean
	cd kmeans_openmp; make clean
	
