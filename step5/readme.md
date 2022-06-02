# Loop on field of an element


## Commands
```bash
cue eval *.cue

cue export *.cue --out yaml
```


## Explanations

We can do loop in Cuelang: [Official documentation on loop](https://cuelang.org/docs/tutorials/tour/expressions/listcomp/)

In the official documentation, it's a loop on a list, in our case, we want a loop on the sub-field **port** of our deployments.

The template **deployments**:
```cue
deployments: [Name=_]: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name: Name
		labels: {
			app:       Name
			domain:    string | *"prod"
		}
	}
}
```

The port isn't present in the template because is optional, so we need a condition inside the loop. The official documention on [conditional fields](https://cuelang.org/docs/tutorials/tour/expressions/conditional/).

The loop:
```cue
for name, dep in deployments {
	if dep["ports"] != _|_ {
```

First line: it's a key/value loop on deployments:
- **name**: name of the deployment
- **dep**: the data of a deployment


Second line: we test if the field **port** exist with ``if dep["ports"] != _|_`` .
The ``_|_`` is *bottom*, it's an error or missing field ([the documentation on Values](https://cuelang.org/docs/references/spec/#values-1)):
> At the bottom of the lattice is the value called bottom, denoted &#95;|&#95;. A bottom value usually indicates an error. Bottom is an instance of every value.

<br>

**Important**:<br>
Don't use the name of a field as variable of the loop (**name** and **dep** in the example). Otherwise, the loop acts strangely.

<br>


<br>
Then we need to create an element **services** and to use the loop to create every **service**


The template **services**:
```cue
services: [Name=_]: {
	apiVersion: "apps/v1"
	kind:       "Service"
}
```

and the loop:
```cue
for name, dep in deployments {
	if dep["ports"] != _|_ {
	services: "\(name)": {
		spec: selector: dep.metadata.labels

		spec: ports: [
			for p in dep.ports {
				port:       *p | int
				targetPort: *p | int
			},
		]
	}
	}
}
```
**dep** refer to the data of the deployment and **services** to the template of service:
- ``for name, dep in deployments``: a loop on every deployment
- ``if dep["ports"] != _|_``: only if the field ports exist in the deployment
- ``services: "\(name)":`` it will create a new service with the name of the deployment (**name** come from the loop) 
- ``spec: selector: dep.metadata.labels``: we use the labels of the deployment as selector of the service 
- ``spec: ports: [``: we add a field **ports** in the new service
- ``for p in dep.ports {``: second loop to map every ports
- ``port: *p | int`` and ``targetPort: *p | int``  to add source and target port in the service definition


## Examples
- the deployments **original** and **changed** haven't any port
- the deployment **exposed** have ports 8080 and 50