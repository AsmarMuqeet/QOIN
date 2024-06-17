OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(6.145564919197171,3.142372465158064,-3.142372465158064) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.103810336989568) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P880 q0,q1,q2,q3,q4,q5,q6 { ryy(6.103810336989568) q0,q1; rx(4.546524037303271) q0; sxdg q2; sx q3; u(5.574868466149284,4.218388944361952,5.491478231984801) q3; rz(2.9010022476679866) q4; swap q2,q4; cswap q2,q0,q3; u2(0.18044941255216534,4.5945411903052165) q5; sx q5; p(3.3978680399489614) q6; swap q6,q1; ccx q1,q5,q4; r(6.145564919197171,4.713168791952961) q6; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[4];
gate_P880 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
