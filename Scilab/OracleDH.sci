function [F,G,H,ind]=OracleDH(lambda,ind)
    F=0;
    G=0;
    H=0;
    x = Ar'*pr+Ad'*lambda
        
//    disp(size(r))
//    disp(size(lambda))
//    disp(size(Ad))
//    disp(size(x))
//    disp(size(Z))
    Z = diag(1 ./(2*sqrt(abs(x.*r))))
    if ind==2 then
        [F,G]=OracleDG(lambda,2);
    elseif ind==3 then
        [F,G]=OracleDG(lambda,3);
    elseif ind==4 then
        [F,G]=OracleDG(lambda,4);
    elseif ind==5 then
        H = Ad * Z * Ad';
    elseif ind==6 then
        H = Ad * Z *Ad';
        [F,G]=OracleDG(lambda,3);
    elseif ind==7 then
        [F,G]=OracleDG(lambda,3);
        F=OracleDG(lambda,2);
        H = Ad*Z*Ad';
    end
endfunction
