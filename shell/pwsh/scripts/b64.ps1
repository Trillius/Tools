<#
.SYNOPSIS
    Encodes or decodes a string using Base64 encoding.
.DESCRIPTION
    This script can encode a string to Base64 format or decode a Base64 encoded string. 
    It requires a string input and a switch to specify the operation (encode or decode).
.PARAMETER str
    The string to be encoded or decoded.
.PARAMETER e
    A switch to indicate that the string should be encoded to Base64.
.PARAMETER d
    A switch to indicate that the string should be decoded from Base64.
.EXAMPLE
    .\b64.ps1 -e -str "Hello World"
    Encodes "Hello World" to Base64.
.EXAMPLE
    .\b64.ps1 -d -str "SGVsbG8gV29ybGQ="
    Decodes "SGVsbG8gV29ybGQ=" from Base64 to plain text.
.NOTES
    Ensure that when decoding, the input string is a valid Base64 encoded string, 
    otherwise, the script will throw an error.
    To use the command b64, add the alias b64 to the current user powershell profile (adjust path as necessary):
    1 - Edit your ps profile
            code $profile
    2 - add this line: 
            Set-Alias -Name b64 -Value "$($env:UserProfile)\b64.ps1"
.LINK
    https://learn.microsoft.com/en-us/dotnet/api/system.convert.tobase64string?view=net-8.0
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$str,

    [Parameter(Mandatory = $false)]
    [switch]$e = $false,

    [Parameter(Mandatory = $false)]
    [switch]$d = $false,

    [Parameter(Mandatory = $false)]
    [switch]$h = $false
)

function Invoke-EncodeBase64($inputString) {
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($inputString)
    $encodedString = [System.Convert]::ToBase64String($bytes)
    return $encodedString
}

function Invoke-DecodeBase64($inputString) {
    $bytes = [System.Convert]::FromBase64String($inputString)
    $decodedString = [System.Text.Encoding]::UTF8.GetString($bytes)
    return $decodedString
}

switch ($true) {
    { $h } {
        Get-Help $MyInvocation.MyCommand.Path -Full
        break
    }
    { $e } {
        if ([string]::IsNullOrEmpty($str)) {
            Write-Output "No string provided for encoding."
            return
        } 
        $encoded = Invoke-EncodeBase64 -inputString $str
        Write-Output "Encoded string: $encoded"
        break
    }
    { $d } {
        if ([string]::IsNullOrEmpty($str)) {
            Write-Output "No string provided for decoding."
            return
        }
        else {
            $output = Invoke-DecodeBase64 -inputString $str
            Write-Output $output
        }
        break
    }   
    default {
        Write-Output "Please specify either -e to encode, -d to decode, or -h for help."
    }
}
