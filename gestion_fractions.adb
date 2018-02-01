--------------------------------------------------------------------------------
-- 1. Implémentation d'un paquetage de fractions et d'un programme de test.-----
-- 2. Implémentation d'un paquetage de polynômes à coefficients fractionnaires--
-- et d'un programme de test.--
-- 3. Utilisation des paquetages de fractions et de polynômes pour une--
-- Implémentation D’Un Code De Reed-Solomon.--
--------------------------------------------------------------------------------

With Ada.Text_Io; Use Ada.Text_Io;
With Ada.Integer_Text_Io; Use Ada.Integer_Text_Io;
With Ada.Command_Line; Use Ada.Command_Line;


Package Body Gestion_Fractions is
	--Div_Par_Zero : Exception; -- Exception s'il y a une division par zéro--

	-----------------------------------------------------------------
	-- Procedure GET pour obtenir les numérateurs et dénominateurs --
	-----------------------------------------------------------------
	Procedure Get_Fraction (A: out Fraction; OP:  Out String; B : Out Fraction) is
	--Operat : String := "0";
	begin
		for I in 1..Argument_Count loop
			if ((Argument_Count = 5 and Argument(3) = "+") or (Argument_Count = 5 and Argument(3) = "-") or 
				(Argument_Count = 5 and Argument(3) = "x")) or 
				(Argument_Count = 5 and Argument(3) = ":") then 
					A.Numerateur := Integer'value(Argument(1));
					A.Denominateur := Integer'value(Argument(2));
					OP := Argument(3);
					B.Numerateur := Integer'value(Argument(4));
					B.Denominateur := Integer'value(Argument(5)); 

				elsif (Argument_Count = 4 and Argument(3) = "x") or (Argument_Count = 4 and Argument(3) = ":") then
					A.Numerateur := Integer'value(Argument(1));
					A.Denominateur := Integer'value(Argument(2));
					OP := Argument(3);
					B.Numerateur := Integer'value(Argument(4));

				elsif (Argument_Count = 4 and Argument(2) = "x") or (Argument_Count = 4 and Argument(2) = ":") then
					A.Numerateur := Integer'value(Argument(1));
					OP := Argument(2);
					B.Numerateur := Integer'value(Argument(3));
					B.Denominateur := Integer'value(Argument(4));

				elsif (Argument_Count = 4 and Argument(3) = "p") then
					A.Numerateur := Integer'value(Argument(1));
					A.Denominateur := Integer'value(Argument(2));
					OP := Argument(3);
					B.Numerateur := Integer'value(Argument(4));

				elsif (Argument_Count = 3 and Argument(3) = "g") then
					A := (Integer'value(Argument(1)), (Integer'value(Argument(2))));
					--A.Denominateur := Integer'value(Argument(2));
					B := (0,1);
					OP := Argument(3);
			end if;
		end loop; 

	end Get_Fraction;

	---------------------------------------------------
	-- Proedure pour PUT pour afficher les fractions --
	---------------------------------------------------
	Procedure Put_Fraction (F: In Fraction) is
	begin
		Put(F.Numerateur, 3);
		Put("/");
		Put(F.Denominateur, 0);

	end Put_Fraction;

	------------------------------
	-------- Fonction PGCD -------
	------------------------------
	Function PGCD (Numerateur, Denominateur : in Integer) return integer is
		--Num, Den, Temp : Integer;
	Begin

		if abs(Numerateur) rem abs(Denominateur) = 0 then
         	return abs(Denominateur);
      	end if;
      	return PGCD (abs(Denominateur), abs(Numerateur) rem abs(Denominateur)); 
	End PGCD;

	-- Fonction pour faire les fractions --
	Function Faire_Fraction (N, D : Integer) Return Fraction is
		GCD : Integer;
	Begin
		if D = 0 then
			raise DIV_PAR_ZERO;
		end if;

		if N = 0 then
			return (0,1);
		end if;
		
		GCD := PGCD(N,D);

		if D < 0 then
			return ((-N) / GCD, (-D) / GCD);
			else
				return (N / GCD, D / GCD);
		end if;
	end Faire_Fraction;

	-- Fonction pour le numerateur --
	Function Numer (X: Fraction) return Integer is
	Begin
		Return X.Numerateur;
	End Numer;

	-- Fonction pour le denominateur --
	Function Denom (X: Fraction) Return Integer is
	Begin
		Return X.Denominateur;
	End Denom;

	-- Fonction pour "Addition" --
	Function "+" (X, Y: Fraction) Return Fraction is
		F: Fraction;
	Begin
		F.Numerateur := Numer(X) * Denom(Y) + Numer(Y) * Denom(X);
		F.Denominateur := Denom(X) * Denom(Y);
		F:= Faire_Fraction(F.Numerateur, F.Denominateur);
		Return F;
	End "+";

	-- Fonction pour "Soustraction" --
	Function "-" (X, Y: Fraction) Return Fraction is
		F: Fraction;
	Begin
		F.Numerateur := Numer(X) * Denom(Y) - Numer(Y) * Denom(X);
		F.Denominateur := Denom(X) * Denom(Y);
		F:= Faire_Fraction(F.Numerateur, F.Denominateur);
		Return F;
	End "-";


	-- Fonction pour "Multiplication" --
	Function "*" (X, Y: Fraction) Return Fraction is
		F: Fraction;
	Begin
		F.Numerateur := Numer(X) * Numer(Y);
		F.Denominateur := Denom(X) * Denom(Y);
		F := Faire_Fraction(F.Numerateur, F.Denominateur);
		Return F;
	End "*";

	
	-- Fonction Pour la Multiplication entre un Entier et une Fraction --
	Function "*" (Entier : Integer; F : Fraction) Return Fraction is 
	begin
		Return Fraction'(Entier,1)*F;
	End "*";

	-- Fonction Pour la Multiplication entre une Fraction et un Entier --
	Function "*" (F : Fraction; Entier : Integer) Return Fraction is 
	begin
		Return Entier*F;
	End "*";


	-- Fonction pour "Division" entre Fractions --
	Function "/" (X, Y: Fraction) Return Fraction is
		N: Integer;
		--D: Positive;
		F: Fraction;
		Temp: Integer;
	Begin
		N:= Numer(X) * Denom(Y);
		Temp:= Numer(Y) * Denom(X);
		F:= Faire_Fraction(N, Temp);
		Return F;
	End "/";


	-- Fonction Pour la Division entre un Entier et une Fraction --
	Function "/" (Entier : Integer; F : Fraction) Return Fraction is 
	begin
		Return Fraction'(Entier,1)/F;
	End "/";


	-- Fonction Pour la Division entre une Fraction et un Entier --
	Function "/" (F : Fraction; Entier : Integer) Return Fraction is 
	begin
		Return F/Fraction'(Entier,1);
	End "/";

	---------------------------
	-- Fonction pour Reduire --
	Function Reduire (X : In Fraction) Return Fraction is
	begin
		Return Faire_Fraction (Numer(X), Denom(X));
	End Reduire;
	
	--------------------------------	
	-- Fonction Pour la Puissance --
	--------------------------------
	Function "**" (F : Fraction; Exp : Integer) Return Fraction is 
		Fract: Fraction;
	begin
		if Exp >= 0 then 
			Fract.Numerateur := F.Numerateur ** Exp;
			Fract.Denominateur := F.Denominateur ** Exp;
		else
			Fract.Numerateur := F.Denominateur ** (abs (Exp));
			Fract.Denominateur := F.Numerateur ** (abs (Exp));			
		end if;
		
		--Put_Fraction(Fract);
		Return Fract;
	End "**";

	-------------------------------------
	-- Fonction pour Fraction à Entier --
	Function Fraction_Entier (X: Fraction) Return Integer is
	begin
		Return Numer(X) / Denom(X);
	End Fraction_Entier;

	-------------------------------------
	-- Fonction pour Fraction à Entier --
	Function Entier_Fraction (I: Integer) Return Fraction is
	begin
		Return (I, 1);
	End Entier_Fraction;

End Gestion_Fractions;
