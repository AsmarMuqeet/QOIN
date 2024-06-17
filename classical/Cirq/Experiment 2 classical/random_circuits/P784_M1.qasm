OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.5232999500121566) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(5.90365312820899,1.4828846805227234,-1.4828846805227234) q0; }
gate gate_P784 q0,q1,q2,q3,q4 { y q0; r(5.90365312820899,3.05368100731762) q1; h q2; u1(4.584005968653195) q3; cswap q1,q3,q2; u(2.0347534451544567,6.199798020321993,1.5686058225065154) q1; sdg q3; z q4; ryy(0.5232999500121566) q4,q0; cswap q2,q4,q0; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[2];
gate_P784 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
