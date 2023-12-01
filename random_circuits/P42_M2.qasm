OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.8319814324361177) q1; cx q0,q1; h q1; }
gate gate_P42 q0,q1,q2,q3,q4 { u1(1.1432318495559204) q1; s q1; x q2; sx q2; rzx(0.8319814324361177) q0,q3; y q0; h q3; id q4; ry(3.0637990324899174) q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P42 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
