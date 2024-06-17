OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.480545242411306) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P456 q0,q1,q2,q3,q4 { s q0; sx q1; cu3(5.20782059136801,2.0141129212305096,4.3092192941676375) q0,q1; ryy(2.480545242411306) q1,q0; x q2; sxdg q2; swap q4,q3; cx q4,q3; cz q3,q2; sdg q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P456 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
