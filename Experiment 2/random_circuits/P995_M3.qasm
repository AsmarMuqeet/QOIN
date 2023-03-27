OPENQASM 2.0;
include "qelib1.inc";
gate gate_P995 q0,q1,q2,q3,q4 { u(3.6755969492207554,1.64575463468951,5.251311821846471) q0; h q1; csx q0,q1; u3(1.8200592395995503,5.994537897816125,5.456386521771026) q2; id q2; cu3(4.283545042717591,1.5194245769439803,0.4490699230566835) q4,q3; rzz(4.617761799410409) q3,q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P995 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];