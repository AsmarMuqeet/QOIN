OPENQASM 2.0;
include "qelib1.inc";
gate gate_P927 q0,q1,q2,q3,q4,q5,q6 { t q0; u1(1.9991459308277246) q0; p(2.889055100508909) q2; cu3(3.7978803577903686,2.006300252705304,3.1862903916990666) q1,q3; cy q1,q3; h q4; z q4; cp(3.3325666219371843) q5,q6; cu1(1.252746054407377) q2,q5; u3(4.354198022907039,1.0533361655545692,5.280694431205328) q6; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P927 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];