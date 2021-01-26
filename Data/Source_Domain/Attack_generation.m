function [PdQd,p,q,p_attacked,q_attacked,success] = Attack_generation(Basecase_index)
[PQ, PV, REF, NONE, BUS_I, BUS_TYPE, PD, QD, GS, BS, BUS_AREA, VM, ...
 VA, BASE_KV, ZONE, VMAX, VMIN, LAM_P, LAM_Q, MU_VMAX, MU_VMIN] = idx_bus;
[F_BUS, T_BUS, BR_R, BR_X, BR_B, RATE_A, RATE_B, RATE_C, ...
 TAP, SHIFT, BR_STATUS, PF, QF, PT, QT, MU_SF, MU_ST, ...
 ANGMIN, ANGMAX, MU_ANGMIN, MU_ANGMAX] = idx_brch;
[GEN_BUS, PG, QG, QMAX, QMIN, VG, MBASE, GEN_STATUS, PMAX, PMIN, ...
 MU_PMAX, MU_PMIN, MU_QMAX, MU_QMIN, PC1, PC2, QC1MIN, QC1MAX, ...
 QC2MIN, QC2MAX, RAMP_AGC, RAMP_10, RAMP_30, RAMP_Q, APF] = idx_gen;
[PW_LINEAR, POLYNOMIAL, MODEL, STARTUP, SHUTDOWN, NCOST, COST] = idx_cost;
[CT_LABEL, CT_PROB, CT_TABLE, CT_TBUS, CT_TGEN, CT_TBRCH, CT_TAREABUS, ...
 CT_TAREAGEN, CT_TAREABRCH, CT_ROW, CT_COL, CT_CHGTYPE, CT_REP, ...
 CT_REL, CT_ADD, CT_NEWVAL, CT_TLOAD, CT_TAREALOAD, CT_LOAD_ALL_PQ, ...
 CT_LOAD_FIX_PQ, CT_LOAD_DIS_PQ, CT_LOAD_ALL_P, CT_LOAD_FIX_P, ...
 CT_LOAD_DIS_P, CT_TGENCOST, CT_TAREAGENCOST, CT_MODCOST_F, ...
 CT_MODCOST_X] = idx_ct;

mpc=case14_Version_source_domain(Basecase_index);
[MVAbase, bus, gen, gencost, branch, f, success, et] = runopf(mpc);
PdQd = [bus([2:6,9:14],3);bus([2:6,9:14],4)];%∏∫‘ÿ
%%  
Theta = bus(:,VA)*pi/180;   
V = bus(:,VM);      
for i=1:size(branch,1)
    p(2*i-1,1) = branch(i,PF)/MVAbase;
    p(2*i,1) = branch(i,PT)/MVAbase;
    q(2*i-1,1) = branch(i,QF)/MVAbase;
    q(2*i,1) = branch(i,QT)/MVAbase;
end
I1 = [0.1,0.2,0.3];
I2 = [2,3,9];
attack_intensity = I1(randi(3)); 
attacked_bus = I2(randi(3));
noise_intensity = 0.01;    
p = p .* (1-noise_intensity+2*noise_intensity*rand(size(p,1),1));
q = q .* (1-noise_intensity+2*noise_intensity*rand(size(q,1),1));

index = [];
for n=1:size(branch,1)
    if (branch(n,1)==attacked_bus || branch(n,2)==attacked_bus)
        index(end+1:end+2) = [2*n-1,2*n];
    end
end

p_delta = zeros(40,1);p_delta(index,1)=attack_intensity*p(index,1);p_attacked = p+p_delta;
q_delta = zeros(40,1);q_delta(index,1)=attack_intensity*q(index,1);q_attacked = q+q_delta;

end







