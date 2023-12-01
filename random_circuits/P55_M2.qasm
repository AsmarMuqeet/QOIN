OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.9126652728654496) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P55 q0,q1,q2,q3,q4 { id q1; x q2; cy q2,q1; u1(0.32815677254046016) q2; cu3(0.6638536398558148,4.492382683615434,3.9967343512893847) q3,q0; h q0; u2(1.6332811268566485,0.6267488433603207) q4; ryy(1.9126652728654496) q3,q4; rxx(0.9192201173120502) q0,q3; cz q4,q1; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[3];
gate_P55 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
