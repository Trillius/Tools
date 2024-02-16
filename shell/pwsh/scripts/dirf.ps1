param(
    [Parameter(Mandatory = $false)]
    [string]$str
)
pwd | dir | ? {$_.Name -match $str}
 
