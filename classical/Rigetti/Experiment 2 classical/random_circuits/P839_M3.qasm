OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.3304822037028863) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(3.4806671613349653,3.3498257801571825,-3.3498257801571825) q0; }
gate gate_P839 q0,q1,q2,q3,q4 { r(3.4806671613349653,4.920622106952079) q0; t q1; t q3; ry(2.7446897839023485) q3; sx q3; id q3; cz q4,q2; ryy(1.3304822037028863) q2,q0; p(0.05473698489677974) q2; cu(1.8850854870220703,6.17272645159211,1.3988261867475564,5.727703973766077) q4,q1; cswap q4,q0,q1; sdg q0; id q1; cz q2,q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P839 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
