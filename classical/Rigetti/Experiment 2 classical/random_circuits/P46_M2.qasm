OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.008379333752007) q1; cx q0,q1; h q1; }
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate gate_P46 q0,q1,q2,q3,q4,q5,q6 { u3(1.3095393719513098,2.8904917790406492,0.08264405130341744) q0; ry(1.5667913361419583) q1; u(3.5411177481522804,0.611946584976858,1.8420439309358252) q1; ry(6.245096993230213) q2; csx q2,q0; sx q4; id q5; dcx q6,q3; rzz(3.6255113489143875) q3,q4; rzx(3.008379333752007) q6,q5; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P46 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
