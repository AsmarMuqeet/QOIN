OPENQASM 2.0;
include "qelib1.inc";
gate gate_P295 q0,q1,q2,q3,q4 { rxx(5.153734837169721) q0,q2; csx q0,q2; u1(2.4370147874829162) q2; y q3; sdg q3; csx q3,q0; p(1.9198161687447095) q0; id q3; cu1(6.073283728930258) q4,q1; swap q4,q1; sdg q1; cz q2,q1; cx q2,q3; id q2; sdg q3; tdg q4; id q4; cswap q4,q0,q1; u(0.5223834328995907,3.740226991889866,0.3865450854485316) q0; u2(5.146921589642884,0.425433648871421) q1; tdg q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P295 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
