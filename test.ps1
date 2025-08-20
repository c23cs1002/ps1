$info = "Hello world"
Invoke-RestMethod -Uri "https://0x0.st" -Method Post -Body @{file=([System.Text.Encoding]::UTF8.GetBytes($info))} 
