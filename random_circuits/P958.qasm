OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.04588233225943,-0.5252738318738153,0.5252738318738153) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.7923447369142194) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
h q[1];
r(5.04588233225943,1.0455224949210813) q[2];
ryy(2.7923447369142194) q[3],q[0];
rxx(0.318838557756919) q[0],q[2];
rxx(2.0376612044336553) q[4],q[5];
cswap q[4],q[1],q[5];
x q[6];
cy q[6],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
