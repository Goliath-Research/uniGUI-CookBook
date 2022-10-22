unit crm_distlist;

{ NOTE:  Since we hook in mailto_pick, this form cannot be called in EIQ! }

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  uniGUIAbstractClasses,
  uniGUITypes,
  uniDBGrid,
  vcl.dbctrls,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.CaptionPanel,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  IQMS.Common.DataConst,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmCRMDistList = class(TUniForm)
    SrcDistList: TDataSource;
    Panel5: TUniPanel;
    SrcMaster: TDataSource;
    QryMaster: TFDQuery;
    Bevel2: TUniPanel;
    QryDistList: TFDQuery;
    NavMain: TUniDBNavigator;
    chkDistList: TUniCheckBox;
    PGrid: TUniPopupMenu;
    ClearAllRecipients1: TUniMenuItem;
    PnlGrid: TUniPanel;
    Grid: TIQUniGridControl;
    cmbGridEMail: TUniEdit;
    SR: TIQWebSecurityRegister;
    SendEMailtoSelected1: TUniMenuItem;
    CaptionPanel1: TIQWebCaptionPanel;
    Bevel1: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PnlGridDisplay: TUniPanel;
    procedure chkDistListClick(Sender: TObject);
    procedure QryMasterBeforeOpen(DataSet: TDataSet);
    procedure SrcMasterDataChange(Sender: TObject; Field: TField);
    procedure QryDistListBeforeDelete(DataSet: TDataSet);
    procedure QryDistListBeforePost(DataSet: TDataSet);
    procedure QryDistListNewRecord(DataSet: TDataSet);
    procedure QryDistListUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure cmbGridEMailCustomDlg(Sender: TObject);
    procedure ClearAllRecipients1Click(Sender: TObject);
    procedure cmbGridEMailMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SendEMailtoSelected1Click(Sender: TObject);
    procedure DoGridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure DoDataAfterOpen(DataSet: TDataSet);
    procedure QryDistListBeforeOpen(DataSet: TDataSet);
    procedure DoApplyUpdates(DataSet: TDataSet);
    procedure GridDBGridDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure GridDBGridCellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
    FRecordID_Before_Delete: Real;
    procedure IQAfterShowMessage(var Msg: TMessage); message iq_AfterShowMessage;
    procedure EnableListControls(AEnabled: Boolean);
  protected
    { Protected declarations }
    MasterSource: String;
    MasterID: Int64;
    TableName,
    ParentFieldName,
    SourceDisplay: String;
    procedure InitValues; virtual; abstract;
    procedure ValidateValues;
    procedure SetControls;
  public
    { Public declarations }
    constructor Create( ASourceID: Real);
  end;

  procedure DistributionList_Arcusto(AOwner: TComponent; AArcustoID: Real);
  procedure DistributionList_Vendor(AOwner: TComponent; AVendorID: Real);
  procedure DistributionList_Partner(AOwner: TComponent; APartnerID: Real);
  procedure DistributionList_Employee(AOwner: TComponent; APrEmpID: Real);

  function CanSendDistributionList(ASource: String; ASourceID: Real): Boolean;
  function DistributionListCount(ASource: String; ASourceID: Real): Integer;
  procedure DistributionListRecipients(ASource: String; ASourceID: Real; var AList: TStringList);

implementation

{$R *.DFM}

uses
  crm_distlist_customer,
  crm_distlist_employee,
  crm_distlist_partner,
  crm_distlist_vendor,
//  mailto_pick,
  IQMS.Common.EmailUtils,
  IQMS.Common.Boolean,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  IQMS.Common.StringUtils;

procedure DistributionList_Arcusto(AOwner: TComponent; AArcustoID: Real);
begin
  TFrmCRMDistListCustomer.Create( AArcustoID).Show;
end;

procedure DistributionList_Vendor(AOwner: TComponent; AVendorID: Real);
begin
  TFrmCRMDistListVendor.Create( AVendorID).Show;
end;

procedure DistributionList_Partner(AOwner: TComponent; APartnerID: Real);
begin
  TFrmCRMDistListPartner.Create( APartnerID).Show;
end;

procedure DistributionList_Employee(AOwner: TComponent; APrEmpID: Real);
begin
  TFrmCRMDistListEmployee.Create( APrEmpID).Show;
end;

function CanSendDistributionList(ASource: String; ASourceID: Real): Boolean;
begin
  Result := False;

  Result := SelectValueFmtAsString('select NVL(distlist, ''N'') as v_val from %s where id = %.0f',
              [ASource, ASourceID]) = 'Y';

end;

function DistributionListCount(ASource: String; ASourceID: Real): Integer;
var
   ATableName,
   AFieldName: String;
begin
  Result := 0;
  case IQMS.Common.StringUtils.CaseOfStr(ASource, ['ARCUSTO','VENDOR','PARTNER','PR_EMP']) of
   0: begin
       ATableName := 'arcusto_dist';
       AFieldName := 'arcusto_id';
      end;
   1: begin
        ATableName := 'vendor_dist';
        AFieldName := 'vendor_id';
      end;
   2: begin
        ATableName := 'partner_dist';
        AFieldName := 'partner_id';
      end;
   3: begin
        ATableName := 'pr_emp_dist';
        AFieldName := 'pr_emp_id';
      end;
  else Exit;
  end;

  Result := Trunc(SelectValueFmtAsFloat( 'select count(*) as v_val from %s where %s = %.0f',
        [ATableName, AFieldName, ASourceID]));
end;

procedure DistributionListRecipients(ASource: String; ASourceID: Real;
 var AList: TStringList);
var
   ASQL: String;
begin

  if (AList = NIL) or not Assigned(AList) then Exit;

  case IQMS.Common.StringUtils.CaseOfStr(ASource, ['ARCUSTO','VENDOR','PARTNER','PR_EMP']) of
   0: ASQL := Format( 'select * from arcusto_dist where arcusto_id = %.0f order by id',
                  [ASourceID]);
   1: ASQL := Format( 'select * from vendor_dist where vendor_id = %.0f order by id',
                  [ASourceID]);
   2: ASQL := Format( 'select * from partner_dist where partner_id = %.0f order by id',
                  [ASourceID]);
   3: ASQL := Format( 'select * from pr_emp_dist where pr_emp_id = %.0f order by id',
                  [ASourceID]);
  else Exit;
  end;

   // Get address list
   with TFDQuery.Create(NIL) do
   try
      AList.Sorted := TRUE;
      AList.Duplicates := dupIgnore;

      Connection := unimainModule.FDConnection1;
      SQL.Add(ASQL);
      Open;

      while not EOF do
       begin
         if ( Trim(FieldByName( 'EMAIL' ).AsString ) > '' ) then
            begin
               // Remmed because when sending SMTP, it fails
               //if ( Trim(FieldByName( 'NAME' ).AsString) > '' ) then
               //   AList.Add( Format( '%s <%s>', [Trim(FieldByName( 'NAME' ).AsString), Trim(FieldByName( 'EMAIL' ).AsString)] ))
               //else
                  AList.Add( Trim(FieldByName( 'EMAIL' ).AsString));
            end;
         Next;
       end;
   finally
      Free; // free TFDQuery
   end;
end;

{ ---------------------------------------------------------------------------- }
{ TFrmCRMDistList }
{ ---------------------------------------------------------------------------- }

constructor TFrmCRMDistList.Create( ASourceID: Real);
begin
  try
     MasterID := Trunc(ASourceID);

     inherited Create(uniGUIApplication.UniApplication);

     IQMS.Common.Screen.ApplySystemFont(Self);

     // Data
     ReOpen(QryMaster);
     ReOpen(QryDistList);
     InitValues;
     ValidateValues;

     // Form adjustment
     cmbGridEMail.Visible := FALSE;
