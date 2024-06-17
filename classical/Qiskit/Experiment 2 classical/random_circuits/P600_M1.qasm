OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.152791689156672) q1; cx q0,q1; h q1; }
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate gate_P600 q0,q1,q2,q3,q4,q5,q6 { z q1; t q1; u1(1.729101612883667) q3; rxx(2.531511594596906) q4,q2; cu(1.8847028637844896,5.701355388097324,0.18102230907694583,2.7198866916052937) q5,q0; rz(4.466150580916485) q0; id q0; iswap q3,q5; cry(1.8911808814335638) q3,q5; sxdg q6; cswap q4,q6,q2; rzx(1.152791689156672) q2,q1; swap q4,q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[0];
gate_P600 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
