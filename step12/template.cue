package ci_cue


deployments: [Name=_]:  _metadata & _spec_deploy & {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	_name:      Name
}


_metadata: {
	_name: string
	metadata: {
		name: _name
		labels: {
			app:       _name
			domain:    string | *"prod"
		}
		annotations: {
		  template: "console"
		}
	}
}


_spec_deploy: {
	_name: string

	spec: {
			replicas: int | *1
			selector: {
				matchLabels: deployments[_name].metadata.labels
			}
			template: {
				spec:imagePullSecrets: [
          {name: "regcred"}
        ]
				metadata:labels: deployments[_name].metadata.labels
				metadata:annotations: deployments[_name].metadata.annotations
			}
	}
}


services: [Name=_]: {
	apiVersion: "v1"
	kind:       "Service"
}


for dep in deployments {
	if dep.spec.template.spec.containers != _|_ {
		for cr in dep.spec.template.spec.containers {
				if cr["ports"] != _|_ {
					services: "\(dep.metadata.name)-\(cr.name)": {
						metadata:name: dep.metadata.name + "-" + cr.name
						metadata:labels: dep.metadata.labels
						spec: selector: dep.metadata.labels
						spec: ports: [{
								name: cr.name
								port:       cr["ports"][0].containerPort
								targetPort: cr["ports"][0].containerPort
								protocol: cr["ports"][0].protocol | *"TCP"
						}]
						spec:type: string | *"ClusterIP"
					}
				}
		}
	}
}