OPENQASM 2.0;
include "qelib1.inc";
gate gate_P21 q0,q1,q2,q3,q4 { rzz(2.7553503569621296) q1,q2; u2(2.3907803569175434,4.083915228731425) q1; u(3.0176263593024064,3.7746146879911344,5.033650090312844) q1; sxdg q3; rzz(2.4854390380009264) q3,q2; u2(5.688545195837346,0.4460514791873934) q2; cx q0,q4; id q0; h q0; sx q4; cy q3,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[3];
gate_P21 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
