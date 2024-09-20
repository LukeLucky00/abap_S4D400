CLASS zcl_15_demo_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_demo_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA word1 TYPE string VALUE 'Hello'.
    DATA word2 TYPE string VALUE 'World'.
    DATA result TYPE string.

    result &&= word1.
    result &&= result.
    out->write( result ).

    out->write( word1 && ' ' && word2 ).
    out->write( word1 && | | && word2 ).
    out->write( |{ word1 } { word2 }| ).

    DATA date TYPE d VALUE '20040824'.
    out->write( |Datum: { date DATE = ISO }| ).
    out->write( to_upper( word1 ) ).


  ENDMETHOD.
ENDCLASS.
