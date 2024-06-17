OPENQASM 2.0;
include "qelib1.inc";
gate gate_P349 q0,q1,q2,q3,q4 { sx q0; sdg q0; cu(3.2276055580924434,3.6866183642462933,4.609700686440769,1.1610486279268166) q3,q1; sdg q1; swap q2,q4; rx(5.544267590209876) q2; ccx q0,q2,q1; crz(0.03889826280392693) q4,q3; u1(3.7083801333191504) q3; sxdg q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P349 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
