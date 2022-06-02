# Generate valid Kubernetes yaml files

We will use a commands and CUE packages to generate Yaml files. 


## Commands
```bash
cue cmd gene_yaml
cue gene_yaml
```


## Explanations
CUE have [builting packages](https://cuelang.org/docs/concepts/packages/#builtin-packages) and we will use the package [encoding/yaml](https://pkg.go.dev/cuelang.org/go@v0.4.3/pkg/encoding/yaml).

The function ``yaml.MarshalStream`` use a list to generate the yaml file, but ``deployments`` is a map then we transform it as a list:
```cue
objects: [ for adep in deployments  { adep } ]
```

Use ``cue eval *.cue`` to see the difference between ``deployements`` and ``objects``.

<br>

We use ``objects`` in ``yaml.MarshalStream`` to create a command which generate valid Kubernetes yaml:
```cue
command: gen_yaml: {
	task: print: cli.Print & {
		text: yaml.MarshalStream(objects)
	}
}
```

Then we can call ``gen_yaml`` to generate valid Kubernetes yaml.