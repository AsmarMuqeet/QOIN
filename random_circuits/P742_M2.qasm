OPENQASM 2.0;
include "qelib1.inc";
gate gate_P742 q0,q1,q2,q3,q4,q5,q6 { id q1; rx(0.10860061146316298) q2; cp(5.221653160479043) q0,q3; rxx(0.5502839033635114) q0,q1; sx q3; u2(4.646254750003775,0.05953692141686421) q4; u(2.7810399819246294,4.236671465345427,1.100163563090548) q4; tdg q5; rx(2.244874979375701) q5; h q6; swap q6,q2; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P742 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];