object mUsersForm: TmUsersForm
  Left = 0
  Top = 0
  ClientHeight = 977
  ClientWidth = 600
  Caption = 'Edit Users'
  TitleButtons = <>
  PixelsPerInch = 96
  TextHeight = 13
  DesignOrientation = True
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object UnimContainerPanel1: TUnimContainerPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 977
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    AlignmentControl = uniAlignmentClient
    object barUsers: TUnimToolBar
      Left = 0
      Top = 0
      Width = 600
      Height = 48
      Hint = ''
      Anchors = [akLeft, akTop, akRight]
      Images = UniMainModule.UniNativeImageList1
      Caption = ''
      LayoutAttribs.Pack = 'justify'
      object btnToggleAdmin: TUnimToolButton
        Left = 0
        Top = 0
        Width = 48
        Height = 48
        Action = dmUsers.actToggleAdmin
        ImageIndex = 3
      end
      object UnimToolButton1: TUnimToolButton
        Left = 48
        Top = 0
        Width = 410
        Height = 48
        Hint = ''
        Style = tbsContainer
        Caption = 'UnimToolButton1'
        object dbnUsers: TUnimDBNavigator
          Left = 0
          Top = 3
          Width = 340
          Height = 42
          Hint = ''
          DataSource = dmUsers.dsUsers
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
          TabOrder = 1
        end
      end
    end
    object pnlNewPassword: TUnimContainerPanel
      Left = 0
      Top = 48
      Width = 600
      Height = 56
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      object edtNewPassword: TUnimEdit
        Left = 0
        Top = 0
        Width = 440
        Height = 56
        Hint = ''
        Align = alClient
        Text = ''
        PasswordChar = '*'
        FieldLabel = 'New Password'
      end
      object btnSetPassword: TUnimButton
        Left = 440
        Top = 0
        Width = 160
        Height = 56
        Hint = ''
        Align = alRight
        Caption = 'Set Password'
        OnClick = btnSetPasswordClick
      end
    end
    object dbgUsers: TUnimDBGrid
      Left = 0
      Top = 104
      Width = 600
      Height = 873
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dmUsers.dsUsers
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
      Columns = <
        item
          EditorType = ceText
          Title.Alignment = taCenter
          Title.Caption = 'Username'
          Title.Font.Height = -21
          FieldName = 'Username'
          Width = 147
        end
        item
          EditorType = ceCheck
          Alignment = taCenter
          Title.Alignment = taCenter
          Title.Caption = 'Admin'
          Title.Font.Height = -21
          FieldName = 'Admin'
          Width = 125
        end>
    end
  end
end
