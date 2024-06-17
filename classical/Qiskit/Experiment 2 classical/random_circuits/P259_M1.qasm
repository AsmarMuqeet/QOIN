OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.1050332654388214,2.4516342259885473,-2.4516342259885473) q0; }
gate gate_P259 q0,q1,q2,q3,q4 { z q0; cz q3,q2; csx q0,q3; h q2; csx q2,q0; r(0.1050332654388214,4.022430552783444) q0; u(4.801794512336326,5.236288610024202,4.315715064471705) q3; cu1(4.503562041820633) q1,q4; u1(2.4083108671491327) q1; tdg q1; cswap q2,q3,q1; rx(1.4548138699997626) q4; sx q4; h q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P259 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
