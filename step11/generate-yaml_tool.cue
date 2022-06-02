package step11

import (
	"encoding/yaml"
	"tool/cli"
)



command: gen_yaml: {
	task: print: cli.Print & {
		text: yaml.MarshalStream(objects)
	}
}
