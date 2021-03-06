///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//  MONITEUR D'ENCHAINEMENT POUR LE CALCUL DE L'EQUILIBRE D'UN RESEAU D'EAU  //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
funcprot(0);
// --------------------------------------
// Dimensionnement de l'espace de travail
// --------------------------------------

   stacksize(10000000);

// ------------------------------------------
// Fonctions fournies dans le cadre du projet
// ------------------------------------------

   // Donnees du problemes

   exec('Probleme_R.sce');
   exec('Structures_R.sce');
   
   // Affichage des resultats

   exec('Visualg.sci');
   
   // Verification  des resultats
   exec('Gradient_Newton.sci');
   exec('HydrauliqueP.sci');
   exec('HydrauliqueD.sci');
   exec('Verification.sci');
   exec('Gradient_F.sci');

   exec('Gradient_F.sci');
   exec('Gradient_BFGS.sci');
// ------------------------------------------
// Fonctions a ecrire dans le cadre du projet
// ------------------------------------------

   // ---> Charger les fonctions  associees a l'oracle du probleme,
   //      aux algorithmes d'optimisation et de recherche lineaire.
   //
   // Exemple : la fonction "optim" de Scilab
   //
   exec('OracleDG.sci');
   exec('OracleDH.sci');
   exec('OraclePG.sci');
   exec('OraclePH.sci');
      
   //F=OraclePG())
   exec('Optim_Scilab.sci');
   exec('Wolfe_Skel.sci');
   exec('Gradient_V.sci');
   exec('Gradient_Polak.sci');
   titrgr = "Fonction optim de Scilab sur le probleme primal";

   // -----> A completer...
   // -----> A completer...
   // -----> A completer...

// ------------------------------
// Initialisation de l'algorithme
// ------------------------------

   // La dimension (n-md) est celle du probleme primal

   xini = 0.1 * rand(md,1);
//  [fopt,xopt,gopt] = Gradient_V(OraclePG,xini);
  [fopt,xopt,gopt] = Gradient_Newton(OracleDH,xini);
   

// ----------------------------
// Minimisation proprement dite
// ----------------------------

   // Exemple : la fonction "optim" de Scilab
   //
   //[fopt,xopt,gopt] = Optim_Scilab(OraclePG,xini);
   

   // -----> A completer...

// --------------------------
// Verification des resultats
// --------------------------

   [q,z,f,p] = HydrauliqueD(xopt);
// [q,z,f,p] = HydrauliqueP(xopt);
   Verification(q,z,f,p);

//
