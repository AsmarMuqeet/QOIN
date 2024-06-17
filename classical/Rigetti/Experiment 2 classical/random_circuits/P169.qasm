OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.2085713832530254) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
y q[0];
rz(2.2696491094590683) q[1];
z q[2];
rzz(1.4034970056241056) q[0],q[2];
rzx(2.2085713832530254) q[4],q[3];
rzz(1.3328729039704512) q[1],q[4];
z q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
