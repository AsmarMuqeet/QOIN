OPENQASM 2.0;
include "qelib1.inc";
gate gate_P182 q0,q1,q2,q3,q4 { s q1; y q2; h q2; cx q0,q3; s q0; cy q1,q3; rz(0.48331287075344365) q4; u(5.871271190231522,3.058712713108139,1.4894528213359999) q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[4];
gate_P182 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
