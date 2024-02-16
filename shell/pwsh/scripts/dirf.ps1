param(
    [Parameter(Mandatory = $false)]
    [string]$str
)
pwd | ls | ? {$_.Name -match $str}
 
