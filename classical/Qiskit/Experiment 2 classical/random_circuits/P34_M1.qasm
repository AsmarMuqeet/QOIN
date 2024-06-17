OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.360847179622864,1.824875486419495,-1.824875486419495) q0; }
gate gate_P34 q0,q1,q2,q3,q4,q5,q6 { ry(4.829520123822121) q0; sx q1; u2(2.3749727864939234,3.8981477531687627) q1; s q2; tdg q2; u2(5.601191431528486,0.04318753213942283) q3; r(5.360847179622864,3.3956718132143915) q3; x q4; rxx(3.1214035139280685) q4,q0; t q5; x q5; rx(0.7912785034870103) q6; u1(4.554183417581713) q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[1];
gate_P34 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];