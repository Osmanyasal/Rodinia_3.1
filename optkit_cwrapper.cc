#include <optkit.hh>

extern "C"
{
	int main_c(int argc, char** argv);
}
 
int main(int argc, char** argv)
{
	OptimizerKit optkit{false};
	OPTKIT_RAPL(main_block,argv[0]);

	return main_c(argc,argv);
}
