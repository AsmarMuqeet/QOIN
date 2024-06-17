OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.639679183943622) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.7237646397248574) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P876 q0,q1,q2,q3,q4 { rz(3.8344846650688442) q0; y q0; z q0; s q2; cu(4.4656155798071655,2.4509641039868444,4.567658524292843,1.3792480472551425) q1,q3; ry(2.686111429074194) q1; s q1; u3(1.8827120986014239,4.616608280341889,1.330999317018459) q3; u2(0.680138415188113,5.440788352517938) q3; rz(3.904294549263149) q3; u3(1.8491388033789995,2.192650110033703,2.536691124085222) q3; x q3; z q4; cy q4,q2; ryy(1.7237646397248574) q4,q2; cu(1.609123028038839,0.7275940229059843,5.964018960043717,1.3279553308972936) q0,q4; u2(5.4188034937761875,0.27722437803216493) q0; rxx(2.6065943209727993) q2,q1; cz q1,q4; sxdg q1; s q2; rzx(4.639679183943622) q0,q2; cswap q1,q0,q2; y q4; rzz(1.3323747413438622) q3,q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P876 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];