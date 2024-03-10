#!/bin/bash

#cores_0_smt="10-19"
#cores_1_smt="30-39"

#cores_0_no_smt="10-15"
#cores_1_no_smt="35-39"

cores_0_smt="0-9"
cores_1_smt="20-29"


cores_0_no_smt="0-5"
cores_1_no_smt="25-29"
# Loop through each item in the current directory

##!-------------------------------------- HOTSPOT3D && LAVAMD --------------------------------------------!##

##!--------------- SMT ENABLED ----------------!##
(cd hotspot3D && export OMP_NUM_THREADS=10 && taskset -c $cores_0_smt ./3D 512 8 10000 ../../data/hotspot3D/power_512x8 ../../data/hotspot3D/temp_512x8 output.out && echo "Hotspot3D job completed successfully") &
(cd lavaMD && export OMP_NUM_THREADS=10 && taskset -c $cores_1_smt ./lavaMD -cores 10 -boxes1d 40 && echo "lavaMD job completed successfully") &
wait

##!--------------- SMT DISABLED ----------------!##
# (cd hotspot3D && export OMP_NUM_THREADS=5 && taskset -c $cores_0_no_smt ./3D 512 8 10000 ../../data/hotspot3D/power_512x8 ../../data/hotspot3D/temp_512x8 output.out && echo "Hotspot3D job completed successfully") &
# (cd lavaMD && export OMP_NUM_THREADS=5 && taskset -c $cores_1_no_smt ./lavaMD -cores 5 -boxes1d 40 && echo "lavaMD job completed successfully") &
# wait


## HOTSPOT3D && CFD
##!--------------- SMT ENABLED ----------------!##
# (cd hotspot3D && export OMP_NUM_THREADS=10 && taskset -c $cores_0_smt ./3D 512 8 10000 ../../data/hotspot3D/power_512x8 ../../data/hotspot3D/temp_512x8 output.out && echo "Hotspot3D job completed successfully") &
# (cd cfd && export OMP_NUM_THREADS=10 && taskset -c $cores_1_smt ./euler3d_cpu_th_10 ../../data/cfd/missile.domn.0.2M && echo "CFD job completed successfully") &
# wait

##!--------------- SMT DISABLED ----------------!##
# (cd hotspot3D && export OMP_NUM_THREADS=5 && taskset -c $cores_0_no_smt ./3D 512 8 10000 ../../data/hotspot3D/power_512x8 ../../data/hotspot3D/temp_512x8 output.out && echo "Hotspot3D job completed successfully") &
# (cd cfd && export OMP_NUM_THREADS=5 && taskset -c $cores_1_no_smt ./euler3d_cpu_th_5 ../../data/cfd/missile.domn.0.2M && echo "CFD job completed successfully") &
# wait



## HOTSPOT3D && BFS
##!--------------- SMT ENABLED ----------------!##
# (cd hotspot3D && export OMP_NUM_THREADS=10 && taskset -c $cores_0_smt ./3D 512 8 10000 ../../data/hotspot3D/power_512x8 ../../data/hotspot3D/temp_512x8 output.out && echo "Hotspot3D job completed successfully") &
# (cd bfs && export OMP_NUM_THREADS=10 && taskset -c $cores_1_smt ./bfs 10 ../../data/bfs/graph16M.txt && echo "BFS job completed successfully") &
# wait

##!--------------- SMT DISABLED ----------------!##
# (cd hotspot3D && export OMP_NUM_THREADS=5 && taskset -c $cores_0_no_smt ./3D 512 8 10000 ../../data/hotspot3D/power_512x8 ../../data/hotspot3D/temp_512x8 output.out && echo "Hotspot3D job completed successfully") &
# (cd bfs && export OMP_NUM_THREADS=5 && taskset -c $cores_1_no_smt ./bfs 5 ../../data/bfs/graph16M.txt && echo "BFS job completed successfully") &
# wait




##!-------------------------------------- BFS && CFD --------------------------------------------!##


##!--------------- SMT ENABLED ----------------!##
# (cd bfs && export OMP_NUM_THREADS=10 && taskset -c $cores_0_smt ./bfs 10 ../../data/bfs/graph16M.txt && echo "BFS job completed successfully") &
# (cd cfd && export OMP_NUM_THREADS=10 && taskset -c $cores_1_smt ./euler3d_cpu_th_10 ../../data/cfd/missile.domn.0.2M && echo "CFD job completed successfully") &
# wait

##!--------------- SMT DISABLED ----------------!##
# (cd bfs && export OMP_NUM_THREADS=5 && taskset -c $cores_0_no_smt ./bfs 5 ../../data/bfs/graph16M.txt && echo "BFS job completed successfully") &
# (cd cfd && export OMP_NUM_THREADS=5 && taskset -c $cores_1_no_smt ./euler3d_cpu_th_5 ../../data/cfd/missile.domn.0.2M && echo "CFD job completed successfully") &
# wait