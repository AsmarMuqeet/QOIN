OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.947420046627957) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.348845313830135) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
u2(5.261601373875368,4.708351649290025) q[0];
u3(4.012878391942215,6.256530901547691,4.926564507116464) q[0];
rx(1.0823675677927322) q[2];
cswap q[3],q[4],q[1];
ryy(4.947420046627957) q[1],q[4];
u(5.350514460087825,3.053981388635578,0.04961421865237836) q[1];
cy q[3],q[2];
rx(4.746609598328023) q[2];
rz(5.316075131972708) q[2];
h q[2];
u(3.6908590788120503,3.5593814815068434,3.3218600130064813) q[3];
cy q[4],q[0];
cu1(2.1429286713399254) q[1],q[0];
ry(5.76151809910024) q[0];
u1(6.117272595357794) q[1];
rzx(1.348845313830135) q[4],q[3];
rxx(3.614708898278923) q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];