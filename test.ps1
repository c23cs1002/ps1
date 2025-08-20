$info = "Hello world"
Invoke-RestMethod -Uri "https://webhook.site/YOUR_UNIQUE_ID" -Method Post -Body @{data=$info}
