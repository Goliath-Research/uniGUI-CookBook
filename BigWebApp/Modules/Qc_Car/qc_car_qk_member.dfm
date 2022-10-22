inherited QuickAddTeamMember: TQuickAddTeamMember
  Left = 141
  Top = 193
  ClientHeight = 216
  ClientWidth = 328
  Caption = 'Add Team Member'
  ExplicitWidth = 344
  ExplicitHeight = 255
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 168
    Width = 328
    Height = 48
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 1
    ExplicitTop = 168
    ExplicitWidth = 328
    ExplicitHeight = 48
    inherited Panel2: TUniPanel
      Left = 49
      Width = 279
      Height = 46
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 49
      ExplicitWidth = 279
      ExplicitHeight = 46
      inherited btnOK: TUniButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
      inherited btnCancel: TUniButton
        Left = 143
        Width = 126
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitLeft = 143
        ExplicitWidth = 126
      end
    end
  end
  inherited PageControl1: TUniPageControl
    Width = 328
    Height = 168
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 0
    TabStop = False
    ExplicitWidth = 328
    ExplicitHeight = 168
    inherited TabSheet1: TUniTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitWidth = 320
      ExplicitHeight = 140
      object PnlClient01: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 320
        Height = 140
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 106
          Top = 0
          Width = 4
          Height = 140
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft01: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 106
          Height = 138
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          ExplicitLeft = -3
          ExplicitTop = -2
          object Label1: TUniLabel
            Left = 10
            Top = 16
            Width = 27
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Name'
            TabOrder = 1
          end
          object Label2: TUniLabel
            Left = 10
            Top = 47
            Width = 36
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'User ID'
            TabOrder = 2
          end
          object Label3: TUniLabel
            Left = 10
            Top = 78
            Width = 20
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Title'
            TabOrder = 3
          end
          object Label4: TUniLabel
            Left = 10
            Top = 110
            Width = 28
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'E-Mail'
            TabOrder = 4
          end
        end
        object PnlClient02: TUniPanel
          Tag = 1999
          Left = 110
          Top = 1
          Width = 210
          Height = 138
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            210
            138)
          object DBEdit1: TUniDBEdit
            Left = 1
            Top = 10
            Width = 201
            Height = 25
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'NAME'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object wwUsers: TUniEdit
            Left = 1
            Top = 40
            Width = 313
            Height = 25
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object DBEdit3: TUniDBEdit
            Left = 1
            Top = 73
            Width = 313
            Height = 25
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'TITLE'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object DBEdit4: TUniDBEdit
            Left = 1
            Top = 105
            Width = 313
            Height = 25
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'EMAIL'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
        end
      end
    end
  end
  inherited Table1: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'TEAM_MEMBER'
    TableName = 'TEAM_MEMBER'
    Top = 7
    object Table1ID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object Table1NAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object Table1USERID: TStringField
      DisplayLabel = 'User ID'
      FieldName = 'USERID'
      Required = True
      Size = 35
    end
    object Table1TITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Size = 40
    end
    object Table1EMAIL: TStringField
      DisplayLabel = 'EMail'
      FieldName = 'EMAIL'
      Required = True
      Size = 250
    end
    object Table1USED_CAR: TStringField
      FieldName = 'USED_CAR'
      FixedChar = True
      Size = 1
    end
  end
  inherited DataSource1: TDataSource
    Top = 7
  end
  object PkUsers: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.username'
      '  from all_users a'
      ' where not a.username in ( '#39'SYS'#39', '#39'SYSTEM'#39' )'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 212
    Top = 6
    object PkUsersUSERNAME: TStringField
      DisplayLabel = 'User name'
      FieldName = 'USERNAME'
      Size = 128
    end
  end
end
