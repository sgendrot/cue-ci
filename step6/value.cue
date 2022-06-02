package step6

deployments: original: {}

deployments: inject: {
	metadata: {
		labels: {
			domain: "prod"
			newlabel: string | *"default" @tag(val)
			system: 	string | *"OS" @tag(os,var=os)
			}
	}
}
