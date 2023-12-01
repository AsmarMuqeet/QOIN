OPENQASM 2.0;
include "qelib1.inc";
gate gate_P844 q0,q1,q2,q3,q4,q5,q6 { sdg q1; p(3.887536885078929) q1; id q2; ccx q5,q4,q0; ry(1.1207557634532177) q0; u1(4.463002438306585) q4; cz q6,q3; cy q2,q3; cu(3.9381088293589945,4.643912112913256,2.983215487135313,3.5696512997318246) q5,q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[3];
gate_P844 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
