unit RecRel;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  System.Variants,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmPoReleases = class(TUniForm)
    Panel1: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    Exit1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    pnlBottomButtons: TUniPanel;
    SrcRel: TDataSource;
    QryRel: TFDQuery;
    QryRelPO_DETAIL_ID: TBCDField;
    QryRelREQUEST_DATE: TDateTimeField;
    QryRelPROMISE_DATE: TDateTimeField;
    QryRelQUAN: TBCDField;
    IQAbout1: TIQWebAbout;
    Shape1: TUniPanel;
    Shape2: TUniPanel;
    Shape3: TUniPanel;
    QryRelPO_RELEASES_ID: TBCDField;
    QryRelQTY_LEFT_ONORDER: TFMTBCDField;
    Contents1: TUniMenuItem;
    QryRelCUSER1: TStringField;
    Panel3: TUniPanel;
    btnAssignQty: TUniButton;
    btnAssignRelease: TUniButton;
    btnCancel: TUniButton;
    SR: TIQWebSecurityRegister;
    procedure btnAssignQtyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbRecalcClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    { TODO : TGridDrawState not yet converted }
    {procedure IQSearch1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);  }
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAssignReleaseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FId: Real;
    { Private declarations }
    procedure AssignSelectedQty;
    procedure CheckSelectOnlyRecord;
    procedure SetId(const Value: Real);
  public
    { Public declarations }
    FQty:Real;
    FSelected_PO_Releases_ID: Real;
    FPO_Detail_ID:Real;
    class function DoShowModal(APO_Detail_ID: Real; var AQty, ASelected_PO_Releases_ID: Real; AReadOnly: Boolean = FALSE ):Boolean;
    property Id : Real write SetId;
  end;

// function GetPoReleasesQty(AOwner:TComponent; AId:Real; AReadOnly: Boolean = FALSE ):Real;


implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.HelpHook,
  IQMS.Common.Miscellaneous;
  { TODO : IQSecIns not yet converted }
  //IQSecIns;

{function GetPoReleasesQty(AOwner:TComponent; AId:Real; AReadOnly: Boolean = FALSE ):Real;
begin
  with TFrmPoReleases.Create(AOwner, AId) do
  try
    if AReadOnly then
       pnlBottomButtons.Visible:= FALSE;

    ShowModal;
    if ModalResult = mrOk then
      Result := FQty
    else
      Result := 0;
  finally
    Free;
  end;
end;                 }


class function TFrmPoReleases.DoShowModal(APO_Detail_ID: Real; var AQty, ASelected_PO_Releases_ID: Real; AReadOnly: Boolean = FALSE ):Boolean;
var
  LFrmPoReleases : TFrmPoReleases;
begin
  AQty:= 0;
  ASelected_PO_Releases_ID:= 0;

  LFrmPoReleases := TFrmPoReleases.Create(UniGUIApplication.UniApplication);
  with LFrmPoReleases do
  begin
    Id := APO_Detail_ID;
    if AReadOnly then
       pnlBottomButtons.Visible:= FALSE;

    Result:= ShowModal = mrOK;

    if Result then
    begin
       AQty:= FQty;
       ASelected_PO_Releases_ID:= FSelected_PO_Releases_ID;
    end;
  end;
end;

procedure TFrmPoReleases.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmPoReleases.btnAssignQtyClick(Sender: TObject);
begin
  CheckSelectOnlyRecord;
  { TODO : TIQUniGridControl does not have the property 'SelectedList' }
  //IQAssert( IQSearch1.wwDBGrid.SelectedList.Count > 0, 'No Records Selected - operation aborted.' );
  AssignSelectedQty;
  ModalResult := mrOk;
end;

procedure TFrmPoReleases.AssignSelectedQty;
var
  I:integer;
begin
  FQty := 0;
  { TODO : TIQUniGridControl does not have the properties }
  {with IQSearch1.wwdbgrid, IQSearch1.wwdbgrid.datasource.dataset do
  for i:= 0 to SelectedList.Count-1 do begin
    GotoBookmark(SelectedList.items[i]);
    FQty := FQty + FieldByName('QTY_LEFT_ONORDER').asFloat;
  end;        }
end;

procedure TFrmPoReleases.sbRecalcClick(Sender: TObject);
var
  ATotalReceived:Real;
