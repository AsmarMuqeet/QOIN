OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.126182547896182) q1; cx q0,q1; h q1; }
gate gate_P14 q0,q1,q2,q3,q4 { id q1; h q1; h q1; cu(5.9146737261758835,1.1116655627668257,1.032679371590017,5.874785854696949) q0,q3; cx q3,q0; id q0; sx q3; rzx(4.126182547896182) q4,q2; cx q2,q4; cu(3.225119218760165,0.02964697384139885,5.40525142934254,4.271060919717905) q4,q2; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P14 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
