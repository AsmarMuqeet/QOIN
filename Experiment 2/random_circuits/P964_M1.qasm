OPENQASM 2.0;
include "qelib1.inc";
gate gate_P964 q0,q1,q2,q3,q4,q5,q6 { u2(4.982652170998111,0.7986563650059406) q0; u(2.296305354331042,0.5369199168829975,4.061596315326432) q0; id q3; cu3(1.1065777075789092,1.140762944475258,0.3480797599912033) q1,q4; x q1; rxx(3.466721972068284) q3,q4; cx q2,q5; u1(0.7736286304124648) q2; t q6; csx q6,q5; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[2];
gate_P964 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
