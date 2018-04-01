<p align="center">
![moo](Resources/AppIcon.ico)
</p>

# The Moo Machine
The Moo Machine is an April Fools' joke Windows application created back in 2015.

## Summary
### Features
It was designed to be run at startup. Once every minute it will:

 1. Change the desktop wallpaper to one of the eight predefined wallpapers featuring cows.
 2. Play between one and six sounds of cows mooing.

If you want to have a look, the wallpapers and the sounds used are located in the [Resources](Resources) folder.

### Dependencies
The application was developed in Delphi 7, which allows it to work without any dependencies in most Windows operating systems.

## Installation Methods
### Simplest installation method
One simple method is to manually copy the executable into the Startup section of the Start Menu. This also has the downside of being very easy to detect and it requires access to the PC being pranked.

Copy `MooMachine.exe` to either:
1. For all users (requires administrative access): `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup`;
2. For a specific user: `%appdata%\Microsoft\Windows\Start Menu\Programs\Startup`, or simply `shell:Startup`.

### Using a WinRAR self-extractable
A method which can allow pranking someone else's computer is to use a
self-extractable WinRAR archive which might contain something of interest to
the user.

 1. Find something of interest to deliver to the person being pranked.
 2. Add the innocuous files to a SFX file, along with `MooMachine.exe`.
 3. To improve concealment of the `MooMachine.exe`, you can rename it something else and removing the `.exe` extension. One example would be using `SFXData` (without extension); that way, if the "victim" extracts the SFX manually, it won't catch much attention.
 4. In the _Setup_ section of the _Advanced SFX Options_ screen in WinRAR, you can configure to _Run after extraction_ the following:

 ``%comspec% /C "move SFXData %appdata%\Microsoft\Windows\Start Menu\Programs\Startup"``

 This will cause the move of the extracted `SFXData` to the current user's Startup.

### More complex methods
Both previous methods have the downside of being easy to detect. If true concealment is desired, use the Windows Registry for start-up and camouflage the application by removing its version information and changing the name and icon of the application to something harder to detect.
