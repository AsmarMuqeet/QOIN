OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(6.132551980263765,-1.248453351371881,1.248453351371881) q0; }
gate gate_P273 q0,q1,q2,q3,q4 { rx(2.060097221153167) q2; sxdg q2; ccx q0,q3,q1; cu3(1.0692806531025894,2.463283852355,1.1640287823208924) q0,q1; ccx q2,q0,q1; p(2.0827751232352845) q0; csx q2,q1; r(6.132551980263765,0.3223429754230155) q4; csx q3,q4; cp(6.11243304516595) q4,q3; ch q3,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P273 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
