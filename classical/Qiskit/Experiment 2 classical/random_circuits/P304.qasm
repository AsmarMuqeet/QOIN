OPENQASM 2.0;
include "qelib1.inc";
gate ryy_139921318109248(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.2743222892060703) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.3475452814492455) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
rz(1.0951716931276196) q[2];
rzz(4.325910574083612) q[0],q[3];
tdg q[3];
cu(6.272784179646923,4.197470992107859,3.4836395988356226,1.4018980567067896) q[4],q[1];
ryy_139921318109248(0.2743222892060703) q[1],q[2];
ryy(1.3475452814492455) q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
