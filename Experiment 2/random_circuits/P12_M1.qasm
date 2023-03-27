OPENQASM 2.0;
include "qelib1.inc";
gate gate_P12 q0,q1,q2,q3,q4 { rz(4.768845832364235) q0; u1(4.587991267432804) q0; cu(4.420347788872386,1.6591475260825654,0.17297164482447278,6.195074160470876) q1,q2; cz q2,q1; ry(1.4236541055396152) q3; sdg q3; p(5.4209110276692725) q4; sx q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P12 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];