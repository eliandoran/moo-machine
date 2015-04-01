{
  __  __             __  __            _     _            
 |  \/  | ___   ___ |  \/  | __ _  ___| |__ (_)_ __   ___ 
 | |\/| |/ _ \ / _ \| |\/| |/ _` |/ __| '_ \| | '_ \ / _ \
 | |  | | (_) | (_) | |  | | (_| | (__| | | | | | | |  __/
 |_|  |_|\___/ \___/|_|  |_|\__,_|\___|_| |_|_|_| |_|\___|

 April Fools' Day Joke                  31st of March 2015
 (C) 2015 by Elian Doran
}
program MooMachine;

{$R 'Resources.res' 'Resources.rc'}
{$R *.res}

uses
  Windows,
  DateUtils,
  SysUtils,
  MMSystem,
  ShlObj,
  Classes;

const
  ACTIVATION_MONTH  = 4;
  ACTIVATION_DAY    = 1;

  SOUND_COUNT       = 10;
  WALLPAPER_COUNT   = 8;

  MAX_TIMES_TO_MOO  = 6;

  INITIAL_DELAY     = 600000; // Default: 600000 ms = 10 min
  MIN_DELAY         = 120000; // Default: 120000 ms = 2 min
  MAX_DELAY         = 300000; // Default: 300000 ms = 5 min

function GetTemporaryDirectory: string;
var DirectoryPath: string;
begin
  DirectoryPath := GetEnvironmentVariable('TEMP') + '\MooMachine';
  ForceDirectories(DirectoryPath);

  GetTemporaryDirectory := DirectoryPath;
end;

procedure ExtractWallpapers;
var DirectoryPath: string;
    ResourceStream: TResourceStream;
    ResourceIndex: integer;
begin
  DirectoryPath := GetTemporaryDirectory;

  for ResourceIndex := 1 to WALLPAPER_COUNT do
    begin
      ResourceStream := TResourceStream.Create(
        HInstance,
        PChar('WALLPAPER' + IntToStr(ResourceIndex)),
        RT_RCDATA);

      try
        ResourceStream.Position := 0;
        ResourceStream.SaveToFile(DirectoryPath + '\' +
                                  IntToStr(ResourceIndex) + '.jpg');
      finally
        ResourceStream.Free;
      end;
    end;
end;

procedure SetWallpaper;
begin
  SystemParametersInfo(
    SPI_SETDESKWALLPAPER, 0,
    PChar(GetTemporaryDirectory + '\' + IntToStr(Random(WALLPAPER_COUNT) + 1) + '.jpg'),
    SPIF_SENDCHANGE);
end;

procedure Moo;
var Index: Integer;
begin
  while True do
    begin
      SetWallpaper;

      for Index := 1 to Random(MAX_TIMES_TO_MOO) + 1 do
        PlaySound(
          PChar('MOO' + IntToStr(Random(SOUND_COUNT) + 1)),
          0, SND_RESOURCE);

      Sleep(Random(MAX_DELAY - MIN_DELAY) + MIN_DELAY);
    end;
end;

begin
  if (MonthOf(Now) = ACTIVATION_MONTH) and
     (DayOf(Now) = ACTIVATION_DAY) then
  begin
    Sleep(INITIAL_DELAY);
    Randomize;
    ExtractWallpapers;
    Moo;
  end;
end.
