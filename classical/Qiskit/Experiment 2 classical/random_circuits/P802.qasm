OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.2244005448584754,1.909840371840092,-1.909840371840092) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.06452584071753076) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
id q[0];
id q[0];
t q[1];
u1(1.505130147737237) q[1];
h q[2];
sx q[2];
y q[3];
r(1.2244005448584754,3.4806366986349886) q[4];
rzx(0.06452584071753076) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
