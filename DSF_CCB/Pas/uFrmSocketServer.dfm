object frmSocketServer: TfrmSocketServer
  Left = 320
  Top = 258
  Width = 582
  Height = 287
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #28966#20316#20013#35029#24314#35774#38134#34892#20195#25910#36153#26381#21153#31995#32479
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  Icon.Data = {
    000001000200101010000000040028010000260000002020100000000400E802
    00004E0100002800000010000000200000000100040000000000800000000000
    0000000000001000000010000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000874470000000000
    4444444400000004444444444000004444444444470008444440044444000844
    4400004444800744400000077780084447000074000008444470064470000044
    4448744484000084444444484400000844444484480000000444784480000000
    0000747000000000000000000000FFFF0000F83F0000F00F0000E0070000C003
    00008183000083C1000087E1000083CF000081870000C0030000C0030000E003
    0000F8070000FF1F0000FFFF0000280000002000000040000000010004000000
    0000000200000000000000000000100000001000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    0000000000000000000000000000000000000000000000000000000088777788
    0000000000000000000000764444444478000000000000000000844444444444
    4478000000000000000744444444444444448000000000000074444444444444
    4444480000000000074444444444444444444600000000008444444444444444
    4444447000000000744444444448744444444448000000084444444444800744
    4444444700000007444444444800007444444444800000074444444480000007
    4444444480000006444444480000000074444444700000844444448000000000
    0744444470000084444447000000000000788888800000044444447000000000
    0748000000000006444444470000000064448000000000074444444470000006
    4444480000000008444444444800006444444880000000004444444444800644
    4444884800000000744444444447744444488444800000000644444444444444
    4488444470000000084444444444444448844446000000000084444444444444
    8844446000000000000864444444444884444680000000000000074444444688
    4444680000000000000000877446787444470000000000000000000000887644
    4680000000000000000000000000887880000000000000000000000000000000
    00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFF0
    0FFFFFC003FFFF0000FFFE00007FFC00003FF800003FF000001FF000000FE001
    800FE003C007E007E007E00FF007C01FF807C03FFC07E01FF8FFE00FF07FE007
    E03FE003C01FF001800FF0000007F8000007F800000FFC00001FFE00001FFF80
    003FFFC000FFFFFC01FFFFFF07FFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 222
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 54
      Height = 16
      Alignment = taCenter
      Caption = 'Label1'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 96
      Width = 54
      Height = 16
      Alignment = taCenter
      Caption = 'Label1'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 54
      Height = 16
      Alignment = taCenter
      Caption = 'Label1'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 222
    Width = 566
    Height = 26
    Panels = <
      item
        Text = #26381#21153#22120':'#26410#36830#25509
        Width = 200
      end
      item
        Text = #20390#21548#31471#21475':'#26410#20390#21548
        Width = 150
      end
      item
        Text = #29256#26412':1.0.2.2'
        Width = 50
      end>
  end
  object SSocket: TServerSocket
    Active = False
    Port = 0
    ServerType = stThreadBlocking
    OnGetThread = SSocketGetThread
    OnClientError = SSocketClientError
    Left = 296
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 328
    Top = 8
  end
  object CoolTrayIcon1: TCoolTrayIcon
    CycleInterval = 0
    Hint = #28966#20316#20013#35029#24314#35774#38134#34892#20195#25910#36153#26381#21153#31995#32479
    Icon.Data = {
      000001000200101010000000040028010000260000002020100000000400E802
      00004E0100002800000010000000200000000100040000000000800000000000
      0000000000001000000010000000000000000000800000800000008080008000
      0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
      0000FF00FF00FFFF0000FFFFFF00000000000000000000000874470000000000
      4444444400000004444444444000004444444444470008444440044444000844
      4400004444800744400000077780084447000074000008444470064470000044
      4448744484000084444444484400000844444484480000000444784480000000
      0000747000000000000000000000FFFF0000F83F0000F00F0000E0070000C003
      00008183000083C1000087E1000083CF000081870000C0030000C0030000E003
      0000F8070000FF1F0000FFFF0000280000002000000040000000010004000000
      0000000200000000000000000000100000001000000000000000000080000080
      00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
      000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000088777788
      0000000000000000000000764444444478000000000000000000844444444444
      4478000000000000000744444444444444448000000000000074444444444444
      4444480000000000074444444444444444444600000000008444444444444444
      4444447000000000744444444448744444444448000000084444444444800744
      4444444700000007444444444800007444444444800000074444444480000007
      4444444480000006444444480000000074444444700000844444448000000000
      0744444470000084444447000000000000788888800000044444447000000000
      0748000000000006444444470000000064448000000000074444444470000006
      4444480000000008444444444800006444444880000000004444444444800644
      4444884800000000744444444447744444488444800000000644444444444444
      4488444470000000084444444444444448844446000000000084444444444444
      8844446000000000000864444444444884444680000000000000074444444688
      4444680000000000000000877446787444470000000000000000000000887644
      4680000000000000000000000000887880000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFF0
      0FFFFFC003FFFF0000FFFE00007FFC00003FF800003FF000001FF000000FE001
      800FE003C007E007E007E00FF007C01FF807C03FFC07E01FF8FFE00FF07FE007
      E03FE003C01FF001800FF0000007F8000007F800000FFC00001FFE00001FFF80
      003FFFC000FFFFFC01FFFFFF07FFFFFFFFFFFFFFFFFF}
    IconIndex = 0
    PopupMenu = PopupMenu1
    StartMinimized = True
    MinimizeToTray = True
    OnDblClick = CoolTrayIcon1DblClick
    Left = 184
    Top = 56
  end
  object PopupMenu1: TPopupMenu
    Left = 232
    Top = 56
    object N1: TMenuItem
      Caption = #26174#31034
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #35774#32622
      OnClick = N4Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #36864#20986
      Visible = False
      OnClick = N3Click
    end
  end
  object Timer2: TTimer
    Interval = 60000
    OnTimer = Timer2Timer
    Left = 320
    Top = 40
  end
end