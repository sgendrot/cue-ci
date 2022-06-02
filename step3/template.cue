package step3

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