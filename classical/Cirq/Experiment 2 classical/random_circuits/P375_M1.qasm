OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.789661367879878,-0.697495406301555,0.697495406301555) q0; }
gate r_139921315816256(param0,param1) q0 { u3(0.6761354920922763,-1.258673203992796,1.258673203992796) q0; }
gate gate_P375 q0,q1,q2,q3,q4 { cp(5.318924911430824) q2,q0; r_139921315816256(0.6761354920922763,0.31212312280210075) q0; cp(0.4073573501211303) q3,q1; u2(6.007100164347866,3.641536950699588) q1; r(4.789661367879878,0.8733009204933415) q4; cswap q4,q2,q3; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P375 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];