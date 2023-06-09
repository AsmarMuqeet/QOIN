OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.07663395617886) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
u1(2.7764603402521297) q[0];
tdg q[2];
h q[3];
rzx(4.07663395617886) q[1],q[4];
csx q[0],q[4];
tdg q[0];
cu1(3.9123857647747537) q[1],q[3];
x q[1];
cu(4.739954577457021,5.567540964176638,3.548736228000607,1.6903247890391109) q[4],q[3];
ry(1.9595551459438425) q[5];
cx q[2],q[5];
rxx(3.2782520947171396) q[2],q[5];
sx q[6];
rx(1.47041015682528) q[6];
u3(4.545263754008125,2.2833913757114197,1.31887433312897) q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
