unit IQMS.Common.AddVendorAccess;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid, uniGUIFrame;

type
  TFrmAddVendorAccess = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    IQSearch1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    wwQuery1COMPANY: TStringField;
    wwQuery1ADDR1: TStringField;
    wwQuery1ADDR2: TStringField;
    wwQuery1ADDR3: TStringField;
    wwQuery1CITY: TStringField;
    wwQuery1STATE: TStringField;
    wwQuery1COUNTRY: TStringField;
    wwQuery1ZIP: TStringField;
    wwQuery1PHONE_NUMBER: TStringField;
    wwQuery1PRIME_CONTACT: TStringField;
    wwQuery1ID: TFloatField;
    wwQuery1VENDORNO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FUserName: string;
    procedure DoAppend;
    procedure Validate;
    procedure SetUserName(const AUserName: string);
  public
    { Public declarations }
    class function DoShowModal(AUserName: string ): Boolean;
    property UserName: string read FUserName write SetUserName;
  end;


implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.PanelMsg;
{$R *.dfm}

class function TFrmAddVendorAccess.DoShowModal(AUserName: string): Boolean;
begin
  with self.Create(uniGUIApplication.UniApplication) do
  begin
    UserName:=AUserName;
    Result:= ShowModal = mrOK;
  end;
end;


procedure TFrmAddVendorAccess.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmAddVendorAccess.SetUserName(const AUserName: string);
begin
  FUserName:=AUserName;
  Caption:= Format('Append to Vendor Access [User Name: %s]', [ FUserName ]);
end;

procedure TFrmAddVendorAccess.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [self]);
end;

procedure TFrmAddVendorAccess.btnOKClick(Sender: TObject);
begin
  Validate;
  DoAppend;
  ModalResult:= mrOK;
end;

procedure TFrmAddVendorAccess.Validate;
begin
  IQAssert( not (wwQuery1.Bof and wwQuery1.Eof), 'No records found - unable to continue' );
end;

procedure TFrmAddVendorAccess.DoAppend;
var
  hMsg: TPanelMesg;
  I: Integer;

  procedure InternalAppend( AVendor_ID: Real );
  begin
    ExecuteCommandFmt('declare                                                         '+
              '  v_vendor_id  number::= %f;                                   '+
              '  v_user_name   varchar2(35)::= ''%s'';                         '+
              '  v_count       number;                                         '+
              'begin                                                           '+
              '  select count(*) into v_count from s_user_vendors        '+
              '   where user_name = v_user_name and vendor_id = v_vendor_id; '+
              '                                                                '+
              '  if v_count = 0 then                                           '+
              '     insert into s_user_vendors( user_name, vendor_id )  '+
              '     values (v_user_name, v_vendor_id );                       '+
              '  end if;                                                       '+
              'end;                                                            ',
              [ AVendor_ID,
                FUserName ]);
  end;

begin
  {assign current selection}
  hMsg:= hPleaseWait( '' );
  try
    with IQSearch1 do
    begin
      if DBGrid.SelectedRows.Count > 0 then
         for I:= 0 to DBGrid.SelectedRows.Count - 1 do
         begin
           DBGrid.DataSource.DataSet.GotoBookmark( DBGrid.SelectedRows.Items[ I ]);
           InternalAppend( wwQuery1ID.asFloat )
         end
      else
         InternalAppend( wwQuery1ID.asFloat );
    end;
  finally
    hMsg.Free;
  end;
end;



end.
