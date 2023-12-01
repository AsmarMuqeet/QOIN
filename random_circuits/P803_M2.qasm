OPENQASM 2.0;
include "qelib1.inc";
gate gate_P803 q0,q1,q2,q3,q4 { cu(3.6102655571765974,4.876873490644369,0.17464408107710452,2.794778983725167) q2,q3; cswap q0,q1,q4; ry(1.4683343528286295) q0; u2(0.032847191369439865,4.686057556788718) q1; ccx q2,q3,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P803 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
