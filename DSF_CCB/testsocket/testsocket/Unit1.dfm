object Form1: TForm1
  Left = 269
  Top = 85
  Width = 783
  Height = 581
  Caption = #26381#21153#22120#36830#25509#27979#35797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 304
    Width = 767
    Height = 238
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 73
      Width = 36
      Height = 13
      Caption = #25143#21495#65306
    end
    object Label2: TLabel
      Left = 184
      Top = 113
      Width = 39
      Height = 13
      Caption = #37329#39069#65306' '
    end
    object Label3: TLabel
      Left = 32
      Top = 113
      Width = 36
      Height = 13
      Caption = #25143#21495#65306
    end
    object Label4: TLabel
      Left = 32
      Top = 32
      Width = 88
      Height = 13
      Caption = #26381#21153#22120'IP'#22320#22336#65306'  '
    end
    object Label5: TLabel
      Left = 232
      Top = 32
      Width = 36
      Height = 13
      Caption = #31471#21475#65306
    end
    object Label6: TLabel
      Left = 32
      Top = 153
      Width = 36
      Height = 13
      Caption = #25143#21495#65306
    end
    object Label7: TLabel
      Left = 352
      Top = 153
      Width = 39
      Height = 13
      Caption = #37329#39069#65306' '
    end
    object Label8: TLabel
      Left = 168
      Top = 153
      Width = 75
      Height = 13
      Caption = #20132#26131#27969#27700#21495#65306' '
    end
    object Label9: TLabel
      Left = 32
      Top = 184
      Width = 39
      Height = 13
      Caption = ' '#25253#25991#65306
    end
    object Button1: TButton
      Left = 360
      Top = 32
      Width = 97
      Height = 25
      Caption = #36830#25509#26381#21153#22120
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 360
      Top = 69
      Width = 97
      Height = 25
      Caption = #26597#35810
      TabOrder = 1
      OnClick = Button2Click
    end
    object MaskEdit1: TMaskEdit
      Left = 80
      Top = 65
      Width = 129
      Height = 21
      EditMask = '!9999999999;1; '
      MaxLength = 10
      TabOrder = 2
      Text = '          '
    end
    object Edit3: TEdit
      Left = 80
      Top = 105
      Width = 81
      Height = 21
      MaxLength = 10
      TabOrder = 3
    end
    object Edit4: TEdit
      Left = 232
      Top = 105
      Width = 97
      Height = 21
      MaxLength = 12
      TabOrder = 4
    end
    object Button3: TButton
      Left = 360
      Top = 101
      Width = 97
      Height = 25
      Caption = #20132#36153
      TabOrder = 5
      OnClick = Button3Click
    end
    object Edit2: TEdit
      Left = 128
      Top = 32
      Width = 97
      Height = 21
      TabOrder = 6
      Text = '192.168.1.108'
    end
    object Edit1: TEdit
      Left = 272
      Top = 32
      Width = 65
      Height = 21
      MaxLength = 4
      TabOrder = 7
      Text = '9300'
    end
    object Edit5: TEdit
      Left = 80
      Top = 145
      Width = 81
      Height = 21
      MaxLength = 10
      TabOrder = 8
    end
    object Edit6: TEdit
      Left = 392
      Top = 145
      Width = 97
      Height = 21
      MaxLength = 12
      TabOrder = 9
    end
    object Button4: TButton
      Left = 496
      Top = 141
      Width = 97
      Height = 25
      Caption = #38144#36134#36864#27454
      TabOrder = 10
      OnClick = Button4Click
    end
    object Edit7: TEdit
      Left = 248
      Top = 145
      Width = 97
      Height = 21
      MaxLength = 20
      TabOrder = 11
    end
    object Edit8: TEdit
      Left = 80
      Top = 177
      Width = 409
      Height = 21
      MaxLength = 66
      TabOrder = 12
      Text = '56          6060posid12345yhh1234567wjmc.zzyh           '
    end
    object Button5: TButton
      Left = 496
      Top = 173
      Width = 97
      Height = 25
      Caption = #21457#36865
      TabOrder = 13
      OnClick = Button5Click
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 767
    Height = 304
    Align = alClient
    TabOrder = 1
  end
  object ClientSocket1: TClientSocket
    Active = False
    Address = '192.168.1.108'
    ClientType = ctNonBlocking
    Port = 9200
    OnConnect = ClientSocket1Connect
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Left = 584
    Top = 96
  end
end
