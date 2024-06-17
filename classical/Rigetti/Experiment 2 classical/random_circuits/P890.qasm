OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.3034666597075915) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(4.829387979121575,1.1754795085020713,-1.1754795085020713) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.7268018491735235) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
rxx(2.854121214993937) q[1],q[2];
id q[2];
rzx(2.3034666597075915) q[3],q[0];
r(4.829387979121575,2.746275835296968) q[0];
u1(1.9400043944181835) q[3];
sdg q[4];
ryy(2.7268018491735235) q[1],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
