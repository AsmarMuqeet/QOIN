OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.955048565558966) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(2.419151708265202,-0.31592508084904947,0.31592508084904947) q0; }
gate gate_P354 q0,q1,q2,q3,q4 { swap q0,q1; r(2.419151708265202,1.254871245945847) q1; cp(5.078060358204544) q2,q3; rzx(5.955048565558966) q2,q0; sx q3; sx q4; y q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P354 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
