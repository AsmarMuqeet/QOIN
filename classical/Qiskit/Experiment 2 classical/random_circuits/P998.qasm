OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.0112989509037758) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
sx q[0];
ryy(3.0112989509037758) q[1],q[2];
tdg q[1];
s q[2];
s q[3];
cp(1.973670192096685) q[0],q[3];
ry(4.360580843335443) q[4];
u3(3.2001261678535937,0.4848140275970964,4.138605206524246) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
