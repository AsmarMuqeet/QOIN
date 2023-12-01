OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.6783133144675726) q1; cx q0,q1; h q1; }
gate gate_P47 q0,q1,q2,q3,q4,q5,q6 { x q0; id q1; rz(0.8342877451542204) q2; cswap q2,q0,q1; rx(4.2239696096612755) q2; s q3; id q3; csx q1,q3; swap q1,q2; ry(6.131163407940205) q4; rzz(5.152165258552741) q6,q5; cz q4,q5; y q4; tdg q5; cu1(1.7532448503295568) q3,q5; u(2.981830530396341,1.0895348015935526,4.72963740599964) q6; rzx(1.6783133144675726) q6,q0; swap q4,q0; sx q6; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[3];
gate_P47 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
