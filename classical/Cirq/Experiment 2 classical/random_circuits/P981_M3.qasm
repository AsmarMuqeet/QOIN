OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.729454476261261) q1; cx q0,q1; h q1; }
gate gate_P981 q0,q1,q2,q3,q4,q5,q6 { y q1; s q1; x q2; p(1.1901184354149728) q3; cu3(4.661310196201344,0.4896788371002653,0.8799491581468484) q3,q2; cy q4,q0; u1(3.478735517709366) q0; sx q5; rzx(2.729454476261261) q4,q5; rz(4.904819348300164) q6; tdg q6; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P981 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
