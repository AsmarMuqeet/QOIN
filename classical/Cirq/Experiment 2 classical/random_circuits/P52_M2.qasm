OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.388519475536806) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P52 q0,q1,q2,q3,q4,q5,q6 { ryy(2.388519475536806) q3,q0; sx q0; id q4; rzz(2.080567295402248) q4,q3; cx q0,q3; sx q4; cu3(0.9148266284626826,4.545480337738976,4.595078630201873) q5,q1; sdg q5; h q5; swap q2,q6; rxx(3.773847086092348) q1,q2; rz(2.808977109865222) q6; ccx q2,q6,q1; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P52 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
