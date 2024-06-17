OPENQASM 2.0;
include "qelib1.inc";
gate gate_P475 q0,q1,q2,q3,q4 { x q0; sdg q1; u1(5.041229195250947) q1; rz(1.2295229903607423) q2; cp(4.774970810556925) q2,q0; s q3; t q3; u3(5.703565252663692,3.725766822553897,5.065350717949913) q4; sdg q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[4];
gate_P475 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
