OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(1.6094099051797022) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-2.0754347491281444) q1; ry(-2.0754347491281444) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-1.6094099051797022) q0; }
gate gate_P149 q0,q1,q2,q3,q4 { tdg q0; cu1(3.9051787887630827) q1,q2; cz q0,q2; p(3.497370011655473) q1; xx_plus_yy(4.150869498256289,1.6094099051797022) q3,q4; rx(6.018189082280011) q3; p(3.161815291135228) q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P149 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
