unit oc_reorder;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  { TODO : IQMS.Common.UserMessages has a problem }
 // IQMS.Common.UserMessages,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Stan.Intf,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, uniGUIFrame, IQUniGrid;

type
  TFrmOutsourceCentralReorder = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    NavMain: TUniDBNavigator;
    sbtnSearch: TUniSpeedButton;
    PkOutsrcReorder: TIQWebHPick;
    PkOutsrcReorderID: TBCDField;
    PkOutsrcReorderARINVT_ID: TBCDField;
    PkOutsrcReorderCLASS: TStringField;
    PkOutsrcReorderITEMNO: TStringField;
    PkOutsrcReorderREV: TStringField;
    PkOutsrcReorderDESCRIP: TStringField;
    PkOutsrcReorderDESCRIP2: TStringField;
    PkOutsrcReorderVENDOR_ID: TBCDField;
    PkOutsrcReorderVENDORNO: TStringField;
    PkOutsrcReorderCOMPANY: TStringField;
    PkOutsrcReorderSAFETY_STOCK: TBCDField;
    PkOutsrcReorderMIN_ORDER_QTY: TBCDField;
    SrcReorder: TDataSource;
    QryOutsrcReorder: TFDQuery;
    QryOutsrcReorderID: TBCDField;
    QryOutsrcReorderARINVT_ID: TBCDField;
    QryOutsrcReorderCLASS: TStringField;
    QryOutsrcReorderITEMNO: TStringField;
    QryOutsrcReorderREV: TStringField;
    QryOutsrcReorderDESCRIP: TStringField;
    QryOutsrcReorderDESCRIP2: TStringField;
    QryOutsrcReorderVENDOR_ID: TBCDField;
    QryOutsrcReorderVENDORNO: TStringField;
    QryOutsrcReorderCOMPANY: TStringField;
    QryOutsrcReorderSAFETY_STOCK: TBCDField;
    QryOutsrcReorderMIN_ORDER_QTY: TBCDField;
    wwDBComboDlgItem: TUniEdit;
    wwDBComboDlgVendor: TUniEdit;
    PkItemVendor: TIQWebHPick;
    PkOutsrcReorderPK_HIDE: TStringField;
    PkItemVendorCLASS: TStringField;
    PkItemVendorITEMNO: TStringField;
    PkItemVendorREV: TStringField;
    PkItemVendorDESCRIP: TStringField;
    PkItemVendorDESCRIP2: TStringField;
    PkItemVendorVENDORNO: TStringField;
    PkItemVendorCOMPANY: TStringField;
    PkItemVendorARINVT_ID: TBCDField;
    PkItemVendorVENDOR_ID: TBCDField;
    Panel2: TUniPanel;
    sbtnAddMultipleFiles: TUniSpeedButton;
    PkItemVendorIDENTIFIER: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSearchClick(Sender: TObject);
    procedure QryOutsrcReorderBeforePost(DataSet: TDataSet);
    procedure PickItemVendor(Sender: TObject);
    procedure QryOutsrcReorderCalcFields(DataSet: TDataSet);
    { TODO : TNavigateBtn has not been converted yet }
   // procedure DispatchNavigatorAction(Sender: TObject; Button: TNavigateBtn);
    procedure PkOutsrcReorderIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure QryOutsrcReorderAfterInsert(DataSet: TDataSet);
    procedure sbtnAddMultipleFilesClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    procedure IQNotify( var Msg: TMessage );
    { TODO : IQMS.Common.UserMessages has a problem }
      //message iq_Notify;
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous;

const
  constInsertViaNavigator = 1;
  constUpdateUsingPicklist = 2;

{ TFrmOutsourceCentralReorder }

procedure TFrmOutsourceCentralReorder.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

{ TODO : TNavigateBtn has not been converted yet }
{procedure TFrmOutsourceCentralReorder.DispatchNavigatorAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbInsert: PostMessage( self.Handle, iq_Notify, constUpdateUsingPicklist, 0);
  end;
end;  }

class procedure TFrmOutsourceCentralReorder.DoShow;
var
  LFrmOutsourceCentralReorder : TFrmOutsourceCentralReorder;
begin
  LFrmOutsourceCentralReorder := TFrmOutsourceCentralReorder.Create(UniGUIApplication.UniApplication);
  LFrmOutsourceCentralReorder.Show;
end;

