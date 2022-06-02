@if(staging)

package step7



deployments: mydep: {
	metadata: {
		labels: {
			env: "staging"
			domain: "staging"
			}
	}
}
