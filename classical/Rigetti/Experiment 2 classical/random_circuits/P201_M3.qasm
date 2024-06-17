OPENQASM 2.0;
include "qelib1.inc";
gate gate_P201 q0,q1,q2,q3,q4 { u2(5.114853052156159,1.9268567161299204) q2; ry(4.98324353571128) q2; cz q1,q3; cu(1.6448259080095093,1.2720734368422808,1.268333135522033,3.6685331211656123) q0,q4; swap q1,q4; cz q3,q0; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P201 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
