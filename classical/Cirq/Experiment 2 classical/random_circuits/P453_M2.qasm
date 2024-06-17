OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.8004509556250907) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(6.278043996542861,-0.8693598744629785,0.8693598744629785) q0; }
gate gate_P453 q0,q1,q2,q3,q4 { r(6.278043996542861,0.7014364523319181) q0; rz(1.6933940121220654) q0; sx q1; sdg q1; z q2; ry(4.369644703348849) q2; ryy(0.8004509556250907) q4,q3; u2(5.881636608808604,6.2606089991741545) q3; rx(2.1164826573067135) q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[3];
gate_P453 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
