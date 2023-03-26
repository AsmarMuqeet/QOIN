OPENQASM 2.0;
include "qelib1.inc";
gate gate_P175 q0,q1,q2,q3,q4 { cswap q1,q2,q0; t q0; u2(4.99612470339186,6.219473724111361) q1; rzz(6.054580410444148) q4,q3; u2(3.881439255271535,3.0403650494461063) q3; cz q4,q2; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[4];
gate_P175 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
