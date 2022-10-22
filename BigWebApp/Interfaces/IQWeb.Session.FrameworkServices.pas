unit IQWeb.Session.FrameworkServices;

interface

uses
  DB,
  IQCore.Interfaces,
  IQWeb.Server.DataServices,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type

  IIQFrameworkServices = interface
    ['{88CBC18D-C01C-4D65-9447-B088B8A2EEE4}']

    function  GetConnection    : TCustomConnection;
    function  GetDataServices  : IIQDataServices;

    function  GetModules       : IIQModules;
    function  GetModuleDS      : TDataSet;

    function  GetDataModules   : IIQDataModules;
    function  GetDataModuleDS  : TDataSet;
    function  GetDataSetDS     : TDataSet;
    function  GetFieldDS       : TDataSet;
    function  GetPickTreeDS    : TDataSet;
    function  GetTreeNodeDS    : TDataSet;
    function  GetQryTreeNodes  : TDataSet;
    function  GetPickTrees     : IIQPickTrees;
    function  GetPickListDS    : TDataSet;
    function  GetListItemDS    : TDataSet;
    function  GetPickLists     : IIQPickLists;
    function  GetPickDataSetDS : TDataSet;
    function  GetPickDataSets  : IIQPickDataSets;

    function  GetPickListItems : TFDQuery;

    function  GetDataSet       (aObj : IIQObj; aID : integer = 0) : TDataSet;

    property Connection     : TCustomConnection read GetConnection;

    property DataServices   : IIQDataServices   read GetDataServices;

    property Modules        : IIQModules        read GetModules;
    property ModuleDS       : TDataSet          read GetModuleDS;

    property DataModules    : IIQDataModules    read GetDataModules;

    property DataModuleDS   : TDataSet          read GetDataModuleDS;
    property DataSetDS      : TDataSet          read GetDataSetDS;
    property FieldDS        : TDataSet          read GetFieldDS;

    property PickTreeDS     : TDataSet          read GetPickTreeDS;
    property TreeNodeDS     : TDataSet          read GetTreeNodeDS;
    property QryTreeNodes   : TDataSet          read GetQryTreeNodes;

    property PickTrees      : IIQPickTrees      read GetPickTrees;

    property PickListDS     : TDataSet          read GetPickListDS;
    property ListItemDS     : TDataSet          read GetListItemDS;

    property PickLists      : IIQPickLists      read GetPickLists;

    property PickDataSetDS  : TDataSet          read GetPickDataSetDS;
    property PickDataSets   : IIQPickDataSets   read GetPickDataSets;

    property PickListItems  : TFDQuery          read GetPickListItems;
  end;

implementation

end.
