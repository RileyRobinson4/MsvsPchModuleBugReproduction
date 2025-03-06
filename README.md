# MsvsPchModuleBugReproduction

I was successful in creating a minimally reproducible example. I have zipped up up the entire project and will upload it along with this post.

Contents:
build.ps1: You can use this to build the project and hopefully recreate the issue.
buildOutput.txt: The output I have from building this (with build.ps1), and it shows the issue.
generate_cmake_projects.ps1: The code that I used to generate the 256 projects in this example. Feel free to modify and run this if you want to regenerate the projects with different settings.

Steps to reproduce:
[Powershell Terminal]
./build.ps1

By the way, removing modules from this example changes the output and causes a different error. The linker appears to be crashing in that case.

