OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.044513927707804) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P473 q0,q1,q2,q3,q4 { sx q2; id q2; ryy(6.044513927707804) q3,q0; u(1.9222077498905736,4.78434536236009,4.628832657934261) q0; rzz(0.34335149747935007) q4,q1; ry(4.77274977395978) q1; cu(3.6682520908286067,2.05383804289072,2.2847661527486003,4.990932485243574) q3,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P473 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
