OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.06053131120102) q1; cx q0,q1; h q1; }
gate rzx_139921335656112(param0) q0,q1 { h q1; cx q0,q1; rz(5.581812112333941) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
x q[1];
u1(4.5439996342636855) q[2];
cy q[1],q[2];
rx(1.9367848242068646) q[1];
u1(1.3493481095849935) q[3];
h q[3];
rzx(6.06053131120102) q[0],q[4];
rzx_139921335656112(5.581812112333941) q[0],q[4];
swap q[2],q[0];
cry(0.6978390777416253) q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
