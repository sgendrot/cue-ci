package step9


import (
	"tool/cli"
)

command: chained: {


		secondbis: cli.Print & {
				text: "secondbis"
				$after: [first]
		}

		first: cli.Print & {
				text: "first"
		}

		third: cli.Print & {
				text: "third"
				$after: [second,secondbis]
		}

		second: cli.Print & {
				text: "second"
				$after: [first]
		}
}

command: chainedbad: {


		secondbis: cli.Print & {
				text: "secondbis"
				$after: [first]
		}

		first: cli.Print & {
				text: "first"
		}

		third: cli.Print & {
				text: "third"
				$after: [second]
		}

		second: cli.Print & {
				text: "second"
				$after: [first]
		}
}