OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.3501168439850117,0.41483434933281416,-0.41483434933281416) q0; }
gate gate_P610 q0,q1,q2,q3,q4 { s q0; r(1.3501168439850117,1.9856306761277107) q0; y q1; cswap q2,q3,q4; csx q1,q2; cx q1,q0; cu1(0.3453780965612767) q0,q1; sdg q2; sxdg q3; sxdg q4; cu(0.3823077317992915,5.942640255637403,1.3424055319337118,4.947929117104329) q4,q3; rxx(1.6453229628171009) q2,q3; z q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P610 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
