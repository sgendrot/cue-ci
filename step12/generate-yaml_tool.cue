package ci_cue

import (
	"encoding/yaml"
	"tool/cli"
)


// We use objects to regroup every elements
objects: [ for v in objectSets for x in v { x } ]

objectSets: [
	services,
	deployments,
]


command: gen_yaml: {
	task: print: cli.Print & {
		text: yaml.MarshalStream(objects)
	}
}
