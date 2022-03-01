CLASS lhc_subsubtasks DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS create_task_id FOR DETERMINE ON SAVE
      IMPORTING keys FOR SubSubTasks~create_task_id.

ENDCLASS.

CLASS lhc_subsubtasks IMPLEMENTATION.

  METHOD create_task_id.
    "Ensure idempotence
    READ ENTITIES OF zi_tasks IN LOCAL MODE
      ENTITY SubSubTasks
        FIELDS ( TaskID )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_tasks).

    DELETE lt_tasks WHERE TaskID IS NOT INITIAL.
    CHECK lt_tasks IS NOT INITIAL.

    "Get max travelID
    SELECT SINGLE FROM zi_sub_tasks FIELDS MAX( TaskID ) INTO @DATA(lv_max_travelid).

    "update involved instances
    MODIFY ENTITIES OF zi_tasks IN LOCAL MODE
      ENTITY SubSubTasks
        UPDATE FIELDS ( TaskID )
        WITH VALUE #( FOR task IN lt_tasks INDEX INTO i (
                           %tky      = task-%tky
                           TaskID  = lv_max_travelid + i ) ).
  ENDMETHOD.

ENDCLASS.

CLASS lhc_SubTasks DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create_task_id FOR DETERMINE ON SAVE
      IMPORTING keys FOR SubTasks~create_task_id.

ENDCLASS.

CLASS lhc_SubTasks IMPLEMENTATION.

  METHOD create_task_id.
    "Ensure idempotence
    READ ENTITIES OF zi_tasks IN LOCAL MODE
      ENTITY SubTasks
        FIELDS ( TaskID )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_tasks).

    DELETE lt_tasks WHERE TaskID IS NOT INITIAL.
    CHECK lt_tasks IS NOT INITIAL.

    "Get max travelID
    SELECT SINGLE FROM zi_sub_tasks FIELDS MAX( TaskID ) INTO @DATA(lv_max_travelid).

    "update involved instances
    MODIFY ENTITIES OF zi_tasks IN LOCAL MODE
      ENTITY SubTasks
        UPDATE FIELDS ( TaskID )
        WITH VALUE #( FOR task IN lt_tasks INDEX INTO i (
                           %tky      = task-%tky
                           TaskID  = lv_max_travelid + i ) ).
  ENDMETHOD.

ENDCLASS.
