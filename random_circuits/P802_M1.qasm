OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.06452584071753076) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(1.2244005448584754,1.909840371840092,-1.909840371840092) q0; }
gate gate_P802 q0,q1,q2,q3,q4 { id q0; id q0; t q1; u1(1.505130147737237) q1; h q2; sx q2; y q3; r(1.2244005448584754,3.4806366986349886) q4; rzx(0.06452584071753076) q4,q3; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P802 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
