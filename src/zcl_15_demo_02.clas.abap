CLASS zcl_15_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_demo_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA result TYPE p LENGTH 16 DECIMALS 4.
    result = 5 + 3.
    out->write( result ).
    result = 5 - 3.
    out->write( result ).
    result = 5 * 3.
    out->write( result ).
    result = 5 / 3.
    out->write( result ).
    result = 5 div 3.
    out->write( result ).
    result = 5 mod 3.
    out->write( result ).
    result = 5 ** 3.
    out->write( result ).

    " Inkrementieren / Dekremenieren
    CLEAR result.
    result += 1.
    out->write( result ).
    result -= 1.
    out->write( result ).



    result = abs(  -4 ).
    out->write( result ).
    result = round( val = '55.875' dec = 2 ).
    out->write( result ).
    result = round( val = '55.875' dec = -1 ).
    out->write( result ).


  ENDMETHOD.
ENDCLASS.
