@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZI_TASKS'
@ObjectModel.semanticKey: ['TaskID']
define root view entity ZC_XG_TASKS
  provider contract transactional_query
  as projection on ZI_TASKS
{
  key TaskUUID,
      TaskID,
      TaskType,
      LocalLastChangedAt,

      _SubTask : redirected to composition child ZC_SUB_TASKS
}
