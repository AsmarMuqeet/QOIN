OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.8060643845028881) q1; cx q0,q1; h q1; }
gate rzx_139921316866128(param0) q0,q1 { h q1; cx q0,q1; rz(1.6470094918392015) q1; cx q0,q1; h q1; }
gate gate_P263 q0,q1,q2,q3,q4 { sdg q0; cu1(4.953873380682049) q2,q1; rz(0.9524520263470496) q1; sdg q2; rzx_139921316866128(1.6470094918392015) q1,q2; z q3; u2(1.3469301282187762,0.8616720229468949) q3; y q4; rzx(0.8060643845028881) q0,q4; u2(1.741577310576476,1.0986315006242868) q0; cx q3,q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P263 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
