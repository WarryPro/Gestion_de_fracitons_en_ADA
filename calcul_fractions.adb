--------------------------------------------------------------------------------
-- 1. Implémentation d'un paquetage de fractions et d'un programme de test.-----
-- 2. Implémentation d'un paquetage de polynômes à coefficients fractionnaires--
-- et d'un programme de test.--
-- 3. Utilisation des paquetages de fractions et de polynômes pour une--
-- Implémentation D’Un Code De Reed-Solomon.--
--------------------------------------------------------------------------------
With Ada.Text_Io; Use Ada.Text_Io;
With Ada.Integer_Text_Io; Use Ada.Integer_Text_Io;
With Gestion_Fractions; Use Gestion_Fractions;
With Ada.Command_Line; Use Ada.Command_Line;


Procedure Calcul_Fractions is
	Fraction_1, Fraction_2, Fraction_3, F_PGCD: Gestion_Fractions.Fraction;
	Puissance, Entier, Resulta_pgcd, Nbre_1, Nbre_2: Integer; OP : String := "0";

	--Resultat: Boolean;
begin
	New_Line;
	Get_Fraction(Fraction_1, OP, Fraction_2);
	F_PGCD := Fraction_1;
	-- Afficher la Fraction Compl�te --
	Put("Fraction 1: ");
	Put_Fraction((Fraction_1));
	New_Line;

	-- Creation de la Fraction reduite --
	Fraction_1 := Reduire(Fraction_1);
	Put("Fraction reduite: ");
	Put_Fraction(Fraction_1);
	New_Line; New_Line;


	-- Afficher la Fraction Compl�te --
	Put("Fraction 2: ");
	Put_Fraction((Fraction_2));
	New_Line;

	-- Creation de la Fraction reduite --
	Fraction_2 := Reduire(Fraction_2);
	Put("Fraction reduite: ");
	Put_Fraction(Fraction_2);
	New_Line; New_Line;

	if OP = "+" then 
		Fraction_3 := "+"(Fraction_1, Fraction_2);
    	Put("Resultat de la somme : ");
    	Put_Fraction(Fraction_3); 
    	New_Line; New_Line;
	end if;

    if OP = "-" then
    	Fraction_3 := "-"(Fraction_1, Fraction_2);
    	Put("Resultat de la soustraction : ");
    	Put_Fraction(Fraction_3);
		New_Line; New_Line;
    end if;

    -----------------------------------------------------------------
    --------------------- MULTIPLICATIONS ---------------------------
    -----------------------------------------------------------------

    if ((OP = "x") and (Argument_count = 5 and Argument(3) = OP)) then 
    	Fraction_3 := "*"(Fraction_1, Fraction_2);
	    Put("Resultat de la Multiplication de fractions : ");
    	Put_Fraction(Fraction_3);
		New_Line; New_Line;

	elsif ((OP = "x") and (Argument_count = 4  and Argument(3) = OP)) then
		Entier := Fraction_Entier(Fraction_2);
		Fraction_3 := "*"(Fraction_1, Entier);
    	Put("Multiplication d'une fraction et un entier : ");
    	Put_Fraction(Fraction_3);
		New_Line; New_Line;

	elsif ((OP = "x") and (Argument_count = 4  and Argument(2) = OP)) then
		Entier := Fraction_Entier(Fraction_1);
		Put(Entier); New_Line;
		Fraction_3 := "*"(Entier, Fraction_2);
    	Put("Multiplication d'un entier et fraction : ");
    	Put_Fraction(Fraction_3);
		New_Line; New_Line;
    end if;

    -----------------------------------------------------------------
    -------------------------- DIVISIONS ----------------------------
    -----------------------------------------------------------------
    if ((OP = ":") and (Argument_count = 5 and Argument(3) = OP)) then 
    	Fraction_3 := "/"(Fraction_1, Fraction_2);
	    Put("Resultat de la Division de fractions : ");
    	Put_Fraction(Fraction_3);
		New_Line; New_Line;

	elsif ((OP = ":") and (Argument_count = 4  and Argument(3) = OP)) then

		Entier := Fraction_Entier(Fraction_2);
		Fraction_3 := "/"(Fraction_1, Entier);
    	Put("Division d'une fraction et un entier : ");
    	Put_Fraction(Fraction_3);
		New_Line; New_Line;

	elsif ((OP = ":") and (Argument_count = 4  and Argument(2) = OP)) then

		Entier := Fraction_Entier(Fraction_1);
		Fraction_3 := "/"(Entier, Fraction_2);
    	Put("Division d'un entier et fraction : ");
    	Put_Fraction(Fraction_3);
		New_Line; New_Line;
    end if;

    -----------------------------------------------------------------
    ------------------ PUISSANCE D'UNE FRACTION ---------------------
    -----------------------------------------------------------------
    if ((OP = "p") and (Argument_count = 4 and Argument(3) = OP)) then 
    	Puissance := Fraction_Entier(Fraction_2);
    	Fraction_3 := "**"(Fraction_1, Puissance);
	    Put("Fraction 1 à la Puissance " & Integer'Image(Puissance) & " : ");
    	Put_Fraction(Fraction_3);
		New_Line; New_Line;
	end if;
    -----------------------------------------------------------------
    ----------------------- Calcul du PGCD --------------------------
    -----------------------------------------------------------------
    if ((OP = "g") and ((Argument_count = 3) and (Argument(3) = OP))) then 
    	Nbre_1 := Numer(F_PGCD);
    	Nbre_2 := Denom(F_PGCD);
	    Put("PGCD de " & Integer'Image(Nbre_1) & " et " & Integer'Image(Nbre_2) & " : ");
    	Resulta_pgcd := PGCD(Nbre_1, Nbre_2);
    	Put(Resulta_pgcd,2);
		New_Line;
	end if;

exception
      when DIV_PAR_ZERO => put_line("Non défini, Division par zèro !"); 
      skip_line; 
      calcul_fractions;
      when others => put_line(" Erreur de saisi !"); skip_line; New_line; calcul_fractions;

end Calcul_Fractions;