unit rmng_NewRelease;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Grids,
  FileCtrl,
  Buttons,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniStringGrid,
  uniLabel, MainModule,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton;

type
  TFrmNewRelease = class(TUniForm)
    edName: TUniEdit;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Label1: TUniLabel;
    lblPath: TUniLabel;
    Label3: TUniLabel;
    Label2: TUniLabel;
    StringGrid1: TUniStringGrid;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetNewFolderName( APath: string; var ANewFolderName: string; AOldFoldersList: TStringList ): Boolean;


implementation

{$R *.DFM}

function GetNewFolderName( APath: string; var ANewFolderName: string; AOldFoldersList: TStringList ): Boolean;
var
  I: Integer;
  FrmNewRelease : TFrmNewRelease;
begin
  FrmNewRelease := TFrmNewRelease.Create(uniGUIApplication.UniApplication);
  with FrmNewRelease do
  begin
    lblPath.Caption:= APath;
    Result:= (ShowModal = mrOK);
    if Result then
    begin
      ANewFolderName:= Trim(edName.Text);
      with StringGrid1 do
        for I:= 0 to RowCount - 1 do
          if Trim( Cells[ 0, I ]) <> '' then
             AOldFoldersList.Add( Cells[ 0, I ]);
    end;
  end;
end;


procedure TFrmNewRelease.btnOKClick(Sender: TObject);
begin
  if Trim(edName.Text) = '' then
     ModalResult:= mrCancel
  else   
     ModalResult:= mrOK;
end;  


end.
