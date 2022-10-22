unit ClassDiv;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  InvtClas,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIApplication,
  uniGUIClasses,
  uniLabel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniButton,
  uniComboBox,
  uniDBComboBox,
  uniPanel;

type
  TFrmInvClassDivisionFilter = class(TFrmInvClass)
    wwLookupDivision: TUniDBLookupComboBox;
    wwQryDivision: TFDQuery;
    wwQryDivisionID: TBCDField;
    wwQryDivisionNAME: TStringField;
    wwQryDivisionEPLANT_NAME: TStringField;
    Label4: TUniLabel;
  private
    procedure SetDivision_ID(ADivision_ID: Real);
    { Private declarations }
  public
    { Public declarations }
    property Division_ID: Real write SetDivision_ID;
  end;

function DoInvClassDivisionFilter( var AClass:string; var ADivision_ID: Real ):Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Data.Lib,
  IQMS.Common.Numbers,
  IQMS.Common.SysShare;

function DoInvClassDivisionFilter( var AClass:string; var ADivision_ID: Real ):Boolean;
var
  FrmInvClassDivisionFilter: TFrmInvClassDivisionFilter;
begin
  FrmInvClassDivisionFilter:=TFrmInvClassDivisionFilter.Create(uniGUIApplication.UniApplication);
  with FrmInvClassDivisionFilter do
  begin
    Division_ID:=ADivision_ID;
    Result:= ShowModal = mrOK;
    if Result then
    begin
       AClass      := wwLookupClass.Text;
       ADivision_ID:= fIIf( wwLookupDivision.Text = '', 0, wwQryDivisionID.asFloat );
    end;
  end;
end;
procedure TFrmInvClassDivisionFilter.SetDivision_ID(ADivision_ID: Real);
begin
  with Label4 do Caption:= CheckReplaceDivisionCaption( Caption );      {Sys_Share}
//  with wwLookupDivision do Sys_Share.CheckReplaceDivisionOfWWSelected( Selected );

//  wwLookupDivision.DataSource.DataSet.FieldByName(wwLookupDivision.DataField).AsString:= SelectValueFmtAsString('select name from division where id = %f', [ ADivision_ID ]);
//  wwLookupDivision.PerformSearch;
end;

end.
