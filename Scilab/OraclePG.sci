Function [F,G,ind]=OraclePG(qc,ind)
    F=0;
    G=0;
    x=q0+B*qc;
    y=r.*x.*abs(x);
    z=Ar'*pr;
    if ind==2 then
        F=(1/3)*x'*y+(x'*z);
    elseif ind==3 then
        G=B'*(y+z);
    elseif ind==4 then
        F=(1/3)*x'*y+(x'*z);
        G=B'*(y+z);
    end      
endfunction



  

   
       
   
