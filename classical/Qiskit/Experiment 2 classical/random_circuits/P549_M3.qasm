OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.2878083046915587) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(4.489384705849747,3.2156847302171574,-3.2156847302171574) q0; }
gate gate_P549 q0,q1,q2,q3,q4,q5,q6 { ry(0.030956983718280394) q1; cswap q3,q2,q0; rzz(1.2730280748494607) q0,q3; cz q1,q2; t q5; r(4.489384705849747,4.786481057012054) q5; ryy(3.2878083046915587) q4,q6; cu3(2.8043107774939235,2.830361589122365,1.843408383543574) q6,q4; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[1];
gate_P549 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
