package step4

deployments: basic: {}

deployments: changed: {
	metadata: {
		labels: {
			domain: "newdomain"
			}
	}
}

services: basic: {}
