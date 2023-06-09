OPENQASM 2.0;
include "qelib1.inc";
gate gate_P86 q0,q1,q2,q3,q4 { u3(1.7578783734756969,1.6300481583636528,4.226270758524908) q1; cp(6.108228153614492) q0,q2; h q2; p(4.398336349449949) q3; cu(1.4122961437535932,3.8361622216264446,6.243777621532757,0.9469055913594582) q3,q0; ry(0.3862479146957608) q4; swap q1,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P86 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
