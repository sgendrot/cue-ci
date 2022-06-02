package step3

deployments: original: {}

deployments: changed: {
	metadata: {
		labels: {
			domain: "newdomain"
			}
	}
}


deployments: failed: {
	metadata: {
		labels: {
			domain: 2
			}
	}
}
