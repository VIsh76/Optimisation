function [F,G,H,ind]=OraclePH(qc,ind)
    F=0;
    G=0;
    H=0;
    q = B*qc+q0;
    if ind==2 then
        [F,G]=OraclePG(qc,2);
    elseif ind==3 then
        [F,G]=OraclePG(qc,3);
    elseif ind==4 then
        [F,G]=OraclePG(qc,4);
    elseif ind==5 then
        H=2*B'*diag(r.*abs(q))*B;
    elseif ind==6 then
        [F,G]=OraclePG(qc,3);
        H=2*B'*diag(r.*abs(q))*B;
    elseif ind==7 then
        [F,G]=OraclePG(qc,3);
        F=OraclePG(qc,2);
        H=2*B'*diag(r.*abs(q))*B;
    end
      
endfunction
