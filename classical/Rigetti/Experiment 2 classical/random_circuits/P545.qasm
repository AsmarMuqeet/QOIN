OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.34239382518118294,1.5075456427891067,-1.5075456427891067) q0; }
qreg q[7];
creg c[3];
rz(5.260946039936238) q[0];
cx q[3],q[1];
r(0.34239382518118294,3.0783419695840033) q[1];
swap q[2],q[4];
ccx q[2],q[4],q[0];
cy q[6],q[5];
rzz(4.849345265188584) q[3],q[6];
sdg q[5];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
