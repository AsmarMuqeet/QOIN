OPENQASM 2.0;
include "qelib1.inc";
gate gate_P709 q0,q1,q2,q3,q4 { rzz(4.314351309230848) q0,q1; u(3.3442423385895244,4.170016929627673,5.28668446743143) q0; id q0; sx q1; id q1; s q3; sx q3; cu(2.331706928505292,4.092133248148088,4.811633693937822,3.2369700045473073) q2,q4; u(4.939608879949236,5.5666596622086875,1.4440882894241784) q2; u(2.430287313696714,4.456604445381364,6.170945662316488) q2; sxdg q4; cp(1.8003901576540866) q4,q3; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[4];
gate_P709 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];