OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.548917934065378) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy_139921317557008(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.9331573726474454) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.856964479677471) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
sx q[0];
ryy(5.548917934065378) q[3],q[1];
cu3(4.807948312390429,2.9169780621857417,2.623237444426405) q[1],q[0];
p(3.0728476889131704) q[0];
csx q[2],q[4];
rz(4.089238913929798) q[2];
cp(0.02036620327365957) q[4],q[3];
ryy_139921317557008(3.9331573726474454) q[3],q[1];
h q[3];
rzx(4.856964479677471) q[4],q[2];
cswap q[1],q[2],q[0];
id q[1];
t q[2];
cz q[3],q[0];
id q[4];
s q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
