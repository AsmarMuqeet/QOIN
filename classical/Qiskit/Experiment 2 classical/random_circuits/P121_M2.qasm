OPENQASM 2.0;
include "qelib1.inc";
gate gate_P121 q0,q1,q2,q3,q4 { cp(2.3464175688108915) q1,q2; tdg q1; cp(0.9989873728060565) q3,q0; rx(5.86454881390718) q0; u(2.0493242611261335,5.596441094051867,2.648287645738922) q3; ry(1.2332519673974112) q4; cz q2,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[3];
gate_P121 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
