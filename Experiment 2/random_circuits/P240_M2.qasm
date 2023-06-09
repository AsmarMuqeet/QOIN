OPENQASM 2.0;
include "qelib1.inc";
gate gate_P240 q0,q1,q2,q3,q4 { sdg q0; sdg q2; cx q0,q2; cu3(2.110002407748814,1.207666615226053,1.0566142198503758) q1,q3; p(2.0200811525009326) q1; u2(4.077302226434956,3.3846752101483437) q3; u3(4.347885218077793,0.8324881672209657,3.035096599244179) q4; u1(5.5465762759147506) q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P240 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
