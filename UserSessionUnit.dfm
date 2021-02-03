object F_session: TF_session
  OldCreateOrder = False
  OnCreate = IWUserSessionBaseCreate
  Height = 331
  Width = 705
  object T_vendas: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_vendas')
    Left = 352
    Top = 24
    object T_vendasID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_vendasID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object T_vendasDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
    end
    object T_vendasVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
    end
    object T_vendasCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
    object T_vendasUSUARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'USUARIO'
      LookupDataSet = T_usuarios
      LookupKeyFields = 'ID'
      LookupResultField = 'USUARIO'
      KeyFields = 'ID_USUARIO'
      Size = 35
      Lookup = True
    end
  end
  object T_itensdevenda: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_itensdevenda')
    Left = 352
    Top = 80
    object T_itensdevendaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_itensdevendaID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      Required = True
    end
    object T_itensdevendaID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object T_itensdevendaQTD: TIntegerField
      FieldName = 'QTD'
      Origin = 'QTD'
      Required = True
    end
    object T_itensdevendaVALOR_UN: TFloatField
      FieldName = 'VALOR_UN'
      Origin = 'VALOR_UN'
      Required = True
    end
    object T_itensdevendaVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
    end
    object T_itensdevendaID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object T_itensdevendaPRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'PRODUTO'
      LookupDataSet = T_produtos
      LookupKeyFields = 'ID'
      LookupResultField = 'PRODUTO'
      KeyFields = 'ID_PRODUTO'
      Size = 35
      Lookup = True
    end
    object T_itensdevendaUSUARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'USUARIO'
      LookupDataSet = T_usuarios
      LookupKeyFields = 'ID'
      LookupResultField = 'USUARIO'
      KeyFields = 'ID_USUARIO'
      Size = 35
      Lookup = True
    end
  end
  object T_login: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      
        'select * from t_usuarios where USUARIO = :USUARIO and SENHA = PA' +
        'SSWORD(md5(:SENHA))')
    Left = 32
    Top = 24
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Value = 'GERENTE'
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Value = '1259'
      end>
    object T_loginID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_loginNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 35
    end
    object T_loginFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Origin = 'FUNCAO'
      Required = True
      Size = 18
    end
    object T_loginUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
    end
    object T_loginSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 100
    end
    object T_loginNIVEL: TIntegerField
      FieldName = 'NIVEL'
      Origin = 'NIVEL'
      Required = True
    end
  end
  object T_usuarios: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'select * from t_usuarios where NOME like :NOME order by NOME asc')
    Left = 32
    Top = 80
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Value = '%%'
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 35
    end
    object StringField2: TStringField
      FieldName = 'FUNCAO'
      Origin = 'FUNCAO'
      Required = True
      Size = 18
    end
    object StringField3: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 100
    end
    object IntegerField1: TIntegerField
      FieldName = 'NIVEL'
      Origin = 'NIVEL'
      Required = True
    end
  end
  object T_produtos: TFDQuery
    AutoCalcFields = False
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_produtos ORDER BY PRODUTO ASC')
    Left = 352
    Top = 136
    object T_produtosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_produtosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
      Size = 35
    end
    object T_produtosID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      Required = True
    end
    object T_produtosFORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'FORNECEDOR'
      LookupDataSet = T_fornecedores
      LookupKeyFields = 'ID'
      LookupResultField = 'FORNECEDOR'
      KeyFields = 'ID_FORNECEDOR'
      Size = 35
      Lookup = True
    end
    object T_produtosESTQ_ATUAL: TIntegerField
      FieldName = 'ESTQ_ATUAL'
      Origin = 'ESTQ_ATUAL'
      Required = True
    end
    object T_produtosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 2
    end
    object T_produtosVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
    object T_produtosIMAGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IMAGEM'
      Origin = 'IMAGEM'
      Size = 100
    end
  end
  object T_fornecedores: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_fornecedores ORDER BY FORNECEDOR ASC')
    Left = 352
    Top = 192
    object T_fornecedoresID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_fornecedoresFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
      Size = 35
    end
    object T_fornecedoresEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 60
    end
    object T_fornecedoresTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      Size = 18
    end
  end
  object T_lancamentos: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_lancamentos ORDER BY DATA')
    Left = 432
    Top = 80
    object T_lancamentosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_lancamentosDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
    end
    object T_lancamentosHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Required = True
      Size = 100
    end
    object T_lancamentosVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
    object T_lancamentosTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 1
    end
    object T_lancamentosID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object T_lancamentosUSUARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'USUARIO'
      LookupDataSet = T_usuarios
      LookupKeyFields = 'ID'
      LookupResultField = 'USUARIO'
      KeyFields = 'ID_USUARIO'
      Lookup = True
    end
    object T_lancamentosID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
      Origin = 'ID_CONTA'
      Required = True
    end
    object T_lancamentosCONTA: TStringField
      FieldKind = fkLookup
      FieldName = 'CONTA'
      LookupDataSet = T_contas
      LookupKeyFields = 'ID'
      LookupResultField = 'CONTA'
      KeyFields = 'ID_CONTA'
      Size = 30
      Lookup = True
    end
  end
  object T_contas: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_contas ORDER BY DC DESC,ID ASC')
    Left = 432
    Top = 24
    object T_contasID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_contasCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Required = True
      Size = 30
    end
    object T_contasSALDO: TFloatField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Required = True
    end
    object T_contasDC: TStringField
      FieldName = 'DC'
      Origin = 'DC'
      Required = True
      Size = 1
    end
  end
  object DriverLink_1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\public_html\psi_hotel\Win32\Debug\wwwroot\libmysql.dll'
    Left = 640
    Top = 80
  end
  object query_1: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      '')
    Left = 560
    Top = 24
  end
  object Connection_1: TFDConnection
    Params.Strings = (
      'Database=psi_hotelweb'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 640
    Top = 24
  end
  object T_aptos: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_aptos ORDER BY APTO ASC')
    Left = 192
    Top = 24
    object T_aptosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_aptosAPTO: TStringField
      FieldName = 'APTO'
      Origin = 'APTO'
      Required = True
      Size = 3
    end
    object T_aptosID_TIPO: TIntegerField
      FieldName = 'ID_TIPO'
      Origin = 'ID_TIPO'
      Required = True
    end
    object T_aptosTIPO: TStringField
      FieldKind = fkLookup
      FieldName = 'TIPO'
      LookupDataSet = T_tipos
      LookupKeyFields = 'ID'
      LookupResultField = 'TIPO'
      KeyFields = 'ID_TIPO'
      Size = 18
      Lookup = True
    end
    object T_aptosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object T_aptosID_SITUACAO: TIntegerField
      FieldName = 'ID_SITUACAO'
      Origin = 'ID_SITUACAO'
      Required = True
    end
    object T_aptosSITUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'SITUACAO'
      LookupDataSet = T_situacao
      LookupKeyFields = 'ID'
      LookupResultField = 'SITUACAO'
      KeyFields = 'ID_SITUACAO'
      Size = 18
      Lookup = True
    end
    object T_aptosDIARIA: TStringField
      FieldName = 'DIARIA'
      Origin = 'DIARIA'
      Required = True
      Size = 6
    end
  end
  object T_tipos: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_tipos ORDER BY ID ASC')
    Left = 272
    Top = 24
    object T_tiposID: TFDAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object T_tiposTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 18
    end
  end
  object T_situacao: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_situacao ORDER BY ID ASC')
    Left = 272
    Top = 80
    object T_situacaoID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_situacaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 18
    end
  end
  object T_feriados: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_feriados ORDER BY DATA ASC')
    Left = 272
    Top = 136
    object T_feriadosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_feriadosDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
    end
    object T_feriadosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 30
    end
  end
  object T_tabeladeprecos: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_tabeladeprecos ORDER BY ID_TIPO ASC')
    Left = 192
    Top = 80
    object T_tabeladeprecosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_tabeladeprecosID_TIPO: TIntegerField
      FieldName = 'ID_TIPO'
      Origin = 'ID_TIPO'
      Required = True
    end
    object T_tabeladeprecosTIPO: TStringField
      FieldKind = fkLookup
      FieldName = 'TIPO'
      LookupDataSet = T_tipos
      LookupKeyFields = 'ID'
      LookupResultField = 'TIPO'
      KeyFields = 'ID_TIPO'
      Size = 18
      Lookup = True
    end
    object T_tabeladeprecosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object T_tabeladeprecosTABELA: TStringField
      FieldName = 'TABELA'
      Origin = 'TABELA'
      Required = True
      Size = 1
    end
    object T_tabeladeprecosI_DIA: TIntegerField
      FieldName = 'I_DIA'
      Origin = 'I_DIA'
      Required = True
    end
    object T_tabeladeprecosI_HORA: TTimeField
      FieldName = 'I_HORA'
      Origin = 'I_HORA'
      Required = True
    end
    object T_tabeladeprecosT_DIA: TIntegerField
      FieldName = 'T_DIA'
      Origin = 'T_DIA'
      Required = True
    end
    object T_tabeladeprecosT_HORA: TTimeField
      FieldName = 'T_HORA'
      Origin = 'T_HORA'
      Required = True
    end
    object T_tabeladeprecosHORA: TFloatField
      FieldName = 'HORA'
      Origin = 'HORA'
      Required = True
    end
    object T_tabeladeprecosHORA_EXCED: TFloatField
      FieldName = 'HORA_EXCED'
      Origin = 'HORA_EXCED'
      Required = True
    end
    object T_tabeladeprecosPROMO_2H: TFloatField
      FieldName = 'PROMO_2H'
      Origin = 'PROMO_2H'
      Required = True
    end
    object T_tabeladeprecosPROMO_3H: TFloatField
      FieldName = 'PROMO_3H'
      Origin = 'PROMO_3H'
      Required = True
    end
    object T_tabeladeprecosPERNOITE: TFloatField
      FieldName = 'PERNOITE'
      Origin = 'PERNOITE'
      Required = True
    end
    object T_tabeladeprecosP_ENTRADA: TTimeField
      FieldName = 'P_ENTRADA'
      Origin = 'P_ENTRADA'
      Required = True
    end
    object T_tabeladeprecosP_SAIDA: TTimeField
      FieldName = 'P_SAIDA'
      Origin = 'P_SAIDA'
      Required = True
    end
    object T_tabeladeprecosDIARIA: TFloatField
      FieldName = 'DIARIA'
      Origin = 'DIARIA'
      Required = True
    end
    object T_tabeladeprecosD_ENTRADA: TTimeField
      FieldName = 'D_ENTRADA'
      Origin = 'D_ENTRADA'
      Required = True
    end
    object T_tabeladeprecosD_SAIDA: TTimeField
      FieldName = 'D_SAIDA'
      Origin = 'D_SAIDA'
      Required = True
    end
    object T_tabeladeprecosFloatField24H: TFloatField
      FieldName = '24H'
      Origin = '`24H`'
      Required = True
    end
  end
  object T_diarias: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_diarias ORDER BY ID ASC')
    Left = 112
    Top = 24
    object T_diariasID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_diariasID_APTO: TIntegerField
      FieldName = 'ID_APTO'
      Origin = 'ID_APTO'
      Required = True
    end
    object T_diariasTIPO_LOCACAO: TIntegerField
      FieldName = 'TIPO_LOCACAO'
      Origin = 'TIPO_LOCACAO'
      Required = True
    end
    object T_diariasID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      Origin = 'ID_ENTRADA'
      Required = True
    end
    object T_diariasID_SAIDA: TIntegerField
      FieldName = 'ID_SAIDA'
      Origin = 'ID_SAIDA'
      Required = True
    end
    object T_diariasCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
  object T_entradas: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_entradas ORDER BY ID ASC')
    Left = 112
    Top = 80
    object T_entradasID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_entradasID_DIARIA: TIntegerField
      FieldName = 'ID_DIARIA'
      Origin = 'ID_DIARIA'
      Required = True
    end
    object T_entradasDT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
      Origin = 'DT_ENTRADA'
      Required = True
    end
    object T_entradasHR_ENTRADA: TTimeField
      FieldName = 'HR_ENTRADA'
      Origin = 'HR_ENTRADA'
      Required = True
    end
    object T_entradasRC_ENTRADA: TIntegerField
      FieldName = 'RC_ENTRADA'
      Origin = 'RC_ENTRADA'
      Required = True
    end
    object T_entradasVR_ENTRADA: TFloatField
      FieldName = 'VR_ENTRADA'
      Origin = 'VR_ENTRADA'
      Required = True
    end
  end
  object T_saidas: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_saidas ORDER BY ID ASC')
    Left = 112
    Top = 136
    object T_saidasID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object T_saidasID_DIARIA: TIntegerField
      FieldName = 'ID_DIARIA'
      Origin = 'ID_DIARIA'
      Required = True
    end
    object T_saidasDT_SAIDA: TDateField
      FieldName = 'DT_SAIDA'
      Origin = 'DT_SAIDA'
      Required = True
    end
    object T_saidasHR_SAIDA: TTimeField
      FieldName = 'HR_SAIDA'
      Origin = 'HR_SAIDA'
      Required = True
    end
    object T_saidasRC_SAIDA: TIntegerField
      FieldName = 'RC_SAIDA'
      Origin = 'RC_SAIDA'
      Required = True
    end
    object T_saidasVR_SAIDA: TFloatField
      FieldName = 'VR_SAIDA'
      Origin = 'VR_SAIDA'
      Required = True
    end
  end
  object T_pedidos: TFDQuery
    Connection = Connection_1
    SQL.Strings = (
      'SELECT * FROM t_pedidos ORDER BY DATA ASC')
    Left = 112
    Top = 192
    object T_pedidosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object T_pedidosID_DIARIA: TIntegerField
      FieldName = 'ID_DIARIA'
      Origin = 'ID_DIARIA'
      Required = True
    end
    object T_pedidosDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
      Required = True
    end
    object T_pedidosHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
      Required = True
    end
    object T_pedidosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object T_pedidosQTD: TIntegerField
      FieldName = 'QTD'
      Origin = 'QTD'
      Required = True
    end
    object T_pedidosVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
    end
    object T_pedidosCHV: TStringField
      FieldName = 'CHV'
      Origin = 'CHV'
      Required = True
      Size = 1
    end
  end
end
