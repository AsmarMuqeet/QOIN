OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.723062997032856) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P826 q0,q1,q2,q3,q4 { h q0; rzz(2.330996614044359) q2,q3; rxx(3.799812543736536) q2,q0; ryy(3.723062997032856) q1,q4; ccx q4,q3,q1; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P826 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
