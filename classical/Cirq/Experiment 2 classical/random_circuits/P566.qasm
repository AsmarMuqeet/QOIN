OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.554732381489649,-1.5448200147262747,1.5448200147262747) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.1307093827781465) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
sx q[2];
u2(0.8579358088686424,5.41748865300169) q[2];
r(5.554732381489649,0.025976312068621856) q[3];
u3(1.8686983440475933,1.1979292978661622,5.300996484056776) q[3];
h q[4];
swap q[5],q[0];
h q[0];
cp(3.0501274382149237) q[1],q[6];
rzx(6.1307093827781465) q[5],q[1];
cry(3.268567412207031) q[6],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];