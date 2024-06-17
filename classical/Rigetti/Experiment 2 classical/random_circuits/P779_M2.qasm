OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate r(param0,param1) q0 { u3(1.8635571312390165,1.3598041618117276,-1.3598041618117276) q0; }
gate gate_P779 q0,q1,q2,q3,q4 { sxdg q0; u2(2.939479446675465,0.8428824335664482) q0; x q1; s q1; rzz(3.561420635118809) q0,q1; sxdg q2; u2(5.303798397489357,0.6848357973698087) q2; ry(5.294911688633802) q2; r(1.8635571312390165,2.930600488606624) q3; x q4; iswap q3,q4; sdg q3; t q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P779 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
