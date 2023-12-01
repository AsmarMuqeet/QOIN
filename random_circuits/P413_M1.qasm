OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-3.176137078625911) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(0.12230364230383307) q0; ry(-0.12230364230383307) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(3.176137078625911) q1; }
gate gate_P413 q0,q1,q2,q3,q4,q5,q6 { id q1; u1(1.247843821632193) q2; s q4; csx q3,q5; u(2.061503980592323,1.1246456970911176,6.208173468854533) q3; rz(2.4060585813240003) q3; xx_minus_yy(0.24460728460766615,3.176137078625911) q4,q5; tdg q4; rz(0.0810399821466677) q5; csx q6,q0; csx q0,q2; cy q1,q6; h q1; csx q2,q0; t q6; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P413 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
