OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.2085713832530254) q1; cx q0,q1; h q1; }
gate gate_P169 q0,q1,q2,q3,q4 { y q0; rz(2.2696491094590683) q1; z q2; rzz(1.4034970056241056) q0,q2; rzx(2.2085713832530254) q4,q3; rzz(1.3328729039704512) q1,q4; z q3; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P169 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
