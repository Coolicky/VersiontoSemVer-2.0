# Assembly Version to Semantic Versioning 2.0.0

A small build task that reads the assembly Version from the .NET AssemblyInfo file formats it to Sem-Ver 2.0 (required to post Universal Package Artifact) and outputs a build variable.

### Arguments
##### Path to AssemblyInfo file
*{Folder Path}\\AssemblyInfo.cs* is the default value.  This should find the C# AssemblyInfo file in the build sources directory. 

##### Variables Name
*VersionNumber* as default. Variable Name is the name of the variable to be used in the build. 

### Multiple Solutions
For multiple solutions task can be run multiple times with different Variable Names. 



This small tool is based on https://github.com/kyleherzog/AssemblyInfoReaderTask. Kyle Herzog's project can read all assembly info properties and operates on multiple solutions.