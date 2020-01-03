object FrmXtsz: TFrmXtsz
  Left = 287
  Top = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #31995#32479#21442#25968#35774#32622
  ClientHeight = 400
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 353
    Height = 161
    Caption = #25968#25454#24211#35774#32622
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 48
      Top = 32
      Width = 60
      Height = 12
      Caption = #26381#21153#22120'IP'#65306
      Transparent = True
      Rotation = roFlat
    end
    object RzLabel2: TRzLabel
      Left = 36
      Top = 67
      Width = 72
      Height = 12
      Caption = #25968#25454#24211#21517#31216#65306
    end
    object RzLabel3: TRzLabel
      Left = 36
      Top = 101
      Width = 72
      Height = 12
      Caption = #25968#25454#24211#29992#25143#65306
    end
    object RzLabel4: TRzLabel
      Left = 48
      Top = 136
      Width = 60
      Height = 12
      Caption = #29992#25143#23494#30721#65306
    end
    object serverip: TRzEdit
      Left = 112
      Top = 24
      Width = 200
      Height = 20
      FrameColor = clHighlight
      FrameHotColor = clHighlight
      FrameVisible = True
      TabOrder = 0
    end
    object db_name: TRzEdit
      Left = 112
      Top = 59
      Width = 200
      Height = 20
      FrameColor = clHighlight
      FrameHotColor = clHighlight
      FrameVisible = True
      TabOrder = 1
    end
    object db_user: TRzEdit
      Left = 112
      Top = 94
      Width = 200
      Height = 20
      FrameColor = clHighlight
      FrameHotColor = clHighlight
      FrameVisible = True
      TabOrder = 2
    end
    object db_pass: TRzEdit
      Left = 112
      Top = 130
      Width = 200
      Height = 20
      FrameColor = clHighlight
      FrameHotColor = clHighlight
      FrameVisible = True
      PasswordChar = '*'
      TabOrder = 3
    end
  end
  object rb_qd: TRzBitBtn
    Left = 96
    Top = 360
    Caption = #30830#23450
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    TabOrder = 1
    OnClick = rb_qdClick
    ImageIndex = 2
  end
  object rb_qx: TRzBitBtn
    Left = 200
    Top = 360
    ModalResult = 2
    Caption = #21462#28040
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    TabOrder = 2
    ImageIndex = 3
  end
  object RzGroupBox3: TRzGroupBox
    Left = 8
    Top = 176
    Width = 353
    Height = 169
    Caption = #31995#32479#35774#32622
    TabOrder = 3
    object RzLabel12: TRzLabel
      Left = 42
      Top = 26
      Width = 66
      Height = 12
      Caption = 'FTP'#25991#20214#22841#65306
    end
    object RzLabel13: TRzLabel
      Left = 36
      Top = 61
      Width = 72
      Height = 12
      Caption = #22791#20221#25991#20214#22841#65306
    end
    object RzLabel5: TRzLabel
      Left = 24
      Top = 101
      Width = 84
      Height = 12
      Caption = #23545#36134#38388#38548#26102#38388#65306
    end
    object RzLabel6: TRzLabel
      Left = 48
      Top = 141
      Width = 60
      Height = 12
      Caption = #30417#21548#31471#21475#65306
    end
    object dir_ftp: TRzEdit
      Left = 112
      Top = 21
      Width = 200
      Height = 20
      FrameColor = clHighlight
      FrameHotColor = clHighlight
      FrameVisible = True
      TabOrder = 0
    end
    object dir_bak: TRzEdit
      Left = 112
      Top = 56
      Width = 200
      Height = 20
      FrameColor = clHighlight
      FrameHotColor = clHighlight
      FrameVisible = True
      TabOrder = 1
    end
    object sys_time: TRzNumericEdit
      Left = 112
      Top = 96
      Width = 201
      Height = 20
      FrameColor = clHighlight
      FrameVisible = True
      TabOrder = 2
      DisplayFormat = '0;(0)'
    end
    object sys_port: TRzNumericEdit
      Left = 112
      Top = 136
      Width = 201
      Height = 20
      FrameColor = clHighlight
      FrameVisible = True
      TabOrder = 3
      DisplayFormat = '0;(0)'
    end
  end
end
