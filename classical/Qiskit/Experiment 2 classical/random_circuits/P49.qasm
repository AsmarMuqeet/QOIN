OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.274158276625099,-0.2925754929611579,0.2925754929611579) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.937277184351206) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
t q[1];
cp(2.4143394086192935) q[0],q[2];
csx q[0],q[1];
r(5.274158276625099,1.2782208338337386) q[2];
sx q[4];
sxdg q[4];
h q[5];
tdg q[5];
rzx(3.937277184351206) q[3],q[6];
cry(5.064684610493573) q[6],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
