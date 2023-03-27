OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
y q[0];
h q[1];
p(5.36731514156745) q[1];
u2(3.8583221880388052,6.0550767472539695) q[1];
u3(0.2876968698529094,5.76613644048043,1.6379703530958722) q[3];
t q[3];
y q[3];
csx q[2],q[4];
cx q[2],q[0];
u3(2.9473190845387816,2.4970081428278905,0.01768564327127364) q[0];
sdg q[2];
z q[4];
u2(4.079006866493708,2.218516684845449) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];