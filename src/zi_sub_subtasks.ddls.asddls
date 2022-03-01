@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '##GENERATED XG Task Idea'
@ObjectModel.semanticKey: ['TaskID']
define view entity ZI_SUB_SUBTASKS
  as select from zxg_sub_subtasks as SubSubTasks
  association        to parent ZI_SUB_TASKS as _SubTask  on $projection.SubTask = _SubTask.TaskUUID
  association [1..1] to ZI_TASKS            as _MainTask on $projection.MainTask = _MainTask.TaskUUID
{
  key task_uuid             as TaskUUID,
      task_id               as TaskID,
      task_type             as TaskType,
      main_task             as MainTask,
      sub_task              as SubTask,

      //      sub_task            as DaddyTask,
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

      _SubTask,
      _MainTask

}
