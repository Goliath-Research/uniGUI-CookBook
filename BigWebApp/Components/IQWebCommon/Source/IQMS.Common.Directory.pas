unit IQMS.Common.Directory;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.FileCtrl,
  Outline;

  {Displays directory browser.  This unit serves as a wrapper for BrowsDir.pas.}
  {Returns true if the directory browser was executed and the Ok button was pushed;
  returns false if the cancel button was pushed.  ADirectory, if supplied, is
  the initital directory for the browser and will be filled with the user's
  new directory choice.}
  function DirBrowse( var ADirectory : String;
                      ACaption : String = 'Select Directory' ): Boolean;

implementation

uses
  IQMS.Common.BrowsDir,
  IQMS.Common.ResStrings;


function DirBrowse( var ADirectory : string;
                    ACaption : String = 'Select Directory' ): Boolean;
begin

     Result := FALSE;                           //initialize

//     with TIQWebDirectoryBrowser.Create( Application ) do
//          try
//              Directory := ADirectory;          //Initial directory
//
//              // Ensure default caption is localized
//              if ACaption = 'Select Directory' then ACaption := IQMS.Common.ResStrings.cTXT0000002;
//
//              Title     := ACaption;            //Caption displayed above the directory tree
//              if Execute then
//                 begin
//                      ADirectory := Directory;  //New directory result
//                      Result     := TRUE;       //Modal result
//                 end;
//          finally
//              Free;                             //Free the directory browser
//          end;

end;

end.

