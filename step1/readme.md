# Use Name in template


## Commands
```bash
cue eval *.cue


cue export *.cue --out yaml
```

## Explanations
In *template.cue*, we define a template **deployments** and we set values in *value.cue*
*Name* is the name of the template and we can use it inside the template.

Example:
```cue 
#Template
deployments: [Name=_]: {
	metadata: name: Name
	...
}

#Value
deployments: tutu: {}
```

In *value.cue*, **tutu** is the name of the deployment, it will use in the metadata name:
```yaml
deployments: {
    tutu: {
        metadata: {
            name: "tutu"
        }
    }
```

