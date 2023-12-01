OPENQASM 2.0;
include "qelib1.inc";
gate gate_P178 q0,q1,q2,q3,q4 { rz(2.1714324036989376) q0; id q0; tdg q2; sxdg q3; z q3; cu1(4.654943035245184) q1,q4; sx q1; cx q4,q2; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[3];
gate_P178 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
