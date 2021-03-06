function [fopt,xopt,gopt]=Gradient_BFGS(Oracle,xini)


///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//         RESOLUTION D'UN PROBLEME D'OPTIMISATION SANS CONTRAINTES          //
//                                                                           //
//         Methode de gradient a pas fixe                                    //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////


// ------------------------
// Parametres de la methode
// ------------------------

   titre = "Parametres du gradient a pas fixe";
   labels = ["Nombre maximal d''iterations";...
             "Valeur du pas de gradient";...
             "Seuil de convergence sur ||G||"];
   typ = list("vec",1,"vec",1,"vec",1);
   default = ["5000";"1";"0.000001"];
   [ok,iter,alphai,tol] = getvalue(titre,labels,typ,default);

// ----------------------------
// Initialisation des variables
// ----------------------------
   
   logG = [];
   logP = [];
   Cout = [];

   timer();

// -------------------------
// Boucle sur les iterations
// -------------------------


   kstar = iter;
   x=xini;
   G=0;
   for k = 1:iter
//    - valeur du critere et du gradient
      ind = 7;
      Gbis=G;
      [F,G,H] = Oracle(x,ind);
      delta_g=G-Gbis;
//    - test de convergence

      if norm(G) <= tol then
         kstar = k;
         break
      end

//    - calcul de la direction de descente
      if(k==1) then
        W=eye(x*x')
        D=-W*G;
  else 
        terme1=(delta_x*delta_g')/(delta_g'*delta_x);
        terme2=(delta_g*delta_x')/(delta_g'*delta_x);
        W=(eye(terme1)-terme1)*W*(eye(terme2)-terme2)+(delta_x*delta_x')/(delta_g'*delta_x)
        D=-W*G;
      end    
        
  
//    - calcul de la longueur du pas de gradient

      alpha=Wolfe(alphai,x,D,Oracle);

//    - mise a jour des variables
      x_prec=x;
      x = x + (alpha*D);
      delta_x=x-x_prec;

//    - evolution du gradient, du pas et du critere

      logG = [ logG ; log10(norm(G)) ];
      logP = [ logP ; log10(alpha) ];
      Cout = [ Cout ; F ];

   end

// ---------------------------
// Resultats de l'optimisation
// ---------------------------

   fopt = F;
   xopt = x;
   gopt = G;

   tcpu = timer();

   cvge = ['Iteration         : ' string(kstar);...
           'Temps CPU         : ' string(tcpu);...
           'Critere optimal   : ' string(fopt);...
           'Norme du gradient : ' string(norm(gopt))];
   disp('Fin de la methode de gradient a pas fixe')
   disp(cvge)

// - visualisation de la convergence

   Visualg(logG,logP,Cout);

endfunction
