unit IQMS.WebVcl.BulletinViewer;

interface

uses
  Classes,UniUrlFrame,
  SHDocVw,UniPanel,
  Vcl.Controls;

type
  TBulletinSource = (bsEplant,bsArinvt,bsWorkCenter,bsStandard,bsArcusto);

  TIQWebBulletinViewer = class(TUniPanel)
    private
      FWebBrowser:TUniUrlFrame;
      FSourceSourceIds,
      FLastSourceSourceIds:String;
      FIISBaseUrl: String;
      function GetIISBaseUrl: String;

    public
      constructor Create(AOwner:TComponent); override;

      procedure ClearSourceSourceIds;
      procedure AddSourceId(ASource:TBulletinSource;ASourceId:Real);
      procedure Navigate;

      property SourceSourceIds:String read FSourceSourceIds write FSourceSourceIds;
      property IISBaseUrl:String read GetIISBaseUrl;
  end;
implementation

{ TBulletinViewer }

uses
  SysUtils,
  IQMS.WebVcl.SecurityManager,
  Web.HTTPApp,
  Vcl.OleCtrls,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils;

constructor TIQWebBulletinViewer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FWebBrowser:= TUniUrlFrame.Create(self);
  FWebBrowser.Align:= alClient;

  FLastSourceSourceIds:= '';
  ClearSourceSourceIds;
  FIIsBaseUrl:= '';
end;

procedure TIQWebBulletinViewer.ClearSourceSourceIds;
begin
  FSourceSourceIds:= '';
end;

procedure TIQWebBulletinViewer.AddSourceId(ASource: TBulletinSource;
  ASourceId: Real);
var
  S:string;
begin
  case ASource of
    bsEplant: s:= 'EPLANT';
    bsArinvt: s:= 'ARINVT';
    bsWorkCenter: s:= 'WORK_CENTER';
    bsStandard: s:= 'STANDARD';
    bsArcusto: s:= 'ARCUSTO';
  end;
  FSourceSourceIds:= Format( '%s%s:%.0f;', [ FSourceSourceIds, s, ASourceId ] );
end;

function TIQWebBulletinViewer.GetIISBaseUrl: String;
begin
  if FIISBaseUrl = '' then
    FIISBaseUrl:= IQMS.Common.Miscellaneous.IQGetIISServerBaseURL;
  Result:= FIIsBaseUrl;
end;

procedure TIQWebBulletinViewer.Navigate;
var
 S:String;
begin
  if (FLastSourceSourceIds <> '') and (FLastSourceSourceIds = SourceSourceIds) then // prevent unnecessar refresh bc the page will refresh itself for the passed in SourceSourceIds
    EXIT;

  FLastSourceSourceIds:= Copy( SourceSourceIds, 1, Length(SourceSourceIds) );

      //Ex: http://localhost:8080/EnterpriseIQ/Account/ManualLogOnWithProxy?username=ABEMP&password=H1NW&returnurl=/EnterpriseIQ/social?tags=WORK_CENTER:3582:Work Center
  S := Format('%sEnterpriseIQ/Account/ManualLogOnWithProxy?username=%s&password=%s'+
                          '&returnurl=%s',[ FIIsBaseUrl, SecurityManager.UserName, HTTPEncode(SelectValueAsString('select iqms_log from iqorder2')), // IQMS.WebVcl.SecurityManager.pas, ACharXOrPw,
                                            '/EnterpriseIQ/social?tags='+SourceSourceIds ]);
  FWebBrowser.url:=s;
end;

end.
