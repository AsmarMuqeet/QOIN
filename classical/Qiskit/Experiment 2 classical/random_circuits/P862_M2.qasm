OPENQASM 2.0;
include "qelib1.inc";
gate gate_P862 q0,q1,q2,q3,q4 { swap q2,q0; u3(1.2634686750194868,0.6094408753429074,5.988266196176605) q0; x q2; cswap q1,q3,q4; cu(2.383003242726386,3.1297731125066357,5.402743047495822,3.579287036631242) q3,q1; u2(0.13479130493936256,0.5176485290328562) q1; rxx(4.09158352428183) q2,q3; u3(2.9365549334845036,3.4357327858946434,5.03951092579739) q4; cp(2.9217193412065865) q0,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[3];
gate_P862 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];