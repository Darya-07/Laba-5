object MainForm: TMainForm
  Left = 473
  Top = 239
  Width = 1035
  Height = 543
  Caption = #1044#1074#1091#1093#1087#1091#1090#1077#1074#1086#1077' '#1076#1074#1091#1093#1092#1072#1079#1085#1086#1077' '#1077#1089#1090#1077#1089#1090#1074#1077#1085#1085#1086#1077' '#1089#1073#1072#1083#1072#1085#1089#1080#1088#1086#1074#1072#1085#1085#1086#1077' '#1089#1083#1080#1103#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMainMenu
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblFileName: TLabel
    Left = 16
    Top = 16
    Width = 53
    Height = 16
    Caption = 'FileName'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblName: TLabel
    Left = 408
    Top = 32
    Width = 56
    Height = 16
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblResult: TLabel
    Left = 632
    Top = 17
    Width = 298
    Height = 16
    Caption = #1057#1090#1088#1072#1085#1099' '#1074' '#1087#1086#1088#1103#1076#1082#1077' '#1091#1073#1099#1074#1072#1085#1080#1103' '#1087#1083#1086#1090#1085#1086#1089#1090#1080' '#1085#1072#1089#1077#1083#1077#1085#1080#1103
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lblDeleteCountry: TLabel
    Left = 16
    Top = 424
    Width = 81
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1090#1088#1072#1085#1091
    Enabled = False
  end
  object lblContinent: TLabel
    Left = 408
    Top = 88
    Width = 61
    Height = 16
    Caption = #1050#1086#1085#1090#1080#1085#1077#1085#1090
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCapital: TLabel
    Left = 408
    Top = 144
    Width = 49
    Height = 16
    Caption = #1057#1090#1086#1083#1080#1094#1072
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblArea: TLabel
    Left = 408
    Top = 200
    Width = 98
    Height = 16
    Caption = #1055#1083#1086#1097#1072#1076#1100' ('#1082#1084'^2)'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblPopulation: TLabel
    Left = 408
    Top = 264
    Width = 203
    Height = 16
    Caption = #1063#1080#1089#1083#1077#1085#1085#1086#1089#1090#1100' '#1085#1072#1089#1077#1083#1077#1085#1080#1081' ('#1095#1077#1083#1086#1074#1077#1082')'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblPoliticalSystem: TLabel
    Left = 408
    Top = 328
    Width = 140
    Height = 16
    Caption = #1043#1086#1089#1091#1076#1072#1088#1089#1090#1074#1077#1085#1085#1099#1081' '#1089#1090#1088#1086#1081
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object mmoOpenedFile: TMemo
    Left = 16
    Top = 32
    Width = 369
    Height = 393
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = mmoOpenedFileChange
  end
  object btnAddElem: TButton
    Left = 408
    Top = 400
    Width = 201
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnAddElemClick
  end
  object btnRemoveElem: TButton
    Left = 200
    Top = 440
    Width = 185
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnRemoveElemClick
  end
  object edtName: TEdit
    Left = 408
    Top = 48
    Width = 201
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object mmoResult: TMemo
    Left = 632
    Top = 32
    Width = 369
    Height = 393
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object btnTask: TButton
    Left = 712
    Top = 432
    Width = 193
    Height = 25
    Caption = #1054#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnTaskClick
  end
  object edtDeleteCountry: TEdit
    Left = 16
    Top = 440
    Width = 169
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object cbbContinent: TComboBox
    Left = 408
    Top = 104
    Width = 201
    Height = 24
    Style = csDropDownList
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 7
    Items.Strings = (
      #1040#1074#1089#1090#1088#1072#1083#1080#1103
      #1040#1085#1090#1072#1088#1082#1090#1080#1076#1072
      #1040#1092#1088#1080#1082#1072
      #1045#1074#1088#1072#1079#1080#1103
      #1057#1077#1074#1077#1088#1085#1072#1103' '#1040#1084#1077#1088#1080#1082#1072
      #1070#1078#1085#1072#1103' '#1040#1084#1077#1088#1080#1082#1072)
  end
  object edtCapital: TEdit
    Left = 408
    Top = 160
    Width = 201
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object edArea: TSpinEdit
    Left = 408
    Top = 216
    Width = 201
    Height = 26
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Increment = 100000
    MaxValue = 20000000
    MinValue = 1
    ParentFont = False
    TabOrder = 9
    Value = 1000000
  end
  object edPopulation: TSpinEdit
    Left = 408
    Top = 280
    Width = 201
    Height = 26
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Increment = 100000
    MaxValue = 2147483647
    MinValue = 1
    ParentFont = False
    TabOrder = 10
    Value = 1000000
  end
  object cbbPoliticalSystem: TComboBox
    Left = 408
    Top = 344
    Width = 201
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 11
    Items.Strings = (
      #1052#1086#1085#1072#1088#1093#1080#1103
      #1056#1077#1089#1087#1091#1073#1083#1080#1082#1072
      #1060#1077#1076#1077#1088#1072#1094#1080#1103)
  end
  object dlgOpenFile: TOpenDialog
    DefaultExt = 'foi'
    Filter = 'File of TInfo|*.foi'
    InitialDir = 'files'
    Left = 520
    Top = 65520
  end
  object mmMainMenu: TMainMenu
    Left = 600
    Top = 65520
    object FileAction: TMenuItem
      Caption = #1060#1072#1081#1083
      object New: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        OnClick = NewClick
      end
      object Open: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = OpenClick
      end
    end
    object ShowTask: TMenuItem
      Caption = #1047#1072#1076#1072#1095#1072
      OnClick = ShowTaskClick
    end
  end
end
