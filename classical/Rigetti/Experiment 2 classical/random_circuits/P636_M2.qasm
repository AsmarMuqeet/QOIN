OPENQASM 2.0;
include "qelib1.inc";
gate gate_P636 q0,q1,q2,q3,q4 { u2(3.1626593653156796,5.0485455874461485) q0; x q1; rx(2.442371528124959) q1; rz(3.4612005193889988) q2; sdg q2; y q3; cu3(4.0406944880937585,3.2276506964129568,3.8872275590420298) q0,q3; s q4; sdg q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[3];
gate_P636 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
