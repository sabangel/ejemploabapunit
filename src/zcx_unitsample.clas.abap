class ZCX_UNITSAMPLE definition
  public
  inheriting from CX_STATIC_CHECK
  create public .

public section.

  constants BAD_DATE type SOTR_CONC value '25A75CA1EE3A1EEA9EA5F5EC23FE9D13'. "#EC NOTEXT

  methods CONSTRUCTOR
    importing
      !TEXTID like TEXTID optional
      !PREVIOUS like PREVIOUS optional .
protected section.
private section.
ENDCLASS.



CLASS ZCX_UNITSAMPLE IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
TEXTID = TEXTID
PREVIOUS = PREVIOUS
.
  endmethod.
ENDCLASS.
