OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.7092154302476907) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
ryy(2.7092154302476907) q[2],q[1];
rx(0.6693776629722922) q[1];
x q[2];
id q[4];
y q[4];
cp(1.107668248285612) q[3],q[5];
sxdg q[5];
rzz(2.4971086050828926) q[0],q[6];
sdg q[0];
csx q[3],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
