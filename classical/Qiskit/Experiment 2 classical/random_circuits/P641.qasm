OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.3414831460607237) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
sx q[1];
sxdg q[2];
cp(1.1682886066760403) q[3],q[0];
sxdg q[0];
cx q[3],q[1];
ry(1.2906437845786982) q[4];
ryy(1.3414831460607237) q[5],q[6];
cry(4.203339423709516) q[4],q[5];
cz q[6],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
