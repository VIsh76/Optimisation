function [F,G,ind]=OracleDG(lambda,ind)
    F=0;
    G=0;
    x = Ar'*pr+Ad'*lambda
    q = sign(-x./r).*sqrt(abs(x./r))
    y = r.*q.*abs(q);
    z = Ar'*pr+Ad'*lambda;
    if ind==2 then
        F= -( (1/3)*q'*y+(q'*z)-fd'*lambda);
    elseif ind==3 then
        G= -Ad*q+fd;
    elseif ind==4 then
        F= -( (1/3)*q'*y+(q'*z)-fd'*lambda);
        G= -Ad*q+fd;
    end
endfunction
