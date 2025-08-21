<#
.SYNOPSIS
  Sends an email via Gmail SMTP (or any SMTP server requiring auth).
.DESCRIPTION
  Uses System.Net.Mail.SmtpClient with credentials & SSL.
  Requires an App Password for Gmail (not your account password).
.NOTES
  Author: root
#>

param(
  [string]$From     = "robinetpetitjeanabsp@gmail.com",
  [string]$To       = "valentin.seux@yopmail.com",
  [string]$Subject  = "Test email from PowerShell",
  [string]$Body     = "Hello, this is a test message.",
  [string]$SMTPHost = "smtp.gmail.com",
  [int]   $SMTPPort = 587,
  [string]$Username = "robinetpetitjeanabsp@gmail.com",
  [string]$Password = "osgc tfxh yaqo tytl"
)

try {
  if ($Password -eq "") {
    $secure = Read-Host "Enter App Password" -AsSecureString
    $bstr   = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
    $Password = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
  }

  $msg = New-Object System.Net.Mail.MailMessage
  $msg.From = $From
  $msg.To.Add($To)
  $msg.Subject = $Subject
  $msg.Body = $Body

  $smtp = New-Object System.Net.Mail.SmtpClient($SMTPHost, $SMTPPort)
  $smtp.EnableSsl = $true
  $smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password)

  $smtp.Send($msg)
  Write-Host "Message sent successfully to $To"
}
catch {
  Write-Error "Failed to send message: $($_.Exception.Message)"
}
