# The Moo Machine
The Moo Machine is an April Fools' joke Windows application. It was designed to be run at startup.

## Features
Once every minute it will:

 1. Change the desktop wallpaper to one of the eight predefined wallpapers featuring cows.
 2. Play between one and six sounds of cows mooing.

## Dependencies
The application is developed in Delphi, which allows it to work without any dependencies in most Windows operating systems.

## Installation Method
### Simplest installation method
One simple method is to manually copy the executable into the Startup section of the Start Menu. This also has the downside of being very easy to detect and it requires access to the PC being pranked.

Copy `MooMachine.exe` to either:
1. For all users (requires administrative access): `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup`;
2. For a specific user: `%appdata%\Microsoft\Windows\Start Menu\Programs\Startup`, or simply `shell:Startup`.
