OPENQASM 2.0;
include "qelib1.inc";
gate ryy_139921335592608(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.5489097742296468) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.131479062468992) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P427 q0,q1,q2,q3,q4 { ryy(5.131479062468992) q0,q1; x q0; p(3.3853250039119263) q1; cx q1,q0; u(3.2332444536514156,3.7532520179604734,2.1104141251639823) q2; sdg q2; y q3; rx(4.58829723517219) q4; ryy_139921335592608(0.5489097742296468) q4,q3; csx q2,q4; u3(0.37473683713300504,4.5999385145155705,3.668550264548315) q3; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[2];
gate_P427 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
