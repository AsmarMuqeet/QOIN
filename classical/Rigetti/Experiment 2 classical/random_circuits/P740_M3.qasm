OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.371135067561731,3.1695900334134226,-3.1695900334134226) q0; }
gate gate_P740 q0,q1,q2,q3,q4,q5,q6 { id q1; sx q1; r(4.371135067561731,4.740386360208319) q2; ry(2.5371683044017264) q2; cu1(6.073504709532654) q4,q3; cu3(4.22905865476912,4.511701032591056,4.925366049880197) q0,q5; cswap q4,q3,q0; z q6; cz q6,q5; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[2];
gate_P740 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
