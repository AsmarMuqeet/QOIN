OPENQASM 2.0;
include "qelib1.inc";
gate gate_P894 q0,q1,q2,q3,q4 { cy q2,q1; sx q1; ry(4.095578848062358) q2; rx(4.619757713701877) q3; rzz(0.3175445954236655) q4,q0; cu(5.324544741267324,2.077023279434517,0.35025222566781117,1.9512913857435334) q3,q0; rx(4.266350640984236) q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[4];
gate_P894 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];