OPENQASM 2.0;
include "qelib1.inc";
gate gate_P692 q0,q1,q2,q3,q4 { u3(6.0151708112281215,2.0379281522801533,0.5279570544553519) q0; h q1; x q3; cp(5.131545328678709) q4,q2; swap q0,q4; ccx q2,q1,q3; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P692 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
