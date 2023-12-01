OPENQASM 2.0;
include "qelib1.inc";
gate gate_P564 q0,q1,q2,q3,q4 { ccx q0,q2,q3; sx q2; cu(1.1810831286236174,0.6357055967348633,5.595539595680016,4.8562258351061125) q1,q4; csx q0,q4; cu3(5.3090769939195726,6.230187194820806,4.761970639086939) q3,q1; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P564 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