//     Grid.DBGrid.OnMouseMove := DoGridMouseMove;

     SetControls;

  except on E:Exception do
    begin
      IQMS.Common.Dialogs.IQError(E.Message);
      PostMessage( Handle, wm_Command, Close1.Command, 0 );   // Call "Exit"
    end;
  end;
end;

procedure TFrmCRMDistList.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, Grid.DBGrid]);
  EnableListControls(chkDistList.Checked);
//  ResizeNavBar(NavMain);
//  PostMessage(Handle, iq_AfterShowMessage, 0, 0);  // Call after show events
end;

procedure TFrmCRMDistList.IQAfterShowMessage(var Msg: TMessage);
begin
  Grid.DBGrid.ReadOnly := SR.Enabled['Grid'] = FALSE;
//  Grid.DBGrid.Options := [dgEnterToTab,dgAllowDelete,dgAllowInsert];
  if SR.Enabled['Grid'] = FALSE then
    Grid.DBGrid.Options := [dgTitles, dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
//  Grid.DBGrid.Ctl3D := FALSE;
  Grid.Enabled := TRUE; // override security and enable it
  Grid.DBGrid.Enabled := TRUE; // override security and enable it
  if SR.Enabled['Grid'] = FALSE then
     Grid.DBGrid.Color := clBtnFace;
  Self.BringToFront;
end;

procedure TFrmCRMDistList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (QryMaster.State in [dsEdit]) then QryMaster.Post;
  IQRegFormWrite(Self, [Self, Grid.DBGrid]);
  Action := caFree;
end;

procedure TFrmCRMDistList.ValidateValues;
begin
  if MasterSource = '' then
     raise Exception.Create('Application Error:  Master source table name not provided.');
  if MasterID = 0 then
     raise Exception.Create('Application Error:  Master source ID not provided.');
  if (TableName = '') then
     raise Exception.Create('Application Error:  Distribution List table name not provided.');
  if not TableExists(TableName) then
     raise Exception.Create('The Distribution List table does not exist.');
  if (ParentFieldName = '') then
     raise Exception.Create('Application Error:  Distribution List parent field name not provided.');
end;

procedure TFrmCRMDistList.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCRMDistList.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmCRMDistList.chkDistListClick(Sender: TObject);
begin
  Application.ProcessMessages;
  ExecuteCommandFmt('update %s set distlist = ''%s'' where id = %d',
    [MasterSource, BoolToYN(chkDistList.Checked), MasterID]);
  ReOpen(QryMaster); // iqlib
  EnableListControls(chkDistList.Checked);
  SetControls;
end;

procedure TFrmCRMDistList.EnableListControls(AEnabled: Boolean);
begin
  IQEnableControl(Grid.DBGrid, AEnabled and SR.Enabled['Grid']);
  IQEnableControl(NavMain, AEnabled and SR.Enabled['NavMain']);

  if not AEnabled then
     Grid.DBGrid.Options :=
        [dgEditing,dgTitles,dgIndicator,dgColumnResize,
         dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit]
  else
     Grid.DBGrid.Options :=
        [dgEditing,dgTitles,dgIndicator,dgColumnResize,
         dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection,dgConfirmDelete,
         dgCancelOnExit];

end;

procedure TFrmCRMDistList.QryMasterBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', MasterID);
end;

procedure TFrmCRMDistList.SrcMasterDataChange(Sender: TObject;
  Field: TField);
begin
  try
     chkDistList.OnClick := NIL;
     chkDistList.Checked := (QryMaster.FieldByName('DISTLIST').AsString = 'Y');
     if SourceDisplay > '' then
        CaptionPanel1.Caption := SourceDisplay; // virtual function; see descendant class
  finally
     chkDistList.OnClick := chkDistListClick;
  end;

  EnableListControls(chkDistList.Checked);

end;

procedure TFrmCRMDistList.DoDataAfterOpen(DataSet: TDataSet);
begin
  SetControls;
end;

procedure TFrmCRMDistList.DoApplyUpdates(DataSet: TDataSet);
begin
  with DataSet as TFDRDBMSDataSet do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
end;

procedure TFrmCRMDistList.QryDistListBeforeDelete(DataSet: TDataSet);
begin
  FRecordID_Before_Delete := QryDistList.FieldByName('ID').AsFloat;
end;

procedure TFrmCRMDistList.QryDistListBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', MasterID);
end;

procedure TFrmCRMDistList.QryDistListBeforePost(DataSet: TDataSet);
begin
  // Enforce required fields
  if QryDistList.FieldByName('ID').AsLargeInt = 0 then
     QryDistList.FieldByName('ID').AsLargeInt := GetNextID(TableName);
end;

procedure TFrmCRMDistList.QryDistListNewRecord(DataSet: TDataSet);
begin
  // Enforce required fields
  QryDistList.FieldByName('ID').AsLargeInt := GetNextID(TableName);
  QryDistList.FieldByName(ParentFieldName).AsLargeInt := MasterID;
end;

procedure TFrmCRMDistList.QryDistListUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
  // NOTE: We build the SQL using values initialized in InitValues.
  //       Since the distribution list table structure will be the same
  //       regardless of source, we need only modify a few values in the
  //       SQL.

  // Modify
  if ARequest = arUpdate then
     ExecuteCommandParamDataSet(Format('update %s'#13 +
                                     ' set name   = :NAME, '#13 +
                                     '     email  = :EMAIL '#13 +
                                     'where id = :ID',
                                     [TableName]),
                              QryDistList)

  // Insert
  else if ARequest = arInsert then
     ExecuteCommandParamDataSet(Format('insert into %s'#13 +
                                     ' (id, %s, name, email)'#13 +
                                     'values'#13 +
                                     ' (:ID, :%s, :NAME, :EMAIL)',
                                     [TableName, LowerCase(ParentFieldName), UpperCase(ParentFieldName)]),
                              QryDistList)

  // Delete
  else if ARequest = arDelete then
    begin
      // We assign FRecordID_Before_Delete in the BeforeDelete event
      ExecuteCommandFmt('delete from %s where id = %.0f', [TableName, FRecordID_Before_Delete]);
      // Reset
      FRecordID_Before_Delete := 0;
    end;

  // Action
  AAction := eaApplied;
end;

procedure TFrmCRMDistList.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
     begin
       RefreshDataSetByID(QryDistList); // iqlib
       System.SysUtils.Abort;
     end;
end;

procedure TFrmCRMDistList.GridDBGridCellClick(Column: TUniDBGridColumn);
var
AFieldName:string;
begin
  AFieldName := Column.FieldName;
  if (AFieldName = 'EMAIL') and
    (QryDistList.FieldByName('EMAIL').AsString > '') then
    SendEMailtoSelected1Click(NIL);
end;

procedure TFrmCRMDistList.GridDBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin

  if Grid.DBGrid.ReadOnly then
     Attribs.Color := clBtnFace
  else
     begin
        if (QryMaster.FieldByName('DISTLIST').AsString = 'N') then
           begin
              Attribs.Color := clBtnFace;
              Attribs.Font.Color  := clBtnShadow;
           end
        else
           begin
              Attribs.Color := clWhite;
              Attribs.Font.Color  := clBlack;
           end;
     end;


  // Hyperlink Font
  if (UpperCase(Column.Field.FieldName) = 'EMAIL') then
     begin
          Attribs.Font.Style := [fsUnderline];
//          if not Highlight then
//             AFont.Color := clBlue;
     end;
end;

procedure TFrmCRMDistList.cmbGridEMailCustomDlg(Sender: TObject);
var
   ARecip, AName, AAddr, AEMail: String;
   AList: TStringList;
   i: Integer;
begin
 try
   if (QryDistList.State in [dsEdit, dsInsert]) then QryDistList.Post;
   AList := TStringList.Create;

   // Get the current e-mail address, if it exists
   AEMail := ''; // initial
   if (Trim(QryDistList.FieldByName('NAME').AsString) > '') and
      (Trim(QryDistList.FieldByName('EMAIL').AsString) > '') then
      AEMail := Format('%s <%s>',
                   [Trim(QryDistList.FieldByName('NAME').AsString),
                    Trim(QryDistList.FieldByName('EMAIL').AsString)])
   else if (Trim(QryDistList.FieldByName('EMAIL').AsString) > '') then
      AEMail := Trim(QryDistList.FieldByName('EMAIL').AsString);

   AList.Add(AEMail);

//   if not GetMailToList(Self, AList, TRUE) then Exit; // in mailto_pick.pas

   if (AList.Count = 0) then Exit;

   // Set current record to first in list
   if (QryDistList.FieldByName('ID').AsFloat > 0) then
      begin
        QryDistList.Edit; // modify current
        IQMS.Common.EmailUtils.ExtractEMailAddress(AList.Strings[0], AName, AAddr);
        QryDistList.FieldByName('NAME').AsString  := AName;
        QryDistList.FieldByName('EMAIL').AsString := AAddr;
        AList.Delete(0); // remove it
        QryDistList.Post;
      end;

   // Add additional emails
   if (AList.Count > 0) then
      for i := 0 to AList.Count - 1 do
          begin
            QryDistList.Insert;
            IQMS.Common.EmailUtils.ExtractEMailAddress(AList.Strings[i], AName, AAddr);
            QryDistList.FieldByName('NAME').AsString  := AName;
            QryDistList.FieldByName('EMAIL').AsString := AAddr;
            QryDistList.Post;
          end;
 finally
    if Assigned(AList) then FreeAndNil(AList);
 end;
end;

procedure TFrmCRMDistList.ClearAllRecipients1Click(Sender: TObject);
begin
  if IQConfirmYN('Remove all recipients?  This action is irreversible.') then
     try
        QryDistList.DisableControls;
        ExecuteCommandFmt(
          'DELETE FROM %s WHERE %s = %d',
          [TableName, ParentFieldName, MasterID]);
        ReOpen(QryDistList);
     finally
        QryDistList.EnableControls;
     end;
end;

procedure TFrmCRMDistList.cmbGridEMailMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) then
     ExecuteHyperlink('mailto:' + QryDistList.FieldByName('EMAIL').AsString); //
end;

procedure TFrmCRMDistList.SendEMailtoSelected1Click(Sender: TObject);
var
   AEMailAddress: String;
begin
  AEMailAddress := QryDistList.FieldByName('EMAIL').AsString;

  if (AEMailAddress > '') then
     IQMS.Common.EmailUtils.IQSendMailA(AEMailAddress, // Recipient
                            '',            // Subject
                            '',            // BodyText
                            NIL,           // Attachments
                            False);        // SendNow
end;

procedure TFrmCRMDistList.DoGridMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
//var
//  Acoord: TGridCoord;
begin
//  with Grid.DBGrid do
//   begin
//     Acoord := MouseCoord(X, Y);
//     if (Acoord.X > 1) and (Columns[Acoord.X - 1].FieldName = 'EMAIL') then
//        Cursor:= IIf(Trim(DataSource.DataSet.FieldByName(Columns[Acoord.X - 1].FieldName).AsString) > '',
//         crHandPoint, crDefault)
//     else Cursor:= crDefault;
//   end;
end;

procedure TFrmCRMDistList.SetControls;
begin
  if not chkDistList.Checked and (QryDistList.BOF and QryDistList.EOF) then
     Grid.Visible := False
  else
     Grid.Visible := True;
end;

end.
