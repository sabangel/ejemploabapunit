*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_dao_mock DEFINITION CREATE PUBLIC.
  		
  PUBLIC SECTION.
    INTERFACES zif_unitsample_dao.
    ALIASES find_invoices FOR zif_unitsample_dao~find_invoices.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_dao_mock IMPLEMENTATION.

  METHOD zif_unitsample_dao~find_invoices.

    rt_result = VALUE #(
        ( vbeln = '9000000001' fktyp = 'L' kunrg = '20000001' ernam = 'USER1' )
        ( vbeln = '9000000002' fktyp = 'L' kunrg = '20000002' ernam = 'USER2' )
        ( vbeln = '9000000003' fktyp = 'L' kunrg = '20000003' ernam = 'USER3' )
    ).
  ENDMETHOD.

ENDCLASS.
