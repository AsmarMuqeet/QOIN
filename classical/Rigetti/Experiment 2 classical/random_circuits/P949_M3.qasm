OPENQASM 2.0;
include "qelib1.inc";
gate rzx_139921335656112(param0) q0,q1 { h q1; cx q0,q1; rz(5.581812112333941) q1; cx q0,q1; h q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.06053131120102) q1; cx q0,q1; h q1; }
gate gate_P949 q0,q1,q2,q3,q4 { x q1; u1(4.5439996342636855) q2; cy q1,q2; rx(1.9367848242068646) q1; u1(1.3493481095849935) q3; h q3; rzx(6.06053131120102) q0,q4; rzx_139921335656112(5.581812112333941) q0,q4; swap q2,q0; cry(0.6978390777416253) q3,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P949 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
