@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '##GENERATED XG Task Idea'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['TaskID']
define view entity ZC_SUB_TASKS
  as projection on ZI_SUB_TASKS as SubTasks
{
  key TaskUUID,
      TaskID,
      TaskType,
      ParentTask,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Task       : redirected to parent ZC_XG_TASKS,
      _SubSubTask : redirected to composition child ZC_SUB_SUBTASKS
}
