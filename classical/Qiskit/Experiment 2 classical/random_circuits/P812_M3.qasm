OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.144131182804247,-0.9955579743213062,0.9955579743213062) q0; }
gate gate_P812 q0,q1,q2,q3,q4 { tdg q0; z q0; t q3; r(5.144131182804247,0.5752383524735903) q3; ccx q2,q4,q1; y q1; rz(0.8421624314691512) q2; rx(0.5905983046688563) q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P812 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
