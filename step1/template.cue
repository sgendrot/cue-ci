package step1

deployments: [Name=_]: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: name: Name
}