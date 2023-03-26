OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.5460834975610918,4.297285772181305,-4.297285772181305) q0; }
gate gate_P620 q0,q1,q2,q3,q4,q5,q6 { r(0.5460834975610918,5.868082098976202) q1; u2(2.533443318027567,5.789099208555089) q1; sdg q2; swap q0,q3; sx q0; z q4; s q4; cz q5,q6; cswap q3,q6,q2; u3(3.4439503460625343,6.258979833676326,4.770831165508421) q5; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[3];
gate_P620 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
