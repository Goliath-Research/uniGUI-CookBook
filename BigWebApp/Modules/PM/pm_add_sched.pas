unit pm_add_sched;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniDateTimePicker, uniDBDateTimePicker, IQUniGrid, uniGUIFrame;

type
  { TFrmPMAddSched }
  TFrmPMAddSched = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    SrcWO: TDataSource;
    QryWO: TFDQuery;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    IQSearchWO: TIQUniGridControl;
    Panel6: TUniPanel;
    Bevel1: TUniPanel;
    Panel7: TUniPanel;
    Bevel2: TUniPanel;
    wwDBDateTimePickerStartDate: TUniDBDateTimePicker;
    Bevel3: TUniPanel;
    QryWOWO_DATE: TDateTimeField;
    QryWOWO_CLASS: TStringField;
    QryWOREQUESTED_BY: TStringField;
    QryWODEPARTMENT: TStringField;
    QryWOSTATUS: TStringField;
    QryWOPRIORITY: TStringField;
    QryWOWO_TYPE: TStringField;
    QryWOEQNO: TStringField;
    QryWOEQUIP_DESCRIP: TStringField;
    QryWOEQUIP_CLASS: TStringField;
    QryWOEPLANT_ID: TBCDField;
    QryWOID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal(var AList: TStringList; var AStartDate: TDateTime): Boolean;
    procedure AssignSelectedTo(AList: TStringList);

  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  pm_rscstr;

{ TFrmPMAddSched }

class function TFrmPMAddSched.DoShowModal(var AList: TStringList; var AStartDate: TDateTime): Boolean;
var
  LFrmPMAddSched : TFrmPMAddSched;
begin
  LFrmPMAddSched := TFrmPMAddSched.Create(UniGUIApplication.UniApplication);
  Result := LFrmPMAddSched.ShowModal = mrOK;
  if Result then
    begin
      LFrmPMAddSched.AssignSelectedTo(AList);
      AStartDate := LFrmPMAddSched.wwDBDateTimePickerStartDate.DateTime;
    end;
end;

procedure TFrmPMAddSched.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmPMAddSched.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
  IQSetTablesActive(TRUE, self);

  wwDBDateTimePickerStartDate.Datetime := Date;
end;

procedure TFrmPMAddSched.btnOKClick(Sender: TObject);
begin
  // pm_rscstr.cTXT0000367 = 'Please select a Work Order.';
  IQAssert(not (QryWO.Eof and QryWO.Bof), pm_rscstr.cTXT0000367);
  // pm_rscstr.cTXT0000368 = 'Please select a Start Date.';
  IQAssert(wwDBDateTimePickerStartDate.DateTime > 0, pm_rscstr.cTXT0000368);

  ModalResult := mrOK;
end;

procedure TFrmPMAddSched.AssignSelectedTo(AList: TStringList);
var
  I: Integer;
begin
  AList.Clear;
  // with IQSearchWO do
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named SelectedList and Dataset
  begin

    if IQSearchWO.DBGrid.SelectedList.Count > 0 then
      for I := 0 to IQSearchWO.DBGrid.SelectedList.Count - 1 do
        begin
          IQSearchWO.DataSet.GotoBookmark
            (IQSearchWO.wwDBGrid.SelectedList.Items[I]);
          AList.Add(IQSearchWO.DataSet.FieldByName('id').asString);
        end
    else
      AList.Add(IQSearchWO.DataSet.FieldByName('id').asString);
  end;  }
end;

end.
