OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.55569083716902,-0.21766660500307822,0.21766660500307822) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.370076557160001) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.7831627723058294) q1; cx q0,q1; h q1; }
gate gate_P278 q0,q1,q2,q3,q4 { x q0; u(5.449358152011265,2.993675001402876,5.066292227813704) q0; sdg q1; sdg q2; rzx(2.7831627723058294) q2,q1; ryy(2.370076557160001) q4,q3; r(4.55569083716902,1.3531297217918183) q3; tdg q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P278 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
