@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '##GENERATED XG Task Idea'
@ObjectModel.semanticKey: ['TaskID']
define view entity ZI_SUB_TASKS
  as select from zxg_sub_tasks as SubTasks
  association to parent ZI_TASKS        as _Task on $projection.ParentTask = _Task.TaskUUID
  composition [0..*] of ZI_SUB_SUBTASKS as _SubSubTask
{
  key task_uuid             as TaskUUID,
      task_id               as TaskID,
      task_type             as TaskType,
      parent_task           as ParentTask,
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

      _Task,
      _SubSubTask

}
