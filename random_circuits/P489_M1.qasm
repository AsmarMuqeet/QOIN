OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.447944665368781,0.6149086164541147,-0.6149086164541147) q0; }
gate gate_P489 q0,q1,q2,q3,q4 { h q1; cy q0,q2; y q0; x q2; rz(2.9047490979267367) q3; r(4.447944665368781,2.185704943249011) q3; sdg q4; rxx(2.9604240962544113) q1,q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P489 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
