# Input and output of task

Official documentation:
- https://pkg.go.dev/cuelang.org/go/pkg/tool
- ``cue help cmd``


## Commands
```bash
cue cmd test_cli
cue test_cli

cue cmd test_exec
cue test_exec 
```


## Explanations

Some commands provide input and output, for example ``cli.Ask`` has en output ``response``:
```cue
command: test_cli: {
	
  ask: cli.Ask & {
    prompt:   "What is your name?"
    response: string
  }

  display: cli.Print &{
	text: "hello "+ask.response
  }
}
```

The command ``exec.Run`` has an input ``stdin``, an input ``stdout`` and ``stderr``:
```cue
command: test_exec: {

  ask: cli.Ask & {
    prompt:   "What is your name?"
    response: string
  }

  echo: exec.Run & {
	cmd: ["echo", "Hello", ask.response + "!"]
	stdout: string // capture stdout, don't print to the terminal
  }

  display: cli.Print &{
	text: "sdout of task echo: " + echo.stdout
  }
}
```

<br>

More info in the documentation of tasks:

- ``cli.Ask``: ask an input to user [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/cli)
- ``cli.Print``: output a text [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/cli)
- ``exec.Run``: run a bash command [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/exec)
- ``file.Read``: read the content of a file [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/file)
- ``file.Append``: append a file [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/file)
- ``file.Glob``: list files [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/file)
- ``file.Mkdir``: create a directory [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/file)
- ``file.MkdirAll``: create a directory and parents [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/file)
- ``file.MkdirTemp``: create a directory [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/file)
- ``file.RemoveAll``: delete path and childs [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/file)
- ``http.Do``: do a HTTP call (GET/POST/PUT/DELETE) [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/http)
- ``os.Setenv``: create a env var [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/os)
- ``os.Getenv``: get a env var [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/os)
- ``os.Environ``: get all env var [(Documention)](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/tool/os)


