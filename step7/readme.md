# Values files per environments

We can use tag to use values files per environments (staging/preprod/prod). 


## Commands
```bash
cue eval -c *.cue -t staging
cue export *.cue -t staging

cue eval -c *.cue -t preprod
cue export *.cue -t preprod

cue eval -c *.cue -t prod
cue export *.cue -t prod 
```


## Explanations

We will tag to create optional values files, these files will be use if a specific tag is present.

We add at the **first line of the file**:
```cue
@if(myenv)
```
and we set the tag ``myenv`` in the command line:
```bash
cue eval -c *.cue -t myenv
```

In the example, we have 5 files:
- **template.cue**: the template file
- **common.cue**: the values to use in every environment and default values
- **staging.cue**: the files to load with ``-t staging``
- **preprod.cue**: the files to load with ``-t preprod``
- **prod.cue**: the files to load with ``-t prod``

<br>

**Important:**

If you want to set a default value, you can use ``string | *"default"`` in **common.cue**. If you set it in **common** (like *labelX*), you can't change it.