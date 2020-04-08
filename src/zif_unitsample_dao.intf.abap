INTERFACE zif_unitsample_dao
  PUBLIC .

  TYPES tt_date_range TYPE RANGE OF d.
  TYPES tt_invoices TYPE STANDARD TABLE OF vbrk WITH KEY primary_key COMPONENTS kunrg.

  METHODS find_invoices
    IMPORTING iv_type          TYPE fktyp
              iv_client        TYPE kunnr
              iv_date_range    TYPE tt_date_range
    RETURNING VALUE(rt_result) TYPE tt_invoices.

ENDINTERFACE.
