# Create a command with ordered tasks


Official documentation:
- https://pkg.go.dev/cuelang.org/go/pkg/tool
- ``cue help cmd``


## Commands
```bash
cue cmd chained
cue chained

cue cmd chainedbad
cue chainedbad 
```


## Explanations

In a task definition, the field ``$after`` permit to order this task after another.

```cue
first: cli.Print & {
    text: "first"
}

second: cli.Print & {
    text: "second"
    $after: [first]
}

secondbis: cli.Print & {
    text: "secondbis"
    $after: [first]
}

third: cli.Print & {
    text: "third"
    $after: [second,secondbis]
}
```

this permit to be sure of the order.
