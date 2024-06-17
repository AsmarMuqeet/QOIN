OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.7779012622649155) q1; cx q0,q1; h q1; }
gate gate_P266 q0,q1,q2,q3,q4 { id q0; u3(3.0161458194943767,2.111758470022691,1.3737313833305371) q1; u2(5.412240374150557,0.4400137569156197) q2; rzx(4.7779012622649155) q1,q2; cp(6.105144923602857) q3,q4; cy q0,q3; id q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P266 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
