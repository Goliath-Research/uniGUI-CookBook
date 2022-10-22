unit IQMS.Common.QC_PkLib;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.QC_PkBase,
  Data.DB,
  uniGUIApplication,
//  Vcl.Wwdatsrc,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniButton, uniGUIBaseClasses, uniGUIClasses, uniPanel, IQUniGrid, uniGUIFrame;

type
  TFrmQC_PkLib = class(TFrmQC_PkBase)
    wwQuery1ID: TBCDField;
    wwQuery1DESCRIP: TStringField;
    wwQuery1PATH: TStringField;
    wwQuery1TYPE: TStringField;
    wwQuery1EPLANT_ID: TBCDField;
    wwQuery1DESCRIP2: TStringField;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoPkList_Doc_Library( var ADoc_Library_ID: Real ): Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.ResStrings;

function DoPkList_Doc_Library( var ADoc_Library_ID: Real ): Boolean;
begin
  with TFrmQC_PkLib.Create( uniGUIApplication.UniApplication ) do
  begin
    wwQuery1PATH.Visible:= SelectValueAsString('select doc_hide_unc_path from params') <> 'Y';

    Result:= ShowModal = mrOK;

    if Result then
       ADoc_Library_ID:= wwQuery1.FieldByName('id').asFloat;
  end;
end;

procedure TFrmQC_PkLib.btnOKClick(Sender: TObject);
begin
  inherited;
  if SelectValueFmtAsString
    ('select nvl(is_confidential, ''N'') from doc_library where id =%f ',
    [wwQuery1ID.asFloat]) = 'Y' then
  begin
    // This is a Confidential library.  Assigning document from a confidential library will make it '+
    // viewable for non Library Team members.'+#13#13+'Continue?';
    if not IQMS.Common.Dialogs.IQConfirmYNWithSecurity(IQMS.Common.ResStrings.cTXT0000450,
      'AddConfLibDoc', True) then
      ModalResult := mrCancel;
  end;
end;

end.
