OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.447944665368781,0.6149086164541147,-0.6149086164541147) q0; }
qreg q[5];
creg c[3];
h q[1];
cy q[0],q[2];
y q[0];
x q[2];
rz(2.9047490979267367) q[3];
r(4.447944665368781,2.185704943249011) q[3];
sdg q[4];
rxx(2.9604240962544113) q[1],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
