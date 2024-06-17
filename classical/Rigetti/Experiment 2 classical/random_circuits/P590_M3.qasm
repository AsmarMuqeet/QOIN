OPENQASM 2.0;
include "qelib1.inc";
gate gate_P590 q0,q1,q2,q3,q4 { rx(5.9079413052333605) q0; u3(2.5751036619118874,1.5321047192535164,3.4752678054422708) q0; p(4.418108399235575) q1; id q2; sx q2; cu1(4.388913989585418) q3,q4; cu1(2.9009726304169137) q3,q1; s q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P590 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
