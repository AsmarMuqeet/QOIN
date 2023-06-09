OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.0519261734137264,-0.3950791292040279,0.3950791292040279) q0; }
gate gate_P208 q0,q1,q2,q3,q4 { z q0; rxx(1.329275754966188) q3,q1; cz q3,q0; cu3(5.335773851887414,4.969763808017608,1.4503269188225427) q4,q2; cu3(5.679113989689499,5.795113885327868,2.422259038314782) q1,q2; csx q0,q1; sx q0; cy q3,q2; s q2; r(3.0519261734137264,1.1757171975908687) q3; id q4; z q4; rzz(1.361121985174681) q1,q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P208 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
