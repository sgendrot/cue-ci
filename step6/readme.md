# Inject values



## Commands
```bash
cue eval *.cue -T -t val=popo 
cue export *.cue -T -t val=popo --out yaml 

export myenvar="toto"
cue eval *.cue -T -t val=$myenvar
cue export *.cue -T -t val=$myenvar --out yaml 
```


## Explanations

We can inject values from the command line with tag, it's the system of **injection** (more info with the command ``cue help injection``)

To inject the value, you need to add ``@tag(myvalue)`` in the value file (it can be in the template):
```cue
newlabel: string | *"default" @tag(val)
```

Then, execute the cue command with the option ``-t``:
```bash
cue eval -c *.cue -t val=popo
```




You can use environment variables in the command line:
```bash
cue eval -c *.cue -t val=$myenvvar
```


**CUE** have predefined types: (now, os, cwd, username, hostname, rand)
```
The following variables are supported:

   now        current time in RFC3339 format.
   os         OS identifier of the current system. Valid values:
                aix       android   darwin    dragonfly
                freebsd   illumos   ios       js (wasm)
                linux     netbsd    openbsd   plan9
                solaris   windows
   cwd        working directory
   username   current username
   hostname   current hostname
   rand       a random 128-bit integer
```
We can use them with the option ``-T``

We will use the predefined type ``os`` in label **system** 
```cue
system: 	string | *"OS" @tag(os,var=os)
```
The command
```bash
cue eval -c *.cue -T
```


