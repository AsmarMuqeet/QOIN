OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.910107373188529) q1; cx q0,q1; h q1; }
gate gate_P27 q0,q1,q2,q3,q4 { u2(3.8054862374623704,5.3705672881051045) q2; x q2; u2(0.42391259556737965,4.608879290743862) q2; h q3; cswap q0,q1,q4; rxx(0.698645079930347) q1,q3; rzx(5.910107373188529) q4,q0; cu1(2.537000719884058) q0,q1; swap q3,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P27 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
