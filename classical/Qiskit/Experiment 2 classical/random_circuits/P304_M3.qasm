OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.3475452814492455) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy_139921318109248(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.2743222892060703) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P304 q0,q1,q2,q3,q4 { rz(1.0951716931276196) q2; rzz(4.325910574083612) q0,q3; tdg q3; cu(6.272784179646923,4.197470992107859,3.4836395988356226,1.4018980567067896) q4,q1; ryy_139921318109248(0.2743222892060703) q1,q2; ryy(1.3475452814492455) q4,q0; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[4];
gate_P304 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
