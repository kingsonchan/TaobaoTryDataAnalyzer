object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #28120#23453#35797#29992#25968#25454#32479#35745'      QQ:147629800'
  ClientHeight = 492
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 57
    Width = 891
    Height = 416
    ActivePage = tsFree
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 858
    object tsFree: TTabSheet
      Caption = #20813#36153#35797#29992
      ExplicitWidth = 850
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 65
        Width = 883
        Height = 323
        Align = alClient
        DataSource = dsData
        DynProps = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        FooterParams.Color = clWindow
        IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
        OddRowColor = cl3DLight
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        ParentFont = False
        RowLines = 1
        RowSizingAllowed = True
        TabOrder = 0
        TitleParams.RowHeight = 20
        OnCellClick = DBGridEh1CellClick
        OnDblClick = DBGridEh1DblClick
        OnTitleBtnClick = DBGridEh1TitleBtnClick
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'title'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35797#29992#21697
            Width = 189
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'statusStr'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #29366#24577
            Width = 54
          end
          item
            DisplayFormat = '0.00'
            DynProps = <>
            EditButtons = <>
            FieldName = 'currentPrice'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21407#20215
            Title.TitleButton = True
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'totalNum'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25552#20379
            Title.TitleButton = True
            Width = 57
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'capacity'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21333#20301
            Width = 56
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'requestNum'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #30003#35831
            Title.TitleButton = True
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'itemId'
            Footers = <>
            Visible = False
            Width = 52
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'itemDetailUrl'
            Footers = <>
            Visible = False
            Width = 111
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'otherGood'
            Footers = <>
            Visible = False
            Width = 63
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'picUrl'
            Footers = <>
            Visible = False
            Width = 55
          end
          item
            DisplayFormat = '0.0000%'
            DynProps = <>
            EditButtons = <>
            FieldName = 'requestRate'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #30003#35831#27604#20363
            Title.TitleButton = True
            Width = 105
          end
          item
            DisplayFormat = '0.0000%'
            DynProps = <>
            EditButtons = <>
            FieldName = 'Request_Price_Rate'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #30003#35831'/'#20215#26684#27604#20363
            Title.TitleButton = True
            Width = 139
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnlFree: TPanel
        Left = 0
        Top = 0
        Width = 883
        Height = 65
        Align = alTop
        TabOrder = 1
        Visible = False
        ExplicitWidth = 850
        object lbl1: TLabel
          Left = 14
          Top = 16
          Width = 36
          Height = 13
          Caption = #29366#24577#65306
        end
        object lbl2: TLabel
          Left = 240
          Top = 8
          Width = 36
          Height = 13
          Caption = #21407#20215#65306
        end
        object lbl3: TLabel
          Left = 367
          Top = 8
          Width = 12
          Height = 13
          Caption = #33267
        end
        object Label1: TLabel
          Left = 367
          Top = 36
          Width = 12
          Height = 13
          Caption = #33267
        end
        object Label2: TLabel
          Left = 216
          Top = 36
          Width = 60
          Height = 13
          Caption = #30003#35831#27604#20363#65306
        end
        object btnFreeFilter: TButton
          Left = 688
          Top = 16
          Width = 75
          Height = 25
          Caption = #36807#28388
          TabOrder = 0
        end
        object btnFreeClearFilter: TButton
          Left = 800
          Top = 16
          Width = 75
          Height = 25
          Caption = #20840#37096
          TabOrder = 1
        end
        object cbbStatus: TComboBox
          Left = 56
          Top = 16
          Width = 145
          Height = 21
          ItemIndex = 0
          TabOrder = 2
          Items.Strings = (
            ''
            #36827#34892#20013
            #24050#32467#26463)
        end
        object seFreePriceStart: TSpinEdit
          Left = 282
          Top = 4
          Width = 79
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
        end
        object seFreePriceEnd: TSpinEdit
          Left = 409
          Top = 4
          Width = 79
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 4
          Value = 0
        end
        object SpinEdit1: TSpinEdit
          Left = 282
          Top = 32
          Width = 79
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 5
          Value = 0
        end
        object SpinEdit2: TSpinEdit
          Left = 409
          Top = 32
          Width = 79
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 6
          Value = 0
        end
      end
    end
    object tsCharge: TTabSheet
      Caption = #20184#36153#35797#29992
      ImageIndex = 1
      ExplicitWidth = 850
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 883
        Height = 388
        Align = alClient
        DataSource = dsPay
        DynProps = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        FooterParams.Color = clWindow
        IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
        OddRowColor = cl3DLight
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        ParentFont = False
        RowLines = 1
        RowSizingAllowed = True
        TabOrder = 0
        TitleParams.RowHeight = 20
        OnCellClick = DBGridEh1CellClick
        OnDblClick = DBGridEh1DblClick
        OnTitleBtnClick = DBGridEh1TitleBtnClick
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'title'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #35797#29992#21697
            Width = 215
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'statusStr'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #29366#24577
            Title.TitleButton = True
            Width = 105
          end
          item
            DisplayFormat = '0.00'
            DynProps = <>
            EditButtons = <>
            FieldName = 'currentPrice'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21407#20215
            Title.TitleButton = True
            Width = 78
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'totalNum'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25552#20379
            Title.TitleButton = True
            Width = 89
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'capacity'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21333#20301
            Width = 75
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'itemId'
            Footers = <>
            Visible = False
            Width = 52
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'itemDetailUrl'
            Footers = <>
            Visible = False
            Width = 111
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'otherGood'
            Footers = <>
            Visible = False
            Width = 63
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'picUrl'
            Footers = <>
            Visible = False
            Width = 55
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'quantity'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21097#20313
            Title.TitleButton = True
            Width = 92
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'discountPrice'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #37038#36153
            Title.TitleButton = True
            Width = 86
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 473
    Width = 891
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 1
    ExplicitWidth = 858
    object pnlStatus: TRzStatusPane
      Left = 0
      Top = 0
      Width = 891
      Height = 19
      Align = alClient
      Caption = ''
      ExplicitWidth = 393
    end
  end
  object pnlTop: TRzPanel
    Left = 0
    Top = 0
    Width = 891
    Height = 57
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 2
    ExplicitWidth = 858
    object btnFree: TButton
      Left = 18
      Top = 17
      Width = 75
      Height = 25
      Caption = #24320#22987
      TabOrder = 0
      OnClick = btnFreeClick
    end
    object rbAll: TRadioButton
      Left = 128
      Top = 21
      Width = 81
      Height = 17
      Caption = #20840#37096#26816#26597
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object chkBreak: TCheckBox
      Left = 209
      Top = 21
      Width = 137
      Height = 17
      Caption = #36935#21040#32467#26463#29289#21697#26102#20572#27490
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object rbPage: TRadioButton
      Left = 346
      Top = 21
      Width = 89
      Height = 17
      Caption = #26816#26597#21040#39029#65306
      TabOrder = 3
    end
    object edtPage: TEdit
      Left = 435
      Top = 19
      Width = 57
      Height = 21
      TabOrder = 4
      Text = '30'
    end
    object btnSaveDataset: TButton
      Left = 664
      Top = 17
      Width = 75
      Height = 25
      Caption = #20445#23384#21040#25991#20214
      TabOrder = 5
      OnClick = btnSaveDatasetClick
    end
    object btnLoadDataset: TButton
      Left = 766
      Top = 17
      Width = 75
      Height = 25
      Caption = #20174#25991#20214#21152#36733
      TabOrder = 6
      OnClick = btnLoadDatasetClick
    end
  end
  object btnStop: TButton
    Left = 528
    Top = 17
    Width = 75
    Height = 25
    Caption = #20572#27490
    Enabled = False
    TabOrder = 3
    OnClick = btnStopClick
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 248
    Top = 272
  end
  object dsData: TDataSource
    DataSet = mtData
    Left = 339
    Top = 96
  end
  object mtData: TMemTableEh
    Params = <>
    Left = 258
    Top = 96
    object mtDatatitle: TStringField
      FieldName = 'title'
      Size = 200
    end
    object mtDatastatus: TIntegerField
      FieldName = 'status'
    end
    object mtDatastatusStr: TStringField
      FieldName = 'statusStr'
    end
    object mtDataitemDetailUrl: TStringField
      FieldName = 'itemDetailUrl'
      Size = 200
    end
    object mtDatarequestNum: TIntegerField
      FieldName = 'requestNum'
    end
    object mtDataitemId: TStringField
      FieldName = 'itemId'
      Size = 200
    end
    object mtDatacurrentPrice: TFloatField
      FieldName = 'currentPrice'
    end
    object mtDatacapacity: TStringField
      FieldName = 'capacity'
      Size = 200
    end
    object mtDatatotalNum: TIntegerField
      FieldName = 'totalNum'
    end
    object mtDataotherGood: TStringField
      FieldName = 'otherGood'
      Size = 200
    end
    object mtDatapicUrl: TStringField
      FieldName = 'picUrl'
      Size = 200
    end
    object mtDatarequestRate: TFloatField
      FieldName = 'requestRate'
    end
    object mtDataRequest_Price_Rate: TFloatField
      FieldName = 'Request_Price_Rate'
    end
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '.dat'
    Filter = '*.dat|*.dat|*.*|*'
    Left = 368
    Top = 224
  end
  object dlgSave: TSaveDialog
    DefaultExt = '.dat'
    Filter = '*.dat|*.dat|*.*|*'
    Left = 448
    Top = 224
  end
  object mtPay: TMemTableEh
    Params = <>
    Left = 258
    Top = 176
    object mtPaytitle: TStringField
      FieldName = 'title'
      Size = 200
    end
    object mtPaystatus: TIntegerField
      FieldName = 'status'
    end
    object mtPaystatusStr: TStringField
      FieldName = 'statusStr'
    end
    object mtPayitemDetailUrl: TStringField
      FieldName = 'itemDetailUrl'
      Size = 200
    end
    object mtPayitemId: TStringField
      FieldName = 'itemId'
      Size = 200
    end
    object mtPaycurrentPrice: TFloatField
      FieldName = 'currentPrice'
    end
    object mtPaycapacity: TStringField
      FieldName = 'capacity'
      Size = 200
    end
    object mtPaytotalNum: TIntegerField
      FieldName = 'totalNum'
    end
    object mtPayotherGood: TStringField
      FieldName = 'otherGood'
      Size = 200
    end
    object mtPaypicUrl: TStringField
      FieldName = 'picUrl'
      Size = 200
    end
    object mtPaydiscountPrice: TFloatField
      FieldName = 'discountPrice'
    end
    object mtPayquantity: TFloatField
      FieldName = 'quantity'
    end
  end
  object dsPay: TDataSource
    DataSet = mtPay
    Left = 339
    Top = 176
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 608
    Top = 144
  end
end
