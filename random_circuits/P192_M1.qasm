OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.8580455201632639) q1; cx q0,q1; h q1; }
gate gate_P192 q0,q1,q2,q3,q4 { rzx(0.8580455201632639) q1,q0; tdg q2; u2(5.354988192209002,4.887280132162685) q2; rx(0.9696880418924736) q3; u3(5.756227121743741,5.4104352519138965,3.584252762193882) q3; id q4; ccx q4,q1,q0; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[4];
gate_P192 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
