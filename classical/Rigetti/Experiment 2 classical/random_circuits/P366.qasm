OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.269461521183908) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
cz q[0],q[2];
u1(4.844520660861425) q[0];
rxx(0.47156085252390584) q[1],q[4];
id q[1];
cp(0.6828917083990611) q[3],q[5];
rzx(2.269461521183908) q[2],q[3];
cp(2.4112099071381774) q[5],q[4];
sdg q[6];
sxdg q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
