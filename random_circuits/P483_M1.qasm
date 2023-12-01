OPENQASM 2.0;
include "qelib1.inc";
gate gate_P483 q0,q1,q2,q3,q4 { h q0; sxdg q1; h q1; ry(3.7341140927948606) q2; ry(0.2727543918098184) q2; t q2; h q3; cu1(2.6322793304788394) q0,q3; rxx(4.960769600535866) q1,q0; u(3.9373862073632453,4.230778465178633,3.1347634953839125) q3; rx(3.794294001524981) q4; sdg q4; x q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[4];
gate_P483 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
