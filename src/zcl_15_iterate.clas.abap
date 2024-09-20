CLASS zcl_15_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA max_count TYPE i VALUE 30.
    DATA numbers TYPE TABLE OF i.
    DATA output TYPE TABLE OF string.


    DO max_count TIMES.
      IF sy-index <= 2.
        APPEND sy-index - 1 TO numbers.
      ELSE.
        APPEND ( numbers[ sy-index - 1 ] + numbers[ sy-index - 2 ] ) TO numbers.
      ENDIF.
    ENDDO.

    loop at numbers into data(number).
      append |{ sy-tabix WIDTH = 3 ALIGN = LEFT } : { number WIDTH = 5 ALIGN = RIGHT }| to output.
    endloop.

    out->write( output ).

  ENDMETHOD.
ENDCLASS.
