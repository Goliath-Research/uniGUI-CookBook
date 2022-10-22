unit IQMS.WebVcl.HyperLinkDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TIQWebHyperDlg = class( TComponent )
  private
    { Private declarations }
     FInitDir,
     FHyperlink,
     FHyperLinkAddress,
     FHyperLinkSubAddress,
     FCaption: String;
     //FAddressOnly,
     FShowSubAddress: Boolean;
     FShowSearchForFile: Boolean;
     FShowTextToDisplay: Boolean;
     FShowRemoveLink: Boolean;
     FFileFilter: String;
  protected
    { Protected declarations }
  public
    { Public declarations }
     constructor Create( AOwner:TComponent ); override;
     destructor Destroy; override;
     function Execute: Boolean;
     //property AddressOnly         : Boolean read FAddressOnly write FAddressOnly;
  published
    { Published declarations }
     property Caption             : String read FCaption write FCaption;
     property HyperLink           : String read FHyperlink write FHyperlink;
     property HyperLinkAddress    : String read FHyperLinkAddress write FHyperLinkAddress;
     property HyperLinkSubAddress : String  read FHyperLinkSubAddress write FHyperLinkSubAddress;
     property InitialDirectory    : String read FInitDir write FInitDir;
     property FileFilter          : String read FFileFilter write FFileFilter;
     property ShowSearchForFile     : Boolean read FShowSearchForFile write FShowSearchForFile;
     property ShowRemoveLink     : Boolean read FShowRemoveLink write FShowRemoveLink;
     property ShowSubAddress     : Boolean read FShowSubAddress write FShowSubAddress;
     property ShowTextToDisplay  : Boolean read FShowTextToDisplay write FShowTextToDisplay;
  end;

implementation

uses
//    Hyperfrm,
    IQMS.WebVcl.ResourceStrings;

constructor TIQWebHyperDlg.Create( AOwner:TComponent );
begin
    inherited Create( AOwner );
    Caption             := IQMS.WebVcl.ResourceStrings.cTXT0000047; // 'Insert Hyperlink'
    ShowSearchForFile   := TRUE;
    ShowRemoveLink      := TRUE;
    ShowSubAddress      := TRUE;
    ShowTextToDisplay   := TRUE;
    InitialDirectory    := '';
    HyperLink           := '';
    HyperLinkAddress    := '';
    HyperLinkSubAddress := '';
end;

destructor TIQWebHyperDlg.Destroy;
begin
  inherited Destroy;
end;

function TIQWebHyperDlg.Execute: Boolean;
//var
//   AHyperLink, AHyperLinkAddress, AHyperLinkSubAddress: String;
begin
  Result := False;
//  if DoHyperOpenDialog( self, AHyperLink, AHyperLinkAddress, AHyperLinkSubAddress ) then
//  begin
//    HyperLink           := AHyperLink;
//    HyperLinkAddress    := AHyperLinkAddress;
//    HyperLinkSubAddress := AHyperLinkSubAddress;
//    Result              := True;
//  end
end;

initialization
  {initial actions}

finalization
  {final actions}

end.

