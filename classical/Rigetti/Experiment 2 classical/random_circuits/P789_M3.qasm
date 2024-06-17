OPENQASM 2.0;
include "qelib1.inc";
gate gate_P789 q0,q1,q2,q3,q4,q5,q6 { cy q0,q1; p(1.3362414601380643) q1; u2(3.743742333915822,3.354771265516824) q2; tdg q2; ry(5.630401380224507) q3; p(5.7440281733489496) q5; cy q6,q4; ccx q0,q4,q5; cp(6.242795541161752) q6,q3; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P789 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
