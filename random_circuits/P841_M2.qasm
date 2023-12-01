OPENQASM 2.0;
include "qelib1.inc";
gate gate_P841 q0,q1,q2,q3,q4 { ry(2.188318988572962) q0; tdg q0; h q1; rz(4.448766186572257) q1; s q2; sx q2; u2(4.939575530323414,0.8354293925344145) q3; z q3; rx(3.909369625357566) q4; ry(4.34671521202309) q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P841 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
