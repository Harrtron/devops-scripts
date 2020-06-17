## Script to delete all recovery points from a given AWS backup vault name. Created because I could not be bothered to go through one by one.

## SET PARAMS ##
$BACKUP_VAULT_NAME=""

$JSON=$(aws backup list-recovery-points-by-backup-vault --backup-vault-name $BACKUP_VAULT_NAME) | Out-String | ConvertFrom-Json
$RECOVERY_POINTS=$JSON.RecoveryPoints.RecoveryPointArn

foreach($RECOVERY_POINT in $RECOVERY_POINTS) 
{
    echo $RECOVERY_POINT
    ##delete them all!
    aws backup delete-recovery-point --backup-vault-name $BACKUP_VAULT_NAME --recovery-point-arn $RECOVERY_POINT
}
