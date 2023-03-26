OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.455230934397082) q1; cx q0,q1; h q1; }
gate gate_P234 q0,q1,q2,q3,q4 { h q0; sdg q0; ccx q1,q3,q2; rzx(3.455230934397082) q2,q1; sx q3; h q4; p(1.9179902875922397) q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P234 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
