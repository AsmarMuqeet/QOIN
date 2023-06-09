OPENQASM 2.0;
include "qelib1.inc";
gate gate_P730 q0,q1,q2,q3,q4 { u(3.9021042737260814,2.150738468510508,1.6520966010987634) q0; rz(0.29823142968143435) q0; x q1; sx q1; cu3(5.661645806277453,3.279710573834481,6.117415925469961) q3,q2; p(6.064106301448165) q2; sx q3; x q4; tdg q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P730 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
