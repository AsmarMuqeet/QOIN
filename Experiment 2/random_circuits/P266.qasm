OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.7779012622649155) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
id q[0];
u3(3.0161458194943767,2.111758470022691,1.3737313833305371) q[1];
u2(5.412240374150557,0.4400137569156197) q[2];
rzx(4.7779012622649155) q[1],q[2];
cp(6.105144923602857) q[3],q[4];
cy q[0],q[3];
id q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
