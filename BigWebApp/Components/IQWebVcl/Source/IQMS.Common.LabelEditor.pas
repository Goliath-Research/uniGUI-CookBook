unit IQMS.Common.LabelEditor;

interface

uses
  System.SysUtils,
  IQMS.Common.DotNetCOMInterOp;

  procedure EditLabel(ALabelTemplateId: Real; AIsShippingLabel: Boolean = False);
  procedure PrintLabelTemplate(ABatch: Real; ALabelTemplateId: Real; APrinterName: String);

implementation

uses
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager;

procedure EditLabel(ALabelTemplateId: Real; AIsShippingLabel: Boolean);
const
  DOTNETDLL = 'IQMS.LabelEditor';
  DOTNETCOMTYPE = 'IQMS.LabelEditor.LabelEditorInterface';
var
  ADotNetObject: Variant;
  CW: Word;
  AMessage: String;
begin
  DisableFPUExceptions( CW );
  try
    CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );

    try
      AMessage := ADotNetObject.EditLabel( SecurityManager.UserName,
                                  SecurityManager.Password,
                                  IQGetServerName( 'IQ' ),
                                  ALabelTemplateId, AIsShippingLabel);
    finally
      FreeDNetObject( ADotNetObject );
    end;
  finally
    RestoreFPU( CW );
  end;
end;

procedure PrintLabelTemplate(ABatch: Real; ALabelTemplateId: Real; APrinterName: String);
const
  DOTNETDLL = 'IQMS.LabelEditor';
  DOTNETCOMTYPE = 'IQMS.LabelEditor.LabelEditorInterface';
var
  ADotNetObject: Variant;
  CW: Word;
  AMessage: String;
begin
  DisableFPUExceptions( CW );
  try
    CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );

    try
      AMessage := ADotNetObject.PrintLabel( SecurityManager.UserName,
                                  SecurityManager.Password,
                                  IQGetServerName( 'IQ' ),
                                  ABatch, ALabelTemplateId, APrinterName);
    finally
      FreeDNetObject( ADotNetObject );
    end;
  finally
    RestoreFPU( CW );
  end;
end;

end.
