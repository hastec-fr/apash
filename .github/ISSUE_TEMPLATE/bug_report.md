---
name: Bug report
about: Create a report to help us improve
title: ''
labels: NeedsTriage
assignees: hastec-fr

---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Import the packages :
```bash
   apash.import "fr.hastec.apash.commons-lang.StringUtils"
```
2. Execute the command with the following arguments :
```bash
  $ StringUtils.rightPad "It's not a bug, it's a feature "  35 "!"
  # Ouputs
  # It's not a bug, it's a feature !!!!
```

**Expected behavior**
A clear and concise description of what you expected to happen.

**Environment (please complete the following information):**
 - Apash version: apash --version 
 - Operating system (including version/distribution)
 - Shell type: [bash,zsh]
 - Shell version: echo $BASH_VERSION, echo $ZSH_VERSION
 - Install method: [by script, basher, raw]

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Additional context**
Add any other context about the problem here.
