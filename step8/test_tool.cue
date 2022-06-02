package step8


import (
	"tool/cli"
)

command: hello: {
	task: print: cli.Print & {
		text: "hello world"
	}
}