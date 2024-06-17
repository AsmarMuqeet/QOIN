OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.890785697003504,-0.7108371148332407,0.7108371148332407) q0; }
qreg q[5];
creg c[3];
sx q[0];
r(3.890785697003504,0.8599592119616558) q[0];
z q[1];
u1(4.727775788058872) q[1];
sdg q[2];
x q[2];
swap q[3],q[4];
cx q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
