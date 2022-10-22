unit UserDefinedFormDesigner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniImageList, uniTreeView,
  uniPanel, uniPageControl;

type
  TUDFDesignerForm = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    upnlVisualDesign: TUniPanel;
    utvView: TUniTreeView;
    upnlDataModel: TUniPanel;
    utvData: TUniTreeView;
    UniImageList1: TUniImageList;
    UniTreeView1: TUniTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uniGUIApplication;

{$R *.dfm}


end.
