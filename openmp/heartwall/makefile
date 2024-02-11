
ifdef OUTPUT
override OUTPUT = -DOUTPUT
endif

CPP = g++

# link objects(binaries) together
heartwall: main.o ./AVI/avilib.o ./AVI/avimod.o
	$(CPP) ../../optkit_cwrapper.o  main.o ./AVI/avilib.o ./AVI/avimod.o -o heartwall  -I/usr/local/include/optkit/ -I/usr/local/include/spdlog -fopenmp -loptkit -lGLEW -lglfw3 -lGL -lspdlog -lpfm -ldl -lpthread -lm -fopenmp

# compile main function file into object (binary)
main.o: main.c define.c kernel.c
	gcc $(OUTPUT) main.c -I./AVI -c -O3 -fopenmp

./AVI/avilib.o ./AVI/avimod.o:
	cd AVI; make;

# delete all object files
clean:
	rm -f *.o AVI/*.o heartwall
