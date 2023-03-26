OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(2.419151708265202,-0.31592508084904947,0.31592508084904947) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.955048565558966) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
swap q[0],q[1];
r(2.419151708265202,1.254871245945847) q[1];
cp(5.078060358204544) q[2],q[3];
rzx(5.955048565558966) q[2],q[0];
sx q[3];
sx q[4];
y q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
