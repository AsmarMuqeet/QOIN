OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
sdg q[0];
sdg q[2];
cx q[0],q[2];
cu3(2.110002407748814,1.207666615226053,1.0566142198503758) q[1],q[3];
p(2.0200811525009326) q[1];
u2(4.077302226434956,3.3846752101483437) q[3];
u3(4.347885218077793,0.8324881672209657,3.035096599244179) q[4];
u1(5.5465762759147506) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];