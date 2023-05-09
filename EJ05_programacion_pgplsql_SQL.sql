-- EJERCICIOS
/*

1 - Escriba un bloque de codigo PL/pgSQL que reciba una nota como parametro
    y notifique en la consola de mensaje las letras A,B,C,D,E o F segun el valor de la nota

*/

DO $$
DECLARE nota integer:=2;
BEGIN
CASE nota
	WHEN 1 THEN
		RAISE NOTICE 'El valor es A';
	WHEN 2 THEN
		RAISE NOTICE 'El valor es B';
	WHEN 3 THEN
		RAISE NOTICE 'El valor es C';
	WHEN 4 THEN
		RAISE NOTICE 'El valor es D';
	WHEN 5 THEN
		RAISE NOTICE 'El valor es E';
	WHEN 6 THEN
		RAISE NOTICE 'El valor es F';
	ELSE
		RAISE NOTICE 'El valor es distinto';
	END CASE;
END;
$$
LANGUAGE 'plpgsql'

/*
2 - Escriba un bloque de codigo PL/pgSQL que reciba un numero como parametro
    y muestre la tabla de multiplicar de ese numero.
*/
DO $$
DECLARE valor integer:=2;

BEGIN
	FOR cont IN 1 .. 10 LOOP
		RAISE NOTICE '% x % = %',valor,cont,valor*cont;

	END LOOP;
END;

$$
LANGUAGE 'plpgsql'


/*
3 - Escriba una funcion PL/pgSQL que convierta de dolares a moneda nacional.
    La funcion debe recibir dos parametros, cantidad de dolares y tasa de cambio.
    Al final debe retornar el monto convertido a moneda nacional.
*/
DO $$
	DECLARE dollar integer:=1;
	DECLARE conv decimal:=1.25;
	BEGIN
		RAISE NOTICE 'La conversion de % dolares con una conversion de % es %',dollar,conv,dollar*conv;
	END;
$$
LANGUAGE 'plpgsql'

/*

4 - Escriba una funcion PL/pgSQL que reciba como parametro el monto de un prestamo,
    su duracion en meses y la tasa de interes, retornando el monto de la cuota a pagar.
    Aplicar el metodo de amortizacion frances.

*/
DO $$
	DECLARE prestamo decimal:=1000;
	DECLARE meses integer:=1;
	DECLARE interes decimal:=0.1/12;
	DECLARE cuota decimal:=1.00;
	BEGIN
		cuota=prestamo*(interes/(1-(1+interes)^(-meses)));
		RAISE NOTICE 'El monto % con una duracion de % meses a un interes de % da como resultado %',prestamo,meses,interes,cuota;

	END;

$$
LANGUAGE 'plpgsql'

