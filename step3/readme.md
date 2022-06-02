# Control value and default


## Commands
```bash
cue eval *.cue

cue export *.cue --out yaml
```


## Explanations
In *template.cue*, we define a template **deployments** and we set values in *value.cue*


We have 3 deployments:
- **original**: no modification of the template
- **changed**: change the label *domain* to "newdomain"
- **failed**: fail to change the label *domain* to integer

`string | *"prod"` permit to control the value is a string and use `prod` as default value.

If you remove `| *"prod"`, `string` will be considered as a value and not a type of value. 


The deployment **fail** we set an integer in *domain*(change it to string to fix).

The deployment **original** user the default value `prod`


more info: https://cuelang.org/docs/tutorials/tour/types/defaults/
