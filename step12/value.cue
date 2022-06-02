package ci_cue

deployments: original: {

	spec:template:spec:containers: {
	[ {
					name: "rr"
					image: "ubuntu"
					command: [ "/bin/bash", "-c", "--" ]
    			args: [ "while true; do sleep 30; done;" ]
			},
		]
	}
}

deployments: changed: {
	metadata: {
		labels: {
			domain: "newdomain"
			}
	}
	spec:template:spec:containers: {
		[ {
					name: "sf"
					image: "ubuntu"
					command: [ "/bin/bash", "-c", "--" ]
    			args: [ "while true; do sleep 30; done;" ]
          ports: [
             {containerPort: 9000}
            ]
			},{
					name: "nginx"
					image: "ubuntu"
					command: [ "/bin/bash", "-c", "--" ]
    			args: [ "while true; do sleep 30; done;" ]
          ports: [
             {
             	containerPort: 80,
              protocol: "UDP"
             }
            ]
			},
		]
	}
}
