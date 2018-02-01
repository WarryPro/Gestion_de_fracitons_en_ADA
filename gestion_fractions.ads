--------------------------------------------------------------------------------
-- 1. Implémentation d'un paquetage de fractions et d'un programme de test.-----
-- 2. Implémentation d'un paquetage de polynômes à coefficients fractionnaires--
-- et d'un programme de test.--
-- 3. Utilisation des paquetages de fractions et de polynômes pour une--
-- Implémentation D’Un Code De Reed-Solomon.--
--------------------------------------------------------------------------------

Package Gestion_Fractions is

	Type Fraction is
		Record
			Numerateur:	Integer	:=	0;
			Denominateur: Integer	:= 1;
		End record;

		DIV_PAR_ZERO: exception; -- Exception s'il y a une division par zéro--

		Procedure Get_Fraction (A: out Fraction; OP : out String; B : Out Fraction);
		Procedure Put_Fraction (F: In Fraction);

		Function Faire_Fraction (N, D : Integer) Return Fraction;

		Function Numer (X : Fraction) return Integer;
		Function Denom (X : Fraction) return Integer;

		Function PGCD (Numerateur, Denominateur : in Integer) return integer;

---------------------------------------------------------
------------ Fonctions pour les opérations --------------
---------------------------------------------------------
		Function "+" (X, Y : Fraction )  return Fraction;
		Function "-" (X, Y : Fraction )  return Fraction;
		
		-- Fonctions pour les Multiplications -- 
		Function "*" (X, Y : Fraction )  return Fraction; -- Multiplications entre Fractions --
		Function "*" (Entier : Integer; F : Fraction) Return Fraction; -- Multiplication entre Entier et Fraction --
		Function "*" (F : Fraction; Entier : Integer) Return Fraction; -- Multiplication entre Fraction et Entier --

		-- Fontions pour les Divisions --
		Function "/" (X, Y : Fraction )  return Fraction; -- Division entre Fractions --
		Function "/" (Entier : Integer; F : Fraction) Return Fraction; -- Division entre Entier et Fraction --
		Function "/" (F : Fraction; Entier : Integer) Return Fraction; -- Division entre Fraction et entier --
		


-------------------------------------------------------------------------------
-- Fonctions pour Reduire, Puissance, Fraction à entier et Entier à Fraction --
-------------------------------------------------------------------------------
		Function Reduire (X: Fraction) Return Fraction;
		Function "**" (F : Fraction; Exp : Integer) Return Fraction;
		Function Fraction_Entier (X: Fraction) Return Integer;
		Function Entier_Fraction (I: Integer) Return Fraction;

End Gestion_Fractions;
