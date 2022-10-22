unit Qk_InvAl;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Qk_Inv,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Phys,
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
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet, uniDBLookupComboBox, uniEdit, IQUniGrid, Vcl.Forms,
  uniGUIFrame, uniCheckBox, uniDBEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  UniGuiApplication,
  uniLabel, uniSplitter, uniGUIClasses, uniDBCheckBox, uniPageControl,
  uniButton, uniGUIBaseClasses, uniPanel, uniImageList, uniDBNavigator,
  uniToolBar, uniBasicGrid, uniDBGrid;

type
  TQuickAddAllArinvt = class(TQuickAddRawArinvt)
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvt_Group_ID: Real;
    procedure SetArinvt_Group_ID(value: Real);
  public
    { Public declarations }
    //constructor Create(AOwner: TComponent); override;
    //constructor CreateEx(AOwner: TComponent; AArinvt_Group_ID: Real);
    class function DoShowModal(var AArinvt_ID: Real;
      AArinvt_Group_ID: Real): Boolean;
    Property Arinvt_Group_ID: Real write SetArinvt_Group_ID;

  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib;

class function TQuickAddAllArinvt.DoShowModal(var AArinvt_ID: Real;
  AArinvt_Group_ID: Real): Boolean;
var
  AClass: string;
  LQuickAddAllArinvt: TQuickAddAllArinvt;
begin
  LQuickAddAllArinvt := TQuickAddAllArinvt.Create(UniGuiApplication.UniApplication);
  LQuickAddAllArinvt.Arinvt_Group_ID := AArinvt_Group_ID;

  AClass := SelectValueByID('class', 'arinvt_group', AArinvt_Group_ID);
  if AClass > '' then
  begin
    LQuickAddAllArinvt.dbcCLASS.ItemIndex := LQuickAddAllArinvt.dbcCLASS.Items.IndexOf(AClass);
    LQuickAddAllArinvt.dbcCLASS.Enabled := LQuickAddAllArinvt.dbcCLASS.ItemIndex = -1;
    if LQuickAddAllArinvt.dbcCLASS.ItemIndex > -1 then
      LQuickAddAllArinvt.Table1.FieldByName('class').asString := AClass;
  end;
  Result := LQuickAddAllArinvt.ShowModal = mrOK;
  if Result then
    AArinvt_ID := LQuickAddAllArinvt.ResultValue; // ResultAsFloat;

end;

procedure TQuickAddAllArinvt.FormCreate(Sender: TObject);
begin
  inherited;
  dbcCLASS.Items.Clear;
  with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add('select * from arinvt_class');
      Open;
      while not eof do
      begin
        dbcCLASS.Items.Add(FieldByName('CLASS').asString);
        next;
      end;
    finally
      Free;
    end;

end;

procedure TQuickAddAllArinvt.SetArinvt_Group_ID(value: Real);
begin
  FArinvt_Group_ID := value;
end;


procedure TQuickAddAllArinvt.btnOKClick(Sender: TObject);
begin
  inherited;

  if (ModalResult = mrOK) and (FArinvt_Group_ID > 0) then
    ExecuteCommandFmt
      ('begin arinvt_group_misc.assign_from_group( %d, %d ); end;',
      [ResultValue, Trunc(FArinvt_Group_ID)]);
end;

end.
