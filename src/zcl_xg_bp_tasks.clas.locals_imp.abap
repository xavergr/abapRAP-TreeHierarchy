CLASS lsc_zi_tasks DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zi_tasks IMPLEMENTATION.

  METHOD save_modified.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_handler DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Tasks
        RESULT result,
      create_task_id FOR DETERMINE ON SAVE
        IMPORTING keys FOR Tasks~create_task_id.
ENDCLASS.

CLASS lcl_handler IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD create_task_id.

    "Ensure idempotence
    READ ENTITIES OF zi_tasks IN LOCAL MODE
      ENTITY Tasks
        FIELDS ( TaskID )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_tasks).

    DELETE lt_tasks WHERE TaskID IS NOT INITIAL.
    CHECK lt_tasks IS NOT INITIAL.

    "Get max travelID
    SELECT SINGLE FROM zi_tasks FIELDS MAX( TaskID ) INTO @DATA(lv_max_travelid).

    "update involved instances
    MODIFY ENTITIES OF zi_tasks IN LOCAL MODE
      ENTITY Tasks
        UPDATE FIELDS ( TaskID )
        WITH VALUE #( FOR task IN lt_tasks INDEX INTO i (
                           %tky      = task-%tky
                           TaskID  = lv_max_travelid + i ) ).

  ENDMETHOD.

ENDCLASS.
