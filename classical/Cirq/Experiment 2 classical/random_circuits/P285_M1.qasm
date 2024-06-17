OPENQASM 2.0;
include "qelib1.inc";
gate rzx_139921317117904(param0) q0,q1 { h q1; cx q0,q1; rz(4.865466422062348) q1; cx q0,q1; h q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.1469744896323357) q1; cx q0,q1; h q1; }
gate gate_P285 q0,q1,q2,q3,q4,q5,q6 { y q0; rzx(2.1469744896323357) q3,q1; rzx_139921317117904(4.865466422062348) q0,q3; u1(5.770856602474196) q1; cu1(3.1743110360788176) q5,q2; cu3(4.688176635498232,1.0552741914322226,4.812711109865922) q6,q4; id q4; cswap q6,q5,q2; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P285 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
