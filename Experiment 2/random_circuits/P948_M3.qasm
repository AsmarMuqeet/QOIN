OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.028014892069141,1.5048136251242337,-1.5048136251242337) q0; }
gate gate_P948 q0,q1,q2,q3,q4 { r(1.028014892069141,3.0756099519191302) q0; tdg q1; cu1(1.5833496267059524) q0,q1; cx q3,q2; sxdg q2; u3(0.02573232472877084,4.10198959336775,2.567156073788911) q4; ch q3,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P948 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
