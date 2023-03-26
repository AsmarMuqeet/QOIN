OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.9919099042519743,3.1400382345265987,-3.1400382345265987) q0; }
gate gate_P256 q0,q1,q2,q3,q4 { r(3.9919099042519743,4.710834561321495) q0; h q0; swap q2,q1; cu1(5.915759532534876) q4,q3; cswap q2,q3,q1; sx q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P256 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
