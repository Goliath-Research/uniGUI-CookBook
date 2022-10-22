unit shipman_ups_version;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, FireDAC.Comp.DataSet,
  Vcl.ComCtrls, uniBasicGrid, uniListView;


type
  TListCargo = class
   Code,
   DisplayName,
   Value: String;
   SendUpdate,
   Modified: Boolean;
   constructor Create(ACode, ADisplayName, AValue: String; ASendUpdate: Boolean);
end;

type
  TFrmShipMainUPSVersion = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlPrompt: TUniPanel;
    Label1: TUniLabel;
    PnlList: TUniPanel;
    lvList: TUniListView;
    QryList: TFDQuery;
    QryListID: TBCDField;
    QryListDISPLAYNAME: TStringField;
    QryListCODE: TStringField;
    QryListVALUE: TStringField;
    QryListSEND_UPDATE: TStringField;
    QryListRECEIVE_UPDATE: TStringField;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnModify: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    lblValue: TUniLabel;
    PnlClient02: TUniPanel;
    edtValue: TUniEdit;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    UpdateLocalComputerFields1: TUniMenuItem;
    N1: TUniMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure lvListChange(Sender: TObject; Item: TListItem);
    procedure btnModifyClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure UpdateLocalComputerFields1Click(Sender: TObject);
    procedure lvListDrawCell(Sender: TObject; ACol, ARow: Integer;
      var Value: string; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    procedure LoadList;
    procedure SaveModifiedItems;
    function IndexOfCode(const ACode: String): Integer;
    procedure UpdateItemByCode(const ACode, AValue: String);
    procedure UpdateItemByIndex(const AIndex: Integer; const AValue: String);

  public
    { Public declarations }
  end;

  // If True, then values have been modified
  function DoUPSVersionList: Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.Boolean,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  IQMS.Common.SysInfo,
  shipman_rscstr;
{ TODO -oGPatil -cWebConvsert : Dependency on File
  ups_httplink_dblib; }

const
  C_DISPLAYNAME_INDEX = 0;
  C_VALUE_INDEX = 1;
  C_SENDUPDATE_INDEX = 2;


function DoUPSVersionList: Boolean;
var
  LFrmShipMainUPSVersion : TFrmShipMainUPSVersion;
begin
  LFrmShipMainUPSVersion := TFrmShipMainUPSVersion.Create(UniGUIApplication.UniApplication);
  Result := LFrmShipMainUPSVersion.ShowModal = mrOk;
end;

{ TListCargo }

constructor TListCargo.Create(ACode, ADisplayName, AValue: String; ASendUpdate: Boolean);
begin
  Code := ACode;
  DisplayName:= ADisplayName;
  Value := AValue;
  SendUpdate := ASendUpdate;
  Modified := False;
end;

{ TFrmShipMainUPSVersion }

procedure TFrmShipMainUPSVersion.FormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustControlWidthToParentB(PnlClient02, [edtValue]);
  LoadList;
end;

procedure TFrmShipMainUPSVersion.LoadList;
var
   ev: TLVChangeEvent;
begin
{ TODO -oGPatil -cWebConvert : Undeclared Identifier
  UPSVersionControlCreated;  }

  try
     lvList.Items.BeginUpdate;
//     ev := lvList.OnChange;
//     lvList.OnChange := NIL;

     ReOpen(QryList);
     while not QryList.EOF do
      begin
        with lvList.Items.Add do
         begin
           Caption := QryListCode.AsString;
           SubItems.Add(QryListDISPLAYNAME.AsString);
           SubItems.Add(QryListVALUE.AsString);
           if QryListSEND_UPDATE.AsString='Y' then
              SubItems.Add(IQMS.Common.Boolean.BoolToYesNo(True))
           else
              SubItems.Add('');

           Data := TListCargo.Create( QryListCODE.AsString,
                                      QryListDISPLAYNAME.AsString,
                                      QryListVALUE.AsString,
                                      QryListSEND_UPDATE.AsString='Y');
         end;

        QryList.Next;
      end;

  finally
     lvList.Items.EndUpdate;
//     lvList.OnChange := ev;
  end;

end;

procedure TFrmShipMainUPSVersion.lvListChange(Sender: TObject;
  Item: TListItem);
begin
  if Item <> NIL then
     edtValue.Text := Item.SubItems.Strings[C_VALUE_INDEX];
end;

procedure TFrmShipMainUPSVersion.btnModifyClick(Sender: TObject);
var
   AItem: TListItem;
begin
  AItem := lvList.Selected;

  if (AItem = NIL) or not Assigned(AItem.Data) then Exit;

  if (edtValue.Text = '') and
     not IQConfirmYN(shipman_rscstr.cTXT000078 {'Clear value?'}) then
     Exit;

  with AItem do
  begin
    // update visual text
    SubItems.Strings[C_VALUE_INDEX]     := edtValue.Text;
    SubItems.Strings[C_SENDUPDATE_INDEX]:= IQMS.Common.Boolean.BoolToYesNo(True);
    // update pointer
    TListCargo(Data).Value     := edtValue.Text;
    TListCargo(Data).SendUpdate:= True;
    TListCargo(Data).Modified  := True;
    // repaint the list
    lvList.RefreshRow(lvList.Selected.Index);
  end;
end;

procedure TFrmShipMainUPSVersion.btnOkClick(Sender: TObject);
begin
  SaveModifiedItems;
end;

procedure TFrmShipMainUPSVersion.SaveModifiedItems;
var
   i: Integer;
   ACode, AValue: String;
begin
  // updates the database
  for i := 0 to lvList.Items.Count -1 do
   if TListCargo(lvList.Items[i].Data).Modified then
      begin
        ACode  := TListCargo(lvList.Items[i].Data).Code;
        AValue := TListCargo(lvList.Items[i].Data).Value;
{ TODO -oGPatil -cWebConvert : Undeclared Identifier
        UPSVersionControlUpdate(ACode,AValue, True); }
      end;
end;

procedure TFrmShipMainUPSVersion.lvListDrawCell(Sender: TObject; ACol,
  ARow: Integer; var Value: string; Attribs: TUniCellAttribs);
begin
  if (TListCargo(lvList.Items[ARow].Data).Modified) or
     (TListCargo(lvList.Items[ARow].Data).SendUpdate) then
     begin
       Attribs.Font.Color := clNavy;
       Attribs.Font.Style := [fsBold];
     end
  else
     begin
       Attribs.Font.Color := clBlack;
       Attribs.Font.Style := [];
     end;

end;

procedure TFrmShipMainUPSVersion.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmShipMainUPSVersion.UpdateLocalComputerFields1Click(
  Sender: TObject);
var
   i: Integer;
begin
  // 'Update computer information fields?'
  if not IQMS.Common.Dialogs.IQConfirmYN(shipman_rscstr.cTXT000006) then
     Exit;

  UpdateItemByCode('CPUMakeAndModel',IQMS.Common.SysInfo.GetCPUName);

  i := Trunc(IQMS.Common.SysInfo.TotalDiskKBSizeOf('C'));
  UpdateItemByCode('HardDriveSize',IntToStr(IQMS.Common.Numbers.iIIf(i=0, 999, i)));

  //i := Trunc(IQMS.Common.SysInfo.TotalDiskKBSizeOf('A'));
  //UpdateItemByCode('FloppyDriveSize',IntToStr(IQMS.Common.Numbers.iIIf(i=0, 1474, i)));

  i := IQMS.Common.SysInfo.GetMachineRAMKb;
  UpdateItemByCode('RAMSize',IntToStr(IQMS.Common.Numbers.iIIf(i=0, 1048576 {1 GB}, i)));

  UpdateItemByCode('OperatingSystem',IQMS.Common.SysInfo.GetWindowsVersion);

  UpdateItemByCode('HasCDROM',IQMS.Common.Boolean.BoolToYN(IQMS.Common.SysInfo.HasCDROMDrive));

end;

function TFrmShipMainUPSVersion.IndexOfCode(const ACode: String): Integer;
var
   i: Integer;
begin
  Result := -1;
  for i := 0 to lvList.Items.Count - 1 do
   if TListCargo(lvList.Items[i].Data).Code = ACode then
      begin
        Result := i;
        Break;
      end;
end;

procedure TFrmShipMainUPSVersion.UpdateItemByCode(const ACode, AValue: String);
var
   i: Integer;
begin
  i := IndexOfCode(ACode);
  UpdateItemByIndex(i, AValue);
end;

procedure TFrmShipMainUPSVersion.UpdateItemByIndex(const AIndex: Integer;
  const AValue: String);
var
   AItem: TListItem;
begin
  if (AIndex < 0) or (AIndex > lvList.Items.Count - 1) then Exit;

  AItem := lvList.Items[AIndex];

  if (AItem = NIL) or not Assigned(AItem.Data) then Exit;

  with AItem do
  begin
    // update visual text
    SubItems.Strings[C_VALUE_INDEX] := AValue;
    SubItems.Strings[C_SENDUPDATE_INDEX] := IQMS.Common.Boolean.BoolToYesNo(True);
    // update pointer
    TListCargo(Data).Value := AValue;
    TListCargo(Data).SendUpdate := True;
    TListCargo(Data).Modified := True;
    // repaint the list
    lvList.Invalidate;
  end;

end;

end.
