object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 115
  Height = 210
  Width = 215
  object ADOConnection1: TADOConnection
    CommandTimeout = 0
    ConnectionTimeout = 30
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object ADOSPyhcx: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 0
    ProcedureName = 'SP_YHDSCX;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@yhh'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@result'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 4
        Value = Null
      end
      item
        Name = '@uyhh'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 10
        Value = Null
      end
      item
        Name = '@uyhm'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 80
        Value = Null
      end
      item
        Name = '@uyhdz'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 100
        Value = Null
      end
      item
        Name = '@ujfsj'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 300
        Value = Null
      end>
    Left = 136
    Top = 120
  end
  object ADOSPyhjf: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 0
    ProcedureName = 'SP_DSJF;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@yhh'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@jfsj'
        Attributes = [paNullable]
        DataType = ftString
        Size = 14
        Value = Null
      end
      item
        Name = '@jfje'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 10
        Value = Null
      end
      item
        Name = '@sfrbh'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@bz'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@jffs'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = '@result'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 4
        Value = Null
      end
      item
        Name = '@lsbh'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 14
        Value = Null
      end>
    Left = 136
    Top = 64
  end
  object ADOSPyhtk: TADOStoredProc
    Connection = ADOConnection1
    CommandTimeout = 0
    ProcedureName = 'SP_YHTK;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@yhh'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@tksj'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@tkje'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 10
        Value = Null
      end
      item
        Name = '@tklx'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@sfrbh'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@sfrxm'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@bz'
        Attributes = [paNullable]
        DataType = ftString
        Size = 200
        Value = Null
      end
      item
        Name = '@result'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 136
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 0
    Parameters = <>
    Left = 16
    Top = 64
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 0
    Parameters = <>
    Left = 24
    Top = 120
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CommandTimeout = 0
    Parameters = <>
    Left = 56
    Top = 64
  end
end
