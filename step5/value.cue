package step5


deployments: original: {}

deployments: changed: {
	metadata: {
		labels: {
			domain: "newdomain"
			}
	}
}

deployments: exposed: {
	metadata: {
		labels: {
			domain: "expose"
			}
	}
	ports: [8080,50]
}