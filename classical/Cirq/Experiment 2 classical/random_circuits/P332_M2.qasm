OPENQASM 2.0;
include "qelib1.inc";
gate gate_P332 q0,q1,q2,q3,q4 { h q1; s q2; rzz(4.259418428726364) q3,q0; u3(2.251158116521175,0.11240010124902859,2.024394820730122) q0; sdg q3; u(3.387154700918488,5.138870576531831,1.341195278837988) q4; ccx q1,q4,q2; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P332 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
