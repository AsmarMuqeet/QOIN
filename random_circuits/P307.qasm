OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.549076796143837) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
u3(5.805224785657355,3.3920735580275942,2.0359765865394226) q[0];
rzx(4.549076796143837) q[1],q[3];
cu(0.9439396706148742,0.42602193548483436,2.6556959952998915,0.824171661933849) q[4],q[2];
cu3(3.066606559606513,0.9831044688814419,4.20592965663528) q[2],q[3];
p(2.832795403776449) q[4];
p(0.06820941856694003) q[5];
sdg q[5];
sdg q[6];
cswap q[6],q[0],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];