OPENQASM 2.0;
include "qelib1.inc";
gate gate_P885 q0,q1,q2,q3,q4 { tdg q0; rz(6.160500261364152) q0; h q2; rx(2.19411055544254) q3; rxx(0.12126932487614878) q2,q3; cz q1,q4; sx q1; id q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[4];
gate_P885 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
