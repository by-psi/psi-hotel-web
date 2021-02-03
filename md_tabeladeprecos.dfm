object F_tabeladeprecos: TF_tabeladeprecos
  Left = 0
  Top = 0
  Width = 506
  Height = 640
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnShow = IWAppFormShow
  Background.Fixed = False
  LayoutMgr = template_tabeladeprecos
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 2
  DesignTop = 2
  object link_home: TIWLink
    Left = 370
    Top = 84
    Width = 113
    Height = 17
    Css = 'nav-link btn-magnify'
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'link_home'
    OnClick = link_homeClick
    TabOrder = 22
    RawText = False
    Caption = 'VOLTAR AO IN'#205'CIO'
  end
  object bt_incluir: TIWButton
    Left = 168
    Top = 50
    Width = 67
    Height = 25
    Caption = 'INCLUIR'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'bt_incluir'
    TabOrder = 23
    OnAsyncClick = bt_incluirAsyncClick
  end
  object bt_editar: TIWButton
    Left = 240
    Top = 50
    Width = 59
    Height = 25
    Caption = 'EDITAR'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'bt_editar'
    TabOrder = 24
    OnAsyncClick = bt_editarAsyncClick
  end
  object bt_excluir: TIWButton
    Left = 305
    Top = 50
    Width = 61
    Height = 25
    Caption = 'EXCLUIR'
    Confirmation = 'Deseja excluir este item?'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'bt_excluir'
    TabOrder = 25
    OnClick = bt_excluirClick
  end
  object bt_ok: TIWButton
    Left = 372
    Top = 50
    Width = 27
    Height = 25
    Css = 'btn btn-success'
    Caption = 'OK'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'bt_ok'
    TabOrder = 26
    OnAsyncClick = bt_okAsyncClick
  end
  object bt_cancelar: TIWButton
    Left = 405
    Top = 50
    Width = 75
    Height = 25
    Css = 'btn btn-danger'
    Caption = 'CANCELAR'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'bt_cancelar'
    TabOrder = 27
    OnClick = bt_cancelarClick
  end
  object bt_buscar: TIWButton
    Left = 168
    Top = 19
    Width = 67
    Height = 25
    Css = 'btn btn-primary'
    Caption = 'BUSCAR'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'bt_buscar'
    TabOrder = 28
    OnClick = bt_buscarClick
  end
  object bt_imprimir: TIWButton
    Left = 241
    Top = 19
    Width = 26
    Height = 25
    Css = 'btn btn-info'
    Caption = 'P'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'bt_imprimir'
    TabOrder = 29
  end
  object m_painel: TIWLink
    Left = 168
    Top = 81
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_painel'
    OnClick = m_painelClick
    TabOrder = 30
    RawText = False
    Caption = 'PAINEL'
  end
  object m_aptos: TIWLink
    Left = 168
    Top = 105
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_aptos'
    OnClick = m_apartamentosClick
    TabOrder = 31
    RawText = False
    Caption = 'APARTAMENTOS'
  end
  object m_feriados: TIWLink
    Left = 168
    Top = 151
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_feriados'
    OnClick = m_feriadosClick
    TabOrder = 32
    RawText = False
    Caption = 'FERIADOS'
  end
  object m_tabeladeprecos: TIWLink
    Left = 168
    Top = 128
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_lavanderia'
    OnClick = m_tabeladeprecosClick
    TabOrder = 33
    RawText = False
    Caption = 'TABELA DE PRE'#199'OS'
  end
  object m_vendas: TIWLink
    Left = 168
    Top = 174
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_vendas'
    OnClick = m_vendasClick
    TabOrder = 34
    RawText = False
    Caption = 'VENDAS'
  end
  object m_estoque: TIWLink
    Left = 168
    Top = 197
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_estoque'
    OnClick = m_estoqueClick
    TabOrder = 35
    RawText = False
    Caption = 'ESTOQUE'
  end
  object m_produtos: TIWLink
    Left = 205
    Top = 220
    Width = 98
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_produtos'
    OnClick = m_produtosClick
    TabOrder = 36
    RawText = False
    Caption = 'PRODUTOS'
  end
  object m_fornecedores: TIWLink
    Left = 205
    Top = 243
    Width = 98
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_fornecedores'
    OnClick = m_fornecedoresClick
    TabOrder = 37
    RawText = False
    Caption = 'FORNECEDORES'
  end
  object m_compras: TIWLink
    Left = 205
    Top = 266
    Width = 98
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_compras'
    OnClick = m_comprasClick
    TabOrder = 38
    RawText = False
    Caption = 'COMPRAS'
  end
  object m_financeiro: TIWLink
    Left = 168
    Top = 289
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_financeiro'
    OnClick = m_financeiroClick
    TabOrder = 39
    RawText = False
    Caption = 'FINANCEIRO'
  end
  object m_planodecontas: TIWLink
    Left = 205
    Top = 312
    Width = 148
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_vendas'
    OnClick = m_planodecontasClick
    TabOrder = 40
    RawText = False
    Caption = 'PLANO DE CONTAS'
  end
  object m_contasapagarreceber: TIWLink
    Left = 205
    Top = 335
    Width = 148
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_vendas'
    OnClick = m_contasapagarreceberClick
    TabOrder = 41
    RawText = False
    Caption = 'CTAS A PAGAR/RECEBER'
  end
  object m_lancamentos: TIWLink
    Left = 205
    Top = 358
    Width = 148
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_vendas'
    OnClick = m_lancamentosClick
    TabOrder = 42
    RawText = False
    Caption = 'LAN'#199'AMENTOS C/C'
  end
  object m_relatorios: TIWLink
    Left = 168
    Top = 381
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_lavanderia'
    OnClick = m_relatoriosClick
    TabOrder = 43
    RawText = False
    Caption = 'RELAT'#211'RIOS'
  end
  object m_relatoriodeestoque: TIWLink
    Left = 205
    Top = 408
    Width = 98
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_vendas'
    OnClick = m_relatoriodeestoqueClick
    TabOrder = 44
    RawText = False
    Caption = 'RE - ESTOQUE'
  end
  object m_relatoriodevendas: TIWLink
    Left = 205
    Top = 431
    Width = 98
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_vendas'
    OnClick = m_relatoriodevendasClick
    TabOrder = 45
    RawText = False
    Caption = 'RV - VENDAS'
  end
  object m_relatoriofinanceiro: TIWLink
    Left = 205
    Top = 454
    Width = 98
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_vendas'
    OnClick = m_relatoriodevendasClick
    TabOrder = 46
    RawText = False
    Caption = 'RF - FINANCEIRO'
  end
  object m_lavanderia: TIWLink
    Left = 168
    Top = 477
    Width = 217
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_lavanderia'
    OnClick = m_lavanderiaClick
    TabOrder = 47
    RawText = False
    Caption = 'LAVANDERIA (COLETAS/ENTREGAS)'
  end
  object m_usuarios: TIWLink
    Left = 168
    Top = 500
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_usuarios'
    OnClick = m_usuariosClick
    TabOrder = 48
    RawText = False
    Caption = 'USU'#193'RIOS'
  end
  object m_suportetecnico: TIWLink
    Left = 168
    Top = 523
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_usuarios'
    OnClick = m_suportetecnicoClick
    TabOrder = 49
    RawText = False
    Caption = 'SUPORTE T'#201'CNICO'
  end
  object m_configuracoes: TIWLink
    Left = 168
    Top = 546
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_financeiro'
    OnClick = m_configuracoesClick
    TabOrder = 50
    RawText = False
    Caption = 'CONFIGURA'#199#213'ES'
  end
  object m_sair: TIWLink
    Left = 168
    Top = 571
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'm_sair'
    OnClick = link_sairClick
    TabOrder = 51
    RawText = False
    Caption = 'SAIR (LOGOUT)'
  end
  object link_usuario: TIWLink
    Left = 370
    Top = 107
    Width = 73
    Height = 17
    Css = 'dropdown-item'
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'link_usuario'
    OnClick = link_usuarioClick
    TabOrder = 52
    RawText = False
    Caption = 'USU'#193'RIO'
  end
  object link_sair: TIWLink
    Left = 370
    Top = 130
    Width = 73
    Height = 17
    Css = 'dropdown-item'
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'link_sair'
    OnClick = link_sairClick
    TabOrder = 53
    RawText = False
    Caption = 'SAIR'
  end
  object Label_1: TIWLabel
    Left = 370
    Top = 174
    Width = 48
    Height = 16
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'Label_1'
    Caption = 'Label_1'
  end
  object ed_pernoite: TIWEdit
    Left = 16
    Top = 379
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_pernoite'
    SubmitOnAsyncEvent = True
    TabOrder = 15
  end
  object ed_id: TIWEdit
    Left = 16
    Top = 43
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_id'
    SubmitOnAsyncEvent = True
    TabOrder = 4
  end
  object ed_horaexced: TIWEdit
    Left = 16
    Top = 298
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_horaexced'
    SubmitOnAsyncEvent = True
    TabOrder = 12
  end
  object ed_buscar: TIWEdit
    Left = 16
    Top = 16
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_buscar'
    SubmitOnAsyncEvent = True
    TabOrder = 0
  end
  object ed_descricao: TIWEdit
    Left = 16
    Top = 101
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_descricao'
    SubmitOnAsyncEvent = True
    TabOrder = 6
  end
  object ed_hora: TIWEdit
    Left = 16
    Top = 271
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_hora'
    SubmitOnAsyncEvent = True
    TabOrder = 11
  end
  object ed_tipo: TIWComboBox
    Left = 16
    Top = 70
    Width = 121
    Height = 25
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    OnAsyncEnter = ed_tipoAsyncEnter
    TabOrder = 5
    ItemIndex = -1
    FriendlyName = 'ed_tipo'
    NoSelectionText = '-- No Selection --'
  end
  object Tabela_A: TIWRadioButton
    Left = 16
    Top = 128
    Width = 42
    Height = 21
    Caption = ' A'
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    RawText = False
    Checked = True
    Group = 'no group'
    Value = 'D'
    FriendlyName = 'Tabela_A'
    SubmitOnAsyncEvent = True
  end
  object Tabela_B: TIWRadioButton
    Left = 64
    Top = 128
    Width = 42
    Height = 21
    Caption = 'B'
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    RawText = False
    Group = 'no group'
    Value = 'C'
    FriendlyName = 'Tabela_B'
    SubmitOnAsyncEvent = True
  end
  object Tabela_C: TIWRadioButton
    Left = 112
    Top = 128
    Width = 42
    Height = 21
    Caption = 'C'
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    RawText = False
    Group = 'no group'
    Value = 'C'
    FriendlyName = 'Tabela_C'
    SubmitOnAsyncEvent = True
  end
  object ed_p_entrada: TIWEdit
    Left = 16
    Top = 406
    Width = 121
    Height = 21
    OnHTMLTag = ed_p_entradaHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_pernoite'
    SubmitOnAsyncEvent = True
    TabOrder = 16
  end
  object ed_p_saida: TIWEdit
    Left = 16
    Top = 433
    Width = 121
    Height = 21
    OnHTMLTag = ed_p_saidaHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_p_saida'
    SubmitOnAsyncEvent = True
    TabOrder = 17
  end
  object ed_diaria: TIWEdit
    Left = 16
    Top = 460
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_diaria'
    SubmitOnAsyncEvent = True
    TabOrder = 18
  end
  object ed_d_entrada: TIWEdit
    Left = 16
    Top = 487
    Width = 121
    Height = 21
    OnHTMLTag = ed_d_entradaHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_d_entrada'
    SubmitOnAsyncEvent = True
    TabOrder = 19
  end
  object ed_d_saida: TIWEdit
    Left = 16
    Top = 514
    Width = 121
    Height = 21
    OnHTMLTag = ed_d_saidaHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_d_saida'
    SubmitOnAsyncEvent = True
    TabOrder = 20
  end
  object ed_promo2H: TIWEdit
    Left = 16
    Top = 325
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_promo2H'
    SubmitOnAsyncEvent = True
    TabOrder = 13
  end
  object ed_promo3H: TIWEdit
    Left = 16
    Top = 352
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_promo3H'
    SubmitOnAsyncEvent = True
    TabOrder = 14
  end
  object ed_i_hora: TIWEdit
    Left = 16
    Top = 186
    Width = 121
    Height = 21
    OnHTMLTag = ed_i_horaHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_i_hora'
    SubmitOnAsyncEvent = True
    TabOrder = 8
  end
  object ed_t_hora: TIWEdit
    Left = 16
    Top = 244
    Width = 121
    Height = 21
    OnHTMLTag = ed_t_horaHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_t_hora'
    SubmitOnAsyncEvent = True
    TabOrder = 10
  end
  object ed_24H: TIWEdit
    Left = 16
    Top = 541
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'ed_24H'
    SubmitOnAsyncEvent = True
    TabOrder = 21
  end
  object ed_i_dia: TIWComboBox
    Left = 16
    Top = 155
    Width = 121
    Height = 25
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    TabOrder = 7
    ItemIndex = -1
    Items.Strings = (
      'DOMINGO'
      'SEGUNDA'
      'TER'#199'A'
      'QUARTA'
      'QUINTA'
      'SEXTA'
      'S'#193'BADO')
    FriendlyName = 'ed_i_dia'
    NoSelectionText = '-- No Selection --'
  end
  object ed_t_dia: TIWComboBox
    Left = 16
    Top = 213
    Width = 121
    Height = 25
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    TabOrder = 9
    ItemIndex = -1
    Items.Strings = (
      'DOMINGO'
      'SEGUNDA'
      'TER'#199'A'
      'QUARTA'
      'QUINTA'
      'SEXTA'
      'S'#193'BADO')
    FriendlyName = 'ed_tipo'
    NoSelectionText = '-- No Selection --'
  end
  object template_tabeladeprecos: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    OnUnknownTag = template_tabeladeprecosUnknownTag
    RenderStyles = False
    Left = 64
    Top = 584
  end
end
