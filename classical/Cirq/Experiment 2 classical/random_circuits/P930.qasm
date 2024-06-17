OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.9432190586056026) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
rx(0.3992167072679439) q[1];
h q[2];
h q[3];
cp(1.132816621286947) q[3],q[2];
cp(6.228952166762931) q[0],q[4];
rzx(3.9432190586056026) q[0],q[1];
u1(3.746180582824385) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
