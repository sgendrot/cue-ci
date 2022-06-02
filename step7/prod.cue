@if(prod)

package step7



deployments: mydep: {
	metadata: {
		labels: {
			env: "prod"
			domain: "prod"
			}
	}
}


deployments: depProd: spec: template: spec: containers: [{
	image: "gcr.io/myproj/bartender:v0.1.34"

}]

