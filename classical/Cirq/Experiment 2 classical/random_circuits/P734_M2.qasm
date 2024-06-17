OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.9451483550848863) q1; cx q0,q1; h q1; }
gate gate_P734 q0,q1,q2,q3,q4,q5,q6 { s q0; rzx(1.9451483550848863) q3,q4; p(4.606241870315881) q4; cswap q2,q5,q1; p(4.828457061715614) q1; tdg q1; csx q3,q2; t q2; sdg q5; y q5; t q6; cu(2.0939780033316113,1.1521612413003919,2.858657299193303,6.0823146699737745) q0,q6; cp(1.6868635900630684) q3,q0; swap q4,q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[4];
gate_P734 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
