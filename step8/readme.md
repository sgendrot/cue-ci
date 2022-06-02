# Create a command

Official documentation:
- https://pkg.go.dev/cuelang.org/go/pkg/tool
- ``cue help cmd``


## Commands
```bash
cue cmd hello
cue eval *.cue
```


## Explanations

Every file ending with ``_tool.cue`` (ex: *mycommand_tool.cue*) will consider as a command file.


A **command** is define by one or more **task**:
```cue
import (
	"tool/cli"
)

command: hello: {
	task: print: cli.Print & {
		text: "hello world"
	}
}
```
Here, we have create a command **hello** with a task **print** which use ``cli.Print`` to output a text.

<br>

The list of functions:
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

