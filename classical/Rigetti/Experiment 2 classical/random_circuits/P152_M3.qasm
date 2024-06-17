OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.64219771048821) q1; cx q0,q1; h q1; }
gate gate_P152 q0,q1,q2,q3,q4 { u(1.45391984913682,2.65681415000069,0.7535095821474814) q0; sxdg q1; z q2; csx q1,q2; p(4.001349715274581) q3; ry(4.205544918952341) q3; t q4; rzx(1.64219771048821) q4,q0; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P152 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
