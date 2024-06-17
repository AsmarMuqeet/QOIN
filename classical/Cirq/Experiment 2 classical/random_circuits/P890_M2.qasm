OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.7268018491735235) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(4.829387979121575,1.1754795085020713,-1.1754795085020713) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.3034666597075915) q1; cx q0,q1; h q1; }
gate gate_P890 q0,q1,q2,q3,q4 { rxx(2.854121214993937) q1,q2; id q2; rzx(2.3034666597075915) q3,q0; r(4.829387979121575,2.746275835296968) q0; u1(1.9400043944181835) q3; sdg q4; ryy(2.7268018491735235) q1,q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P890 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
