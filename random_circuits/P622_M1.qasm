OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.6155496209368154) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P622 q0,q1,q2,q3,q4,q5,q6 { x q0; p(4.844267639684262) q2; ccx q3,q4,q5; swap q3,q5; t q4; cu(0.8759493367796698,3.4512900182354525,4.98734090472428,5.274006748963233) q1,q6; cu(6.094583039773742,5.504181726448665,4.681799704126054,4.792376921111684) q0,q6; ryy(2.6155496209368154) q1,q2; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[0];
gate_P622 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
