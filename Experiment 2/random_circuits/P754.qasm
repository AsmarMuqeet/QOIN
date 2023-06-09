OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.210511636672384,0.5119721084939681,-0.5119721084939681) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.6228089052292445) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
u3(1.559569089869633,5.824054090181938,1.9698941068710483) q[0];
u1(1.980812992589196) q[0];
h q[1];
rz(2.333538309864185) q[1];
rz(1.7425139572132122) q[2];
rz(3.4248782037011596) q[2];
r(0.210511636672384,2.0827684352888647) q[3];
s q[4];
ryy(4.6228089052292445) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
