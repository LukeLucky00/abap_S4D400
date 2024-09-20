CLASS zcl_15_demo_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_demo_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklaration einer 'Liste'
    DATA numbers TYPE TABLE OF i. " ist dynamisch

    " Einfügen von Datensätzen
    numbers = VALUE #( ( 6 ) ( 7 ) ( 254 ) ).

    APPEND 42 TO numbers.
    APPEND -3 TO numbers.
    APPEND 7 TO numbers.
    APPEND 7 TO numbers.
    APPEND 12 TO numbers.
    APPEND 9 TO numbers.
    APPEND -5 TO numbers.

    " Lesen von Datensätzen
    TRY.
        out->write( |Dritte Zahl: { numbers[ 3 ] } | ).
        out->write( |Error: { numbers[ 0 ] } | ).
      CATCH cx_sy_itab_line_not_found INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    IF line_exists( numbers[ lines( numbers ) ] ).
      out->write( |Letzte Zahl: { numbers[ lines( numbers ) ] } | ).
    ENDIF.


    LOOP AT numbers INTO DATA(number) WHERE table_line > 0.
      out->write( |number: { number }| ).
    ENDLOOP.


    " Länge
    out->write( |Länge der Liste: { Lines( numbers ) }| ).

    out->write( numbers ).
  ENDMETHOD.
ENDCLASS.
