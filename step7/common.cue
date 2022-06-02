package step7


deployments: mydep: {
	metadata: {
		labels: {
			labelX: "common"
			env: string | *"dev"
			}
	}
}
