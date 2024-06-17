OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.281165469733369) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r_139921316046448(param0,param1) q0 { u3(0.48507112778739697,1.0185774478496796,-1.0185774478496796) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.5472124626387256) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(1.6344178696172729,2.210132227974267,-2.210132227974267) q0; }
gate gate_P268 q0,q1,q2,q3,q4 { r(1.6344178696172729,3.7809285547691633) q0; t q2; rzx(2.5472124626387256) q0,q2; r_139921316046448(0.48507112778739697,2.589373774644576) q0; sdg q2; cu(4.114171322202715,5.805284865290959,4.281987030853558,1.1080149369787766) q1,q3; sx q3; sx q4; cx q4,q1; rx(1.1116947735519511) q1; ryy(4.281165469733369) q4,q3; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P268 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];