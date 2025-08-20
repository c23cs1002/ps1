$info = "Hello world"
Invoke-RestMethod -Uri "https://webhook.site/75d4e516-a529-48b5-9fd2-6f3bd0bc8767" -Method Post -Body @{data=$info}
