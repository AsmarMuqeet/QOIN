OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.1412990738696784) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(4.135192364756018,0.1281442487085258,-0.1281442487085258) q0; }
gate gate_P115 q0,q1,q2,q3,q4 { s q0; sx q1; t q2; rx(5.509978771493742) q2; x q2; sdg q3; swap q3,q1; r(4.135192364756018,1.6989405755034224) q1; rz(6.177879682790268) q3; u1(4.674031928368595) q4; ryy(2.1412990738696784) q0,q4; ry(2.3309734301909857) q0; p(5.742020304912791) q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P115 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
