OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.613600240778981) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.397582933815935) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
csx q[1],q[0];
rz(4.3778892428228895) q[2];
y q[2];
s q[2];
u3(3.535345937801952,4.368606592908116,4.683393457567903) q[3];
h q[3];
s q[3];
u(3.454959745185462,3.060467057735768,0.9403645552787832) q[4];
rzx(3.613600240778981) q[4],q[1];
cx q[6],q[5];
cu(0.46744041543852893,0.715682506352053,3.529018544322962,6.103677960525099) q[0],q[6];
x q[0];
ryy(5.397582933815935) q[1],q[6];
s q[5];
cx q[4],q[5];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];