$info = "Hello world"
Invoke-RestMethod -Uri " https://webhook.site/1c5b955b-3946-4485-a55c-41382b24ae2b" -Method Post -Body @{data=$info}
