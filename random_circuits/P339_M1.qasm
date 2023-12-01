OPENQASM 2.0;
include "qelib1.inc";
gate gate_P339 q0,q1,q2,q3,q4 { rxx(3.062046926202926) q2,q1; u1(1.8855014396245637) q2; tdg q3; t q3; cu3(1.7807606909005802,5.959737345073286,5.777243216694186) q0,q4; sdg q0; rxx(2.306192448847786) q4,q1; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P339 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
