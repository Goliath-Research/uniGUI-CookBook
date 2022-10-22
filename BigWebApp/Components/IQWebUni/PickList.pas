unit PickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, uniEdit, uniSpeedButton, uniButton,
  uniBitBtn, uniCheckBox, uniLabel, uniStatusBar, uniImageList, uniBasicGrid,
  uniDBGrid, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TframePickList = class(TUniFrame)
    ucntrPanel: TUniContainerPanel;
    memTable: TFDMemTable;
    UniDBGrid1: TUniDBGrid;
    UniImageList1: TUniImageList;
    UniStatusBar1: TUniStatusBar;
    uplnBottom: TUniPanel;
    upnlButtons: TUniPanel;
    upnlPropagate: TUniPanel;
    ulblPropagate: TUniLabel;
    uchkPropagateSort: TUniCheckBox;
    uchkPropagateScope: TUniCheckBox;
    ubbSelect: TUniBitBtn;
    ubbCancel: TUniBitBtn;
    ubbNew: TUniBitBtn;
    upnlTop: TUniPanel;
    upnlSpeedButtons: TUniPanel;
    usbtnRemoveFilter: TUniSpeedButton;
    usbtnFilterDropDown: TUniSpeedButton;
    usbtnFilter: TUniSpeedButton;
    usbtnSortCriteriaDropDown: TUniSpeedButton;
    usbtnSortCriteria: TUniSpeedButton;
    usbtnSearch: TUniSpeedButton;
    upnlSubQuery: TUniPanel;
    usbtnSubQuery: TUniSpeedButton;
    upnlToggleHide: TUniPanel;
    usbtnToggleHide: TUniSpeedButton;
    upnlSearch: TUniPanel;
    uedtSearch: TUniEdit;
    uchkCaseInsensitive: TUniCheckBox;
    uchkWaitForPrompt: TUniCheckBox;
    uchkExactMatch: TUniCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



end.
