OPENQASM 2.0;
include "qelib1.inc";
gate gate_P71 q0,q1,q2,q3,q4 { rz(1.1336471689737868) q0; y q0; cz q2,q1; ry(3.2863054509225362) q3; cy q3,q2; h q4; cx q1,q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P71 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
