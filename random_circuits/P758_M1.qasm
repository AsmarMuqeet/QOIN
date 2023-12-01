OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.128335513127181,4.0404913694651565,-4.0404913694651565) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.3481284047314532) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P758 q0,q1,q2,q3,q4,q5,q6 { tdg q1; cx q0,q2; csx q1,q0; rz(2.5412001984769006) q4; t q4; cswap q3,q5,q6; ryy(1.3481284047314532) q2,q3; r(4.128335513127181,5.611287696260053) q5; u1(5.490847828582455) q6; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[4];
gate_P758 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
