OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.2249978571237548) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P319 q0,q1,q2,q3,q4 { z q1; sx q1; u2(2.310887775717571,3.8680910620432996) q2; z q3; z q3; t q3; t q3; h q3; ryy(3.2249978571237548) q4,q0; cy q2,q0; cx q2,q1; cx q2,q1; csx q1,q2; sxdg q1; ry(2.059849859055971) q2; ry(4.100856428890819) q4; cx q4,q0; ry(3.297424039809627) q0; u2(5.254885406186495,3.3484622450254498) q0; rzz(1.1480491278839962) q3,q0; tdg q4; ry(3.1950916507241547) q4; y q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P319 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
