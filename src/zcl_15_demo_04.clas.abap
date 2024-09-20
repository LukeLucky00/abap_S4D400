CLASS zcl_15_demo_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_demo_04 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA flight_date TYPE /dmo/flight_date VALUE '20240917'.
    DATA carrier_id  TYPE /dmo/carrier_id  VALUE 'LH'.

    " Logische Operatoren: AND, OR, NOT
    " Vergleichoperatireb: <, <=, >, >=, =, <>

    IF ( flight_date >= '20240101' AND flight_date < '20250101' ) OR carrier_id = 'AA'.
      out->write( 'IF 1 erfüllt' ).

    ELSE.
      out->write( 'IF 1 nicht erfüllt' ).

    ENDIF.

    IF flight_date BETWEEN '20240101' AND '20250101'.
      out->write( 'IF 2 erfüllt' ).
    ENDIF.

    CLEAR carrier_id.
    carrier_id = '     '.
    IF carrier_id IS INITIAL. " carrier_id = ''.
      out->write( 'carrier_id ist Leer' ).
    ENDIF.

    out->write( COND #( WHEN flight_date BETWEEN '20240101' AND '20250101'
                        THEN 'Cond erfüllt'
                        ELSE 'Cond nicht erfüllt' ) ).

    "---Fasllunterscheidung
    carrier_id = 'LH'.

    CASE carrier_id.
      WHEN 'LH' OR 'lh' OR 'Lh' OR 'lH'.
        out->write( 'Lufthansa' ).
      WHEN 'AA' OR 'aa' OR 'Aa' OR 'aA'.
        out->write( 'American Airlines' ).
      WHEN OTHERS.
        out->write( carrier_id ).
    ENDCASE.


    out->write(
        SWITCH #( carrier_id
                  WHEN 'LH' OR 'lh' OR 'Lh' OR 'lH' THEN 'Lufthansa'
                  WHEN 'AA' OR 'aa' OR 'Aa' OR 'aA' THEN 'American Airlines'
                  ELSE                                   carrier_id ) ).
  ENDMETHOD.
ENDCLASS.
