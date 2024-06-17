OPENQASM 2.0;
include "qelib1.inc";
gate gate_P787 q0,q1,q2,q3,q4 { sx q1; cu1(3.069500505856797) q0,q2; cu(0.44583571602407157,1.1373403766497099,6.276146424029872,0.3187884161752028) q2,q0; p(2.2728288456228993) q3; y q4; cswap q1,q3,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[4];
gate_P787 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