begin
  //ATotalReceived := SelectValueFmtAsFloat('select NVL(qty_received, 0) - NVL(qty_rejected, 0) from C_PO_RECEIPTS_TOTAL where po_detail_id = %f', [FPO_Detail_ID]);
  //RunSqlFmt('begin crw_before_exec.update_po_detail_releases(%f, %f); end;', [FPO_Detail_ID, ATotalReceived]);
  //with QryRel do
  //begin
  //  Close;
  //  Open;
  //end;
  //IqSearch1.AssignSearchField( QryRelPROMISE_DATE );
end;

procedure TFrmPoReleases.SetId(const Value: Real);
begin
  FId := Value;
end;

procedure TFrmPoReleases.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPoReleases.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

{ TODO : TGridDrawState not yet converted }
{procedure TFrmPoReleases.IQSearch1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not Highlight then
     with QryRel do
     begin
       if FieldByName('po_releases_id').AsFloat = 0 then
          begin
            ABrush.Color:= clPurple;
            AFont.Color := clWhite;
          end
       else if (FieldByName('Quan').AsFloat > 0) and (FieldByName('Qty_Left_Onorder').AsFloat = 0) then
          begin
             ABrush.Color := clLime;
             AFont.Color := clBlack;
          end
       else if (FieldByName('Qty_Left_Onorder').AsFloat < FieldByName('Quan').AsFloat) and (FieldByName('Qty_Left_Onorder').AsFloat > 0) then
          begin
            ABrush.Color:= clYellow;
            AFont.Color := clBlack;
          end
       else
          begin
            ABrush.Color:= clPurple;
            AFont.Color := clWhite;
          end;
     end;
end;                 }

procedure TFrmPoReleases.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmPO{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPoReleases.CheckSelectOnlyRecord;
begin
  // If there is only one record in the dataset, select the first and
  // only record.
  { TODO : TIQUniGridControl does not have the properties SelectedList and SelectRecord }
  {if (IQSearch1.wwDBGrid.SelectedList.Count = 0) and
    (QryRel.RecordCount = 1) then
    begin
      IQSearch1.wwDBGrid.SelectRecord;
    end;  }
end;

procedure TFrmPoReleases.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 997582 );
end;

procedure TFrmPoReleases.FormCreate(Sender: TObject);
begin
  CheckVistaMove( [Shape1, Shape2, Shape3] );
end;

procedure TFrmPoReleases.FormShow(Sender: TObject);
var
  A: Variant;
begin
  IQRegFormRead( self, [self]);
  FPO_Detail_ID:= FId;

  A:= SelectValueArrayFmt( 'select p.pono,                                                       '+
                      '       d.seq,                                                        '+
                      '       decode( d.arinvt_id, NULL, d.misc_item, a.itemno ) as itemno, '+
                      '       decode( d.arinvt_id, NULL, '' '', a.rev ) as rev              '+
                      '  from po p,                                                         '+
                      '       po_detail d,                                                  '+
                      '       arinvt a                                                      '+
                      ' where d.id = %f                                                     '+
                      '   and d.po_id = p.id                                                '+
                      '   and d.arinvt_id = a.id(+)                                         ', [ FPO_Detail_ID ]);
  if VarArrayDimCount( A ) > 0 then
     //Caption := Format('PO Releases %s, Line # %.0f, Item # %s %s', [ A[ 0 ], DtoF(A[ 1 ]), A[ 2 ], A[ 3 ] ]);
     Caption := Format('PO # %s Releases: Line # %.0f, Item # %s %s', [ Trim(A[ 0 ]), DtoF(A[ 1 ]), Trim(A[ 2 ]), Trim(A[ 3 ]) ]);

  with QryRel do
  begin
    Close;
    ParamByName('AId').Value := FId;
    Open;
  end;
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmPoReleases.btnAssignReleaseClick(Sender: TObject);
var
  I:integer;
begin
  CheckSelectOnlyRecord;
  { TODO : TIQUniGridControl does not have the property 'SelectedList' }
  //IQAssert( IQSearch1.wwDBGrid.SelectedList.Count > 0, 'No Records Selected - operation aborted.' );
  //IQAssert( IQSearch1.wwDBGrid.SelectedList.Count = 1, 'Only one PO release can be assigned to a receipt - operation aborted.');
  IQAssert( QryRelQTY_LEFT_ONORDER.asFloat > 0,        '''Left To Recv'' must be greater than zero - operation aborted.');

  AssignSelectedQty;
  FSelected_PO_Releases_ID:= QryRelPO_RELEASES_ID.asFloat;

  ModalResult := mrOk;
end;

end.
