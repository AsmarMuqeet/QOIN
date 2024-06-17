OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.548835990637423) q1; cx q0,q1; h q1; }
gate gate_P776 q0,q1,q2,q3,q4 { x q0; id q1; x q3; cswap q1,q0,q3; t q1; h q3; swap q2,q4; rx(1.7636668374347335) q2; h q2; rxx(3.727127021944939) q2,q3; sx q4; cz q0,q4; rzx(5.548835990637423) q0,q1; tdg q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P776 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
