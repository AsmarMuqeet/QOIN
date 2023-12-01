OPENQASM 2.0;
include "qelib1.inc";
gate gate_P586 q0,q1,q2,q3,q4 { id q0; u(4.315461000914879,4.093582890522974,2.566190467527074) q1; sx q1; rxx(5.917484630186902) q3,q2; sx q2; cx q3,q0; x q4; id q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P586 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
