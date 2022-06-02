# Use a hidden field in template 

## Commands
```bash
cue eval *.cue

cue export *.cue --out yaml
```


## Explanations
In the documentation:
> A non-quoted field name that starts with an underscore (`_`) is not emitted from the output.

Definition of a hidden field:
```cue
_metadata: {
	_name: string
	metadata: {
		name: _name
		labels: {
			app:       _name
			domain:    string | *"prod"
		}
	}
}
```

### Use hidden field to repeat code

We can use this hidden field in template to repeat code.

```cue
_metadata: {
	_name: string
	metadata: {
		name: _name
		labels: {
			app:       _name
			domain:    string | *"prod"
		}
	}
}

deployments: [ID=_]: _metadata & {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	_name:      ID
}

services: [ID=_]: _metadata & {
	apiVersion: "v1"
	kind:       "Service"
	_name:      ID
}
```

We reuse the hidden field **metabase** in **deployments** and **services**.
We include it in a template with ``services: [ID=_]: _metadata &``.

We use ``_name`` in the hidden field and we define it in deploymens/services (it's **ID** which is the name of the element in *value.cue*.

We can include several hidden fields:

```cue
_metadata: {
	_name: string
	metadata: {
		name: _name
		labels: {
			app:       _name
			domain:    string | *"prod"
		}
	}
}


_spec_dep: {
	_name: string

	metadata: name: _name
	spec: selector: {}
	spec: template: {
		metadata: labels: {
			app:       _name
			domain:    "prod"
		}
		spec: containers: [{name: _name}]
	}
}


deployments: [ID=_]: _metadata & _spec_dep & {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	_name:      ID
}

services: [ID=_]: _metadata & {
	apiVersion: "v1"
	kind:       "Service"
	_name:      ID
}
```

### Use hidden field in another hidden field

We can use a hidden field anywhere in 

```cue
_metadata: {
	_name: string
	metadata: {
		name: _name
		labels: {
			app:       _name
			domain:    string | *"prod"
		}
	}
}


_spec_dep: {
	_name: string

	metadata: name: _name
	spec: selector: {}
	spec: template: _metadata & {
		_name:   "popo"
		spec: containers: [{name: _name}]
	}
}


deployments: [ID=_]: _metadata & _spec_dep & {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	_name:      ID
}
```
In this example, we will add **metadata** and **spec_dep** in **deployments**, and **metadata** in **spec_dep**.
