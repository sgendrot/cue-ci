@if(preprod)

package step7

deployments: mydep: {
	metadata: {
		labels: {
			env: "preprod"
			domain: "preprod"
			}
	}
}
