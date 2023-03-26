OPENQASM 2.0;
include "qelib1.inc";
gate gate_P153 q0,q1,q2,q3,q4 { sxdg q2; ccx q1,q3,q0; sxdg q1; ccx q3,q0,q2; ccx q0,q1,q2; cu1(1.54452663065976) q1,q0; u3(1.7934972296735656,2.5173675995509743,4.126016101237885) q2; u(5.683142760053114,3.87039205972584,0.4605472730658934) q3; u1(2.6383141861819457) q4; id q4; sxdg q4; crx(0.900032038761249) q4,q3; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P153 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
