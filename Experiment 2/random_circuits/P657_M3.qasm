OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.3723023175784931,0.530326211577826,-0.530326211577826) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.370486650717137) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P657 q0,q1,q2,q3,q4,q5,q6 { cz q2,q1; u3(1.7948421115148279,2.8442863093639716,6.260385943005911) q3; cx q3,q2; cu3(5.095173978353836,4.8715071578078994,2.304648427799549) q5,q4; ryy(1.370486650717137) q1,q5; u3(4.781509859277876,2.8374403184885097,5.853171097974955) q4; cx q0,q6; r(0.3723023175784931,2.1011225383727226) q0; t q6; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P657 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];