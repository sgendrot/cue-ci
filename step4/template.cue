package step4

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

services: [ID=_]: _metadata & {
	apiVersion: "v1"
	kind:       "Service"
	_name:      ID
}