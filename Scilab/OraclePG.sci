   function [F,G,ind]=OraclePG(qc,ind)
       if ind==2 then
           F=(1/3)*((q0+B*qc)'*((r.*(q0+B*qc).*abs(q0+B*qc))))+pr'*(Ar*(q0+B*qc))
       else if ind==3 then
           G=B*((q0+B*qc).*abs(q0+B*qc)).*r+Ar'*pr)
       else
           F=(1/3)*((q0+B*qc)'*((r.*(q0+B*qc).*abs(q0+B*qc))))+pr'*(Ar*(q0+B*qc))
           G=B*((q0+B*qc).*abs(q0+B*qc)).*r+Ar'*pr)
       end
   endfunction
   
       
   
