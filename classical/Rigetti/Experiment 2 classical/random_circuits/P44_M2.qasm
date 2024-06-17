OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.6991156157919014) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(1.5653894965594626,-0.8551920103977322,0.8551920103977322) q0; }
gate gate_P44 q0,q1,q2,q3,q4,q5,q6 { tdg q1; swap q0,q3; r(1.5653894965594626,0.7156043163971644) q0; id q4; tdg q4; rzx(0.6991156157919014) q2,q5; cswap q5,q2,q1; h q6; cu(1.4793805847015424,4.585421228283478,6.177647648152031,2.986174003371638) q3,q6; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P44 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
