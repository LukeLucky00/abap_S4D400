CLASS zcl_15_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_15_demo_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " ---Datentypen
    " Zeichenkette
    TYPES ty_first_name     TYPE string.                 " Bsp. 'Lukas'
    TYPES ty_last_name      TYPE c LENGTH 20.            " Bsp. 'Held'
    TYPES ty_iuser          TYPE n LENGTH 6.             " Bsp. '740305'
    TYPES ty_birth_date     TYPE d.                      " Bsp. '20040824'
    TYPES ty_birth_time     TYPE t.                      " Bsp. '043023'

    " Ganze Zahlen
    TYPES ty_number         TYPE i.                      " Bsp. -476

    " Kommazahl
    TYPES ty_salary_in_euro TYPE p LENGTH 16 DECIMALS 2. " Bsp. '54623.88'

    " 'Boolscher Wahrheitswert'
    TYPES ty_error_flag     TYPE c LENGTH 1.             " Bsp. 'X'(true) oder ' '(false)

    " ---Deklarationen und Wertzuweisung
    DATA first_name TYPE string.
    DATA last_name  TYPE ty_last_name.

    first_name = 'Lukas'.
    last_name = 'Held'.

    DATA iuser TYPE ty_iuser VALUE '750305'.
    DATA(birth_date) = '20040824'.
    DATA birth_city TYPE /DMO/city VALUE 'Kronberg'.

    CONSTANTS pi TYPE p LENGTH 2 DECIMALS 2 VALUE '3.14'.



    out->write( first_name ).
    out->write( last_name ).
    out->write( iuser ).
    out->write( birth_date ).
    out->write( pi ).
    out->write( birth_city ).
  ENDMETHOD.
ENDCLASS.
