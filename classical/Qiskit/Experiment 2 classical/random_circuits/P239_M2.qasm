OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.815937202803475) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(5.179500433801477,2.275800843399725,-2.275800843399725) q0; }
gate gate_P239 q0,q1,q2,q3,q4 { sx q0; ry(1.0290832260905811) q0; p(1.8925652748318742) q0; ry(1.7764473307840445) q1; r(5.179500433801477,3.8465971701946216) q1; h q1; ccx q2,q4,q3; t q2; u(1.0052184690001869,3.2815222228280008,4.426416293821165) q2; ryy(3.815937202803475) q3,q4; ch q3,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P239 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
