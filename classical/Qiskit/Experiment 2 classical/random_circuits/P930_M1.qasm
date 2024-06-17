OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.9432190586056026) q1; cx q0,q1; h q1; }
gate gate_P930 q0,q1,q2,q3,q4 { rx(0.3992167072679439) q1; h q2; h q3; cp(1.132816621286947) q3,q2; cp(6.228952166762931) q0,q4; rzx(3.9432190586056026) q0,q1; u1(3.746180582824385) q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[1];
gate_P930 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
