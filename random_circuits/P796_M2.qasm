OPENQASM 2.0;
include "qelib1.inc";
gate gate_P796 q0,q1,q2,q3,q4 { u3(2.032617836944137,0.5557690402614933,1.2097335482692577) q0; sx q1; rxx(3.125664379111282) q0,q1; rx(2.865762731148084) q2; p(2.762618699654722) q3; csx q3,q2; u1(3.3049732322033134) q4; z q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[3];
gate_P796 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
