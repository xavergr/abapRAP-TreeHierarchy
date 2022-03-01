@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '##GENERATED XG Task Idea'
@ObjectModel.semanticKey: ['TaskID']
define root view entity ZI_TASKS
  as select from zxg_tasks as Tasks

    composition [0..*] of ZI_SUB_TASKS as _SubTask
{
  key task_uuid             as TaskUUID,
      task_id               as TaskID,
      task_type             as TaskType,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

            _SubTask


}
