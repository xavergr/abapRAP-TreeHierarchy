@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '##GENERATED XG Task Idea'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['TaskID']
define view entity ZC_SUB_SUBTASKS
  as projection on ZI_SUB_SUBTASKS as SubTasks
{
  key TaskUUID,
      TaskID,
      TaskType,
      MainTask,
      SubTask,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _SubTask  : redirected to parent ZC_SUB_TASKS,
      _MainTask : redirected to ZC_XG_TASKS
}
