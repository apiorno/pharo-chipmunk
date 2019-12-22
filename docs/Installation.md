# Installation

## Basic Installation

You can load **pharo-chipmunk** evaluating:

```smalltalk
Metacello new
  baseline: 'Chipmunk2D';
  repository: 'github://apiorno/pharo-chipmunk:release-candidate/source';
  load
```
>  Change `release-candidate` to some released version if you want a pinned version

## Using as dependency

In order to include **pharo-chipmunk** as part of your project, you should reference the package in your product baseline:

```smalltalk
setUpDependencies: spec

  spec
    baseline: 'Chipmunk2D'
      with: [ spec
        repository: 'github://apiorno/pharo-chipmunk:v{XX}/source';
        loads: #('Deployment') ];
    import: 'Chipmunk2D'.
```
> Replace `{XX}` with the version you want to depend on

```smalltalk
baseline: spec

  <baseline>
  spec
    for: #common
    do: [ self setUpDependencies: spec.
      spec package: 'My-Package' with: [ spec requires: #('Chipmunk2D') ] ]
```

## Provided groups

- `Deployment` will load all the packages needed in a deployed application
- `Tests` will load the test cases
- `CI` is the group loaded in the continuous integration setup
- `Development` will load all the needed packages to develop and contribute to the project