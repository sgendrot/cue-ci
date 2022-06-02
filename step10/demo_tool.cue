package step10


import (
	"tool/cli"
	"tool/exec"
)

command: test_cli: {

  ask: cli.Ask & {
	  prompt:   "What is your name?"
	  response: string
  }

	display: cli.Print &{
		text: "hello "+ask.response
	}
}

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