unit FAShare;

interface

uses
  FAConst,
  System.SysUtils,
  System.Classes,
  System.SyncObjs;


procedure DoIqFA( AOwner: TComponent; AType: Integer; AStr:String; AID1, AID2, AID3: Real );

implementation

uses
  IQMS.Common.Applications,
  IQMS.WebVcl.SecurityManager,
  { TODO : Dependancy on faMaint
  FaMaint,
  FAGLPost,
  }
  FaBooks,
  FaClass,


  MainImp;


procedure DoIqFA( AOwner: TComponent;  AType: Integer; AStr:String; AID1, AID2, AID3: Real );
begin
  if not SecurityManager.SetVisibleIfLicensed( nil,    nil, nil, IQAppsNames[ apFA ] , nil ) then
     EXIT;

  case AType of
  { TODO : Dependancy on faMaint
    SHOW_FA_MAIN         : DoShowFaMaint(AOwner, AId1) ;} // in FaMaint.pas
    SHOW_FA_BOOKS        : DoShowFaBooks() ; // in FaBooks.pas
    SHOW_FA_CLASS        : DoShowFaClass() ; // in FaClass.pas
    { TODO : Dependancy on FAGLPost
    SHOW_FA_GL           : DoFAPrepostGL() ; } // in FaClass.pas
    SHOW_IMP_FA          : DoImpFA();  {in MainImp.pas}
  end;
end;

end.
