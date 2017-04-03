$rgs = Get-AzureRmResourceGroup

foreach ($rg in $rgs)
{
    $disks = Get-AzureRmDisk -ResourceGroupName $rg.ResourceGroupName
    foreach ($disk in $disks)
    {
        if ($disk.OwnerId) {}
        else 
        {
            Remove-AzureRmDisk -ResourceGroupName $rg.ResourceGroupName -DiskName $disk.Name -Force
        }
    }
}