procedure TFrmOutsourceCentralReorder.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmOutsourceCentralReorder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGrid1 ]);
end;

procedure TFrmOutsourceCentralReorder.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
  { TODO : TUniDBNavigator has no member navMain or nbInsert }
   { constInsertViaNavigator:
      if navMain.Controls[ Ord(nbInsert) ].Enabled then
         navMain.BtnClick( nbInsert );   }

    constUpdateUsingPicklist:
      PickItemVendor( nil );
  end;
end;

procedure TFrmOutsourceCentralReorder.QryOutsrcReorderAfterInsert(
  DataSet: TDataSet);
begin
  // trigger update of the calc fields to wipe them off
  QryOutsrcReorderARINVT_ID.Clear;
end;

procedure TFrmOutsourceCentralReorder.QryOutsrcReorderBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'outsrc_reorder');
end;

procedure TFrmOutsourceCentralReorder.QryOutsrcReorderCalcFields(
  DataSet: TDataSet);
var
  A: Variant;
begin
  if QryOutsrcReorderARINVT_ID.asBCD > 0 then
  begin
    A:= SelectValueArrayFmt('select class, itemno, rev, descrip, descrip2 from arinvt where id = %.0f',
                                  [ QryOutsrcReorderARINVT_ID.asFloat ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      QryOutsrcReorderCLASS.asString   := A[0];
      QryOutsrcReorderITEMNO.asString  := A[1];
      QryOutsrcReorderREV.asString     := A[2];
      QryOutsrcReorderDESCRIP.asString := A[3];
      QryOutsrcReorderDESCRIP2.asString:= A[4];
    end;
  end;

  if QryOutsrcReorderVENDOR_ID.asBCD > 0 then
  begin
    A:= SelectValueArrayFmt('select vendorno, company from vendor where id = %.0f',
                                  [ QryOutsrcReorderVENDOR_ID.asFloat ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      QryOutsrcReorderVENDORNO.asString:= A[0];
      QryOutsrcReorderCOMPANY.asString := A[1];
    end;
  end;
end;

procedure TFrmOutsourceCentralReorder.sbtnAddMultipleFilesClick(
  Sender: TObject);
var
  I: Integer;
  AArinvt_ID: Real;
  AVendor_ID: Real;
  ASeparatorPosition: Integer;
begin
  if QryOutsrcReorder.State in [dsInsert, dsEdit] then
     QryOutsrcReorder.Cancel;

  with PkItemVendor do
    if ExecuteEx('identifier') then
       for I:= 0 to ResultList.Count - 1 do
       begin
         ASeparatorPosition:= Pos('*', ResultList[ I ]);
         if ASeparatorPosition > 0 then
         begin
           AArinvt_ID:= StrToFloat( Copy( ResultList[ I ], 1, ASeparatorPosition - 1));
           AVendor_ID:= StrToFloat( Copy( ResultList[ I ], ASeparatorPosition + 1, 255));
           QryOutsrcReorder.Insert;
           QryOutsrcReorderARINVT_ID.asFloat:= AArinvt_ID;
           QryOutsrcReorderVENDOR_ID.asFloat:= AVendor_ID;
           QryOutsrcReorder.Post;
         end;
       end;
end;

procedure TFrmOutsourceCentralReorder.sbtnSearchClick(Sender: TObject);
begin
  with PkOutsrcReorder do
    if Execute then
       QryOutsrcReorder.Locate('id', GetValue('id'), []);
end;

procedure TFrmOutsourceCentralReorder.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self, wwDBGrid1 ]);
  LocateOrPickList( self, 0, QryOutsrcReorder, PkOutsrcReorder );
end;

procedure TFrmOutsourceCentralReorder.PickItemVendor(Sender: TObject);
begin
  with PkItemVendor do
    if Execute then
    begin
      QryOutsrcReorder.Edit;
      QryOutsrcReorderARINVT_ID.asFloat:= GetValue('arinvt_id');
      QryOutsrcReorderVENDOR_ID.asFloat:= GetValue('vendor_id');
    end;
end;


procedure TFrmOutsourceCentralReorder.PkOutsrcReorderIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrOK;
  ResultValue:= 0;
  { TODO : IQMS.Common.UserMessages has a problem }
 // PostMessage( self.Handle, IQ_Notify, constInsertViaNavigator, 0 );   { Call Insert }
end;

end.
