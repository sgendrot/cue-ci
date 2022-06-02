package step5


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


services: [Name=_]: {
	apiVersion: "apps/v1"
	kind:       "Service"
}


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