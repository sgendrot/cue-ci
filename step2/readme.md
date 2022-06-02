# Add data in template



## Commands
```bash
cue eval *.cue


cue export *.cue --out yaml
```


## Explanations
In *template.cue*, we define a template **deployments** and we set values in *value.cue*


We have 2 deployments:
- **original**: no modification of the template
- **add**: add *newlabel* metadata

CUE add element from the *value.cue*:
```cue
deployments: original: {}

deployments: add: {
	metadata: {
		labels: {
			newlabel: "added"
			}
	}
}
```
