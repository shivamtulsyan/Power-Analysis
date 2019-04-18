function [ ai, wi, q ] = intermediate( qi, qf, i, wo, ao )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    q = qi + i*(qf-qi)/10;
    if ((qf-qi)>=wo/ao)
        to = (qf-qi)/wo + wo/ao;
        ti = to*i/10;
        if (ti<wo/ao)
            ai = ao; wi = ao*ti;
        elseif (ti<to-wo/ao)
            ai = 0;  wi = wo;
        else
            ai = -ao; wi = wo - ao*(ti-to+wo/ao);
        end
    else
        to = (4*(qf-qi)/ao).^0.5;
        ti = to*i/10;
        if (ti<to/2)
            ai = ao; wi = ao*ti;
        else 
            ai = -ao; wi = ao*(to-ti);
        end
    end
    
end

