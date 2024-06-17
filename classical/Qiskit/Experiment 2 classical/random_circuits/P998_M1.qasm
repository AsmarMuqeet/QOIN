OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.0112989509037758) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P998 q0,q1,q2,q3,q4 { sx q0; ryy(3.0112989509037758) q1,q2; tdg q1; s q2; s q3; cp(1.973670192096685) q0,q3; ry(4.360580843335443) q4; u3(3.2001261678535937,0.4848140275970964,4.138605206524246) q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P998 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
