OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.455230934397082) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
h q[0];
sdg q[0];
ccx q[1],q[3],q[2];
rzx(3.455230934397082) q[2],q[1];
sx q[3];
h q[4];
p(1.9179902875922397) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
