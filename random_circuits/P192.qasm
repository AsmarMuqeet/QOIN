OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.8580455201632639) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
rzx(0.8580455201632639) q[1],q[0];
tdg q[2];
u2(5.354988192209002,4.887280132162685) q[2];
rx(0.9696880418924736) q[3];
u3(5.756227121743741,5.4104352519138965,3.584252762193882) q[3];
id q[4];
ccx q[4],q[1],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
