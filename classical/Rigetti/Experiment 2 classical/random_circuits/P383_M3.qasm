OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.201071714601141,-0.1454820598073958,0.1454820598073958) q0; }
gate gate_P383 q0,q1,q2,q3,q4 { r(5.201071714601141,1.4253142669875007) q1; tdg q2; cp(5.971924187846005) q2,q1; cy q0,q3; y q3; u3(5.989902881930031,2.237981455558301,3.8496823771683326) q4; cy q0,q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P383 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
