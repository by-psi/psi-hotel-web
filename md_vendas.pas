unit md_vendas;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompButton, IWCompRadioButton, IWCompListbox,
  IWCompEdit, Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWHTMLControls, IWHTMLTag, IWCompLabel, IWDBStdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frxExportBaseDialog, frxExportPDF, frxGradient;

type
  TF_vendas = class(TIWAppForm)
    template_vendas: TIWTemplateProcessorHTML;
    ed_id: TIWEdit;
    ed_produto: TIWComboBox;
    bt_buscar: TIWButton;
    bt_incluir: TIWButton;
    bt_editar: TIWButton;
    bt_excluir: TIWButton;
    bt_ok: TIWButton;
    bt_cancelar: TIWButton;
    dt_final: TIWEdit;
    bt_imprimir: TIWButton;
    ed_qtd: TIWEdit;
    ed_valorunitario: TIWEdit;
    ed_valortotal: TIWEdit;
    ed_buscar: TIWEdit;
    Label_1: TIWLabel;
    ed_data: TIWEdit;
    ed_estoque: TIWEdit;
    Label_2: TIWLabel;
    dt_inicial: TIWEdit;
    frx_vendas: TfrxReport;
    frx_PDF: TfrxPDFExport;
    frx_dbdataset: TfrxDBDataset;
    frxGradientObject1: TfrxGradientObject;
    bt_fecharvenda: TIWButton;
    m_painel: TIWLink;
    m_aptos: TIWLink;
    m_feriados: TIWLink;
    m_tabeladeprecos: TIWLink;
    m_vendas: TIWLink;
    m_estoque: TIWLink;
    m_produtos: TIWLink;
    m_fornecedores: TIWLink;
    m_compras: TIWLink;
    m_financeiro: TIWLink;
    m_planodecontas: TIWLink;
    m_contasapagarreceber: TIWLink;
    m_lancamentos: TIWLink;
    m_relatorios: TIWLink;
    m_relatoriodeestoque: TIWLink;
    m_relatoriodevendas: TIWLink;
    m_relatoriofinanceiro: TIWLink;
    m_lavanderia: TIWLink;
    m_usuarios: TIWLink;
    m_suportetecnico: TIWLink;
    m_configuracoes: TIWLink;
    m_sair: TIWLink;
    link_home: TIWLink;
    link_usuario: TIWLink;
    link_sair: TIWLink;

    procedure IWAppFormShow(Sender: TObject);
    procedure template_vendasUnknownTag(const AName: string; var VValue: string);

    procedure m_painelClick(Sender: TObject);
    procedure m_apartamentosClick(Sender: TObject);
    procedure m_feriadosClick(Sender: TObject);
    procedure m_tabeladeprecosClick(Sender: TObject);
    procedure m_vendasClick(Sender: TObject);
    procedure m_estoqueClick(Sender: TObject);
    procedure m_produtosClick(Sender: TObject);
    procedure m_fornecedoresClick(Sender: TObject);
    procedure m_comprasClick(Sender: TObject);
    procedure m_financeiroClick(Sender: TObject);
    procedure m_planodecontasClick(Sender: TObject);
    procedure m_contasapagarreceberClick(Sender: TObject);
    procedure m_lancamentosClick(Sender: TObject);
    procedure m_relatoriosClick(Sender: TObject);
    procedure m_relatoriodeestoqueClick(Sender: TObject);
    procedure m_relatoriodevendasClick(Sender: TObject);
    procedure m_relatoriofinanceiroClick(Sender: TObject);
    procedure m_lavanderiaClick(Sender: TObject);
    procedure m_usuariosClick(Sender: TObject);
    procedure m_suportetecnicoClick(Sender: TObject);
    procedure m_configuracoesClick(Sender: TObject);

    procedure link_homeClick(Sender: TObject);
    procedure link_usuarioClick(Sender: TObject);
    procedure link_sairClick(Sender: TObject);

    procedure ClearFields();
    procedure SyncFields_Vendas();
    procedure SyncFields_Itens();
    procedure UpdateAll();
    procedure SumAll();
    procedure dt_inicialHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure dt_finalHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure Search();
    procedure Empty_Itens();

    procedure LoadCombobox();
    procedure ed_produtoAsyncEnter(Sender: TObject; EventParams: TStringList);
    procedure ed_produtoAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure LoadInfo_Produto();
    procedure ed_qtdAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure ed_qtdAsyncExit(Sender: TObject; EventParams: TStringList);
    procedure SumItem();

    procedure bt_incluirAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_buscarClick(Sender: TObject);
    procedure bt_imprimirAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_okClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_fecharvendaClick(Sender: TObject);

  public

  end;

var
  id_produto, id_venda: string;
  valor_un, valor_total, total_vendas: double;
  estq_atual,qtd: integer;

implementation

{$R *.dfm}

uses
  ServerController, UserSessionUnit,
  md_login, md_principal, md_aptos, md_feriados, md_tabeladeprecos, md_produtos, md_fornecedores, md_lancamentos,
  md_usuarios;

procedure TF_vendas.IWAppFormShow(Sender: TObject);
begin
  Label_1.Caption := USRNAME;
  UpdateAll;
end;

procedure TF_vendas.template_vendasUnknownTag(const AName: string; var VValue: string);
begin
  if AName = 'GRID_VENDAS' then
  begin
    with UserSession do
    begin
      T_itensdevenda.First;
      while not T_itensdevenda.eof do
      begin
        VValue := VValue + '<tr>'+
        '<td>'+T_itensdevenda.FieldByName('PRODUTO').AsString+'</td>'+sLineBreak+
        '<td>'+T_itensdevenda.FieldByName('QTD').AsString+'</td>'+sLineBreak+
        '<td>'+FloatToStrF(T_itensdevenda.FieldByName('VALOR_UN').Value,ffCurrency,10,2)+'</td>'+sLineBreak+
        '<td>'+FloatToStrF(T_itensdevenda.FieldByName('VALOR_TOTAL').Value,ffCurrency,10,2)+'</td>'+sLineBreak+
        '<td>'+
        '<a href="#" class="buttom" onclick="return getItemId('+T_itensdevenda.FieldByName('ID').AsString+', ''excluir'')"><img src="icons/938.bmp" width="32" alt="EXCLUIR" title="EXCLUIR"></a>'+
        '</td>'+sLineBreak+'</tr>';
        T_itensdevenda.Next;
      end;
    end;
  end;
end;

procedure TF_vendas.m_painelClick(Sender: TObject);
begin
  if total_vendas = 0 then
  begin
    TF_principal.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Atenção! Finalize ou remova os itens desta Venda.');
  end;
end;

procedure TF_vendas.m_apartamentosClick(Sender: TObject);
begin
  TF_aptos.Create(WebApplication).Show;
end;

procedure TF_vendas.m_tabeladeprecosClick(Sender: TObject);
begin
  TF_tabeladeprecos.Create(WebApplication).Show;
end;

procedure TF_vendas.m_feriadosClick(Sender: TObject);
begin
  TF_feriados.Create(WebApplication).Show;
end;

procedure TF_vendas.m_vendasClick(Sender: TObject);
begin
  TF_vendas.Create(WebApplication).Show;
end;

procedure TF_vendas.m_estoqueClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_vendas.m_produtosClick(Sender: TObject);
begin
  TF_produtos.Create(WebApplication).Show;
end;

procedure TF_vendas.m_fornecedoresClick(Sender: TObject);
begin
  TF_fornecedores.Create(WebApplication).Show;
end;

procedure TF_vendas.m_comprasClick(Sender: TObject);
begin
{  TF_compras.Create(WebApplication).Show; }
end;

procedure TF_vendas.m_financeiroClick(Sender: TObject);
begin
{  separador de linha }
end;

procedure TF_vendas.m_planodecontasClick(Sender: TObject);
begin
{  TF_contas.Create(WebApplication).Show; }
end;

procedure TF_vendas.m_contasapagarreceberClick(Sender: TObject);
begin
{  TF_contasapagarreceber.Create(WebApplication).Show; }
end;

procedure TF_vendas.m_lancamentosClick(Sender: TObject);
begin
  TF_lancamentos.Create(WebApplication).Show;
end;

procedure TF_vendas.m_relatoriosClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_vendas.m_relatoriodeestoqueClick(Sender: TObject);
begin
{  TF_relatoriodeestoque.Create(WebApplication).Show; }
end;

procedure TF_vendas.m_relatoriodevendasClick(Sender: TObject);
begin
{  TF_relatoriodevendas.Create(WebApplication).Show; }
end;

procedure TF_vendas.m_relatoriofinanceiroClick(Sender: TObject);
begin
{  TF_relatoriofinanceiro.Create(WebApplication).Show; }
end;

procedure TF_vendas.m_lavanderiaClick(Sender: TObject);
begin
{  TF_lavanderia.Create(WebApplication).Show; }
end;

procedure TF_vendas.m_usuariosClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_vendas.m_suportetecnicoClick(Sender: TObject);
begin
{  TF_suportetecnico.Create(WebApplication).Show; }
end;

procedure TF_vendas.m_configuracoesClick(Sender: TObject);
begin
{  TF_configuracoes.Create(WebApplication).Show; }
end;

procedure TF_vendas.link_homeClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_vendas.link_usuarioClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_vendas.link_sairClick(Sender: TObject);
begin
  TF_login.Create(WebApplication).Show;
end;

{ ... }

procedure TF_vendas.ClearFields;
begin
  qtd := 1; estq_atual := 0; valor_un := 0; valor_total := 0;
  ed_data.Text := DateToStr(Date);
  ed_produto.ItemIndex := 0;
  ed_qtd.Text := '1';
  ed_valortotal.Text   := '0,00';
end;

procedure TF_vendas.SyncFields_Vendas;
begin
  with UserSession do
  begin
    T_vendas.FieldByName('ID_USUARIO').Value := USR_ID;
    T_vendas.FieldByName('DATA').Value := date;
    T_vendas.FieldByName('VALOR_TOTAL').Value := total_vendas;
    T_vendas.FieldByName('CHV').Value := 'F';
  end;
end;

procedure TF_vendas.SyncFields_Itens;
begin
  with UserSession do
  begin
    T_itensdevenda.FieldByName('ID_VENDA').Value := 0;
    T_itensdevenda.FieldByName('ID_PRODUTO').Value := Integer(ed_produto.Items.Objects[ed_produto.ItemIndex]);
    T_itensdevenda.FieldByName('PRODUTO').Value := ed_produto.Items[0];
    T_itensdevenda.FieldByName('QTD').Value := ed_qtd.Text;
    T_itensdevenda.FieldByName('VALOR_UN').Value := ed_valorunitario.Text;
    T_itensdevenda.FieldByName('VALOR_TOTAL').Value := ed_valortotal.Text;
    T_itensdevenda.FieldByName('ID_USUARIO').Value := USR_ID;
  end;
end;

procedure TF_vendas.UpdateAll;
begin
  with UserSession do
  begin
    T_itensdevenda.Close;
    T_itensdevenda.SQL.Clear;
    T_itensdevenda.SQL.Add('SELECT * FROM t_itensdevenda WHERE ID_VENDA = 0 AND ID_USUARIO = :CHV ');
    T_itensdevenda.ParamByName('CHV').Value := USR_ID;
    T_itensdevenda.Open();
    SumAll;
  end;
end;

procedure TF_vendas.SumAll;
begin
  total_vendas := 0;
  with UserSession do
  begin
    T_itensdevenda.First;
    while not T_itensdevenda.eof do
    begin
      total_vendas := total_vendas + T_itensdevenda.FieldByName('VALOR_TOTAL').Value;
      T_itensdevenda.Next;
    end;
    Label_2.Caption := FloatToStrF(total_vendas,ffCurrency,10,2);
  end;
end;

procedure TF_vendas.dt_inicialHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('type','date');
end;

procedure TF_vendas.dt_finalHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('type','date');
end;

procedure TF_vendas.Search;
begin
  with UserSession do
  begin
    T_itensdevenda.Close;
    T_itensdevenda.SQL.Clear;
    T_itensdevenda.SQL.Add('SELECT * FROM t_itensdevenda WHERE ID_VENDA = 0 AND ID_USUARIO = :CHV ');
//  'WHERE DATA BETWEEN :DT1 AND :DT2 AND HISTORICO LIKE :CHV ORDER BY L.DATA ');
//  T_itensdevenda.ParamByName('DT1').AsString := dt_inicial.Text;
//  T_itensdevenda.ParamByName('DT2').AsString := dt_final.Text;
    T_itensdevenda.ParamByName('CHV').Value := '%'+ed_buscar.Text+'%';
    T_itensdevenda.Open();
    SumAll;
		if T_itensdevenda.IsEmpty then WebApplication.ShowMessage('Lançamentos não encontrados!');
  end;
end;

{ ... }

procedure TF_vendas.LoadCombobox;
begin
  with UserSession do
  begin
    T_produtos.Close;
    T_produtos.Active := True;
    ed_produto.Items.Clear;
    while not T_produtos.Eof do
    begin
      ed_produto.Items.AddObject(T_produtos.FieldByName('PRODUTO').AsString, TObject(T_produtos.FieldByName('ID').AsInteger));
      T_produtos.Next;
    end;
  end;
  ed_produto.ItemIndex := 0;
end;

procedure TF_vendas.ed_produtoAsyncEnter(Sender: TObject;
  EventParams: TStringList);
begin
  LoadCombobox;
end;

procedure TF_vendas.ed_produtoAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
  LoadInfo_Produto;
end;

procedure TF_vendas.LoadInfo_Produto;
begin
  with UserSession do
  begin
    T_produtos.Close;
    T_produtos.SQL.Clear;
    T_produtos.SQL.Add('SELECT * FROM t_produtos WHERE PRODUTO = :CHV ');
    T_produtos.ParamByName('CHV').Value := ed_produto.Text;
    T_produtos.Open();
    if not T_produtos.IsEmpty then
    begin
      id_produto := T_produtos.FieldByName('ID').AsString;
      estq_atual := T_produtos.FieldByName('ESTQ_ATUAL').AsInteger; ed_estoque.Text := IntToStr(estq_atual);
      valor_un   := T_produtos.FieldByName('VALOR').Value; ed_valorunitario.Text := FloatToStr(valor_un);
    end;
  end;
end;

procedure TF_vendas.ed_qtdAsyncChange(Sender: TObject;
  EventParams: TStringList);
var
  i: integer;
begin
  if TryStrToInt(ed_qtd.Text, i) <> True then
  begin
    WebApplication.ShowMessage('Entrada inválida! Digite apenas números.');
    ed_qtd.Text := '1';
    ed_qtd.SetFocus;
  end;

  if estq_atual = 0 then
  begin
    WebApplication.ShowMessage('Produto indisponível no momento. Estoque zerado! (abastecer produto)'); //alerta de estoque zerado
    ed_qtd.Text := '0';
    ed_qtd.SetFocus;
  end;
{
  if estq_atual <= estq_minimo then
  begin
    WebApplication.ShowMessage('Atenção! Estoque mínimo atingido! (abastecer produto)'); //alerta de estoque mínimo atingido
    ed_qtd.Text := '0';
    ed_qtd.SetFocus;
  end;
}
  if StrToInt(ed_qtd.Text) > estq_atual then
  begin
    WebApplication.ShowMessage('Estoque insuficiente!'+#10#13+'Verifique a quantidade ou cancele o pedido.'); // sugerir alterar quantidade ou cancelar.
    ed_qtd.Text := '1';
    ed_qtd.SetFocus;
  end;
end;

procedure TF_vendas.ed_qtdAsyncExit(Sender: TObject; EventParams: TStringList);
begin
  SumItem;
end;

procedure TF_vendas.SumItem;
begin
  qtd := StrToInt(ed_qtd.Text);
  valor_total := qtd * valor_un;
  ed_valortotal.Text := FloatToStr(valor_total);
end;

procedure TF_vendas.Empty_Itens;
begin
  with UserSession do
  begin
    T_itensdevenda.Close;
    T_itensdevenda.SQL.Clear;
    T_itensdevenda.SQL.Add('SELECT * FROM t_itensdevenda WHERE ID_VENDA = 0 AND ID_USUARIO = :ID_USUARIO');
    T_itensdevenda.ParamByName('ID_USUARIO').Value := USR_ID;
    T_itensdevenda.Open();
    if not T_itensdevenda.IsEmpty then
    begin
      T_itensdevenda.Close;
      T_itensdevenda.SQL.Clear;
      T_itensdevenda.SQL.Add('DELETE FROM t_itensdevenda WHERE ID_VENDA = 0 AND ID_USUARIO = :ID_USUARIO');
      T_itensdevenda.ParamByName('ID_USUARIO').Value := USR_ID;
      T_itensdevenda.ExecSQL;
    end;
  end;
end;

{ ... }

procedure TF_vendas.bt_incluirAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  LoadCombobox;
  ClearFields;
  LoadInfo_Produto;
  UserSession.T_itensdevenda.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
  ed_produto.SetFocus;
end;

procedure TF_vendas.bt_excluirClick(Sender: TObject);
begin
  with UserSession do
  begin
    T_itensdevenda.Locate('ID', ed_id.Text, []);
    id_produto := T_itensdevenda.FieldByName('ID_PRODUTO').Value;
    qtd := T_itensdevenda.FieldByName('QTD').Value;

    T_produtos.Close;
    T_produtos.SQL.Clear;
    T_produtos.SQL.Add('SELECT * FROM t_produtos WHERE ID = :ID_PRODUTO ');
    T_produtos.ParamByName('ID_PRODUTO').Value := id_produto;
    T_produtos.Open();

    if not T_produtos.IsEmpty then
    begin
      estq_atual := T_produtos.FieldByName('ESTQ_ATUAL').AsInteger;
    end;

    T_produtos.Close;
    T_produtos.SQL.Clear;
    T_produtos.SQL.Add('UPDATE t_produtos SET ESTQ_ATUAL = :ESTQ_ATUAL WHERE ID = :ID_PRODUTO ');
    T_produtos.ParamByName('ESTQ_ATUAL').Value := estq_atual + qtd;
    T_produtos.ParamByName('ID_PRODUTO').Value := id_produto;
    T_produtos.ExecSQL;

    T_itensdevenda.Delete;
  end;

  UpdateAll;
end;

procedure TF_vendas.bt_fecharvendaClick(Sender: TObject);
var
  s_venda: string;
begin
  if total_vendas > 0 then
  with UserSession do
  begin
    T_vendas.Insert;
    SyncFields_Vendas;
    T_vendas.Post;

    T_vendas.Close;
    T_vendas.SQL.Clear;
    T_vendas.SQL.Add('SELECT * FROM t_vendas ORDER BY ID DESC ');
    T_vendas.Open();

    if not T_vendas.IsEmpty then
    begin
      id_venda := T_vendas.FieldByName('ID').Value;
    end;

    // relaciona itens com ID da venda correspondente

    T_itensdevenda.Close;
    T_itensdevenda.SQL.Clear;
    T_itensdevenda.SQL.Add('UPDATE t_itensdevenda SET ID_VENDA = :ID_VENDA WHERE ID_VENDA = 0 AND ID_USUARIO = :ID_USUARIO');
    T_itensdevenda.ParamByName('ID_VENDA').Value := id_venda;
    T_itensdevenda.ParamByName('ID_USUARIO').Value := USR_ID;
    T_itensdevenda.ExecSQL;

    s_venda := id_venda; while length(s_venda) < 6 do s_venda := '0'+s_venda;

    // lançar venda para a tabela T_lançamentos (receitas)

    T_lancamentos.Close;
    T_lancamentos.SQL.Clear;
    T_lancamentos.SQL.Add('INSERT INTO t_lancamentos (DATA, HISTORICO, VALOR, TIPO, ID_USUARIO, ID_CONTA) VALUES (:DATA, :HISTORICO, :VALOR, :TIPO, :ID_USUARIO, :ID_CONTA) ');
    T_lancamentos.ParamByName('DATA').Value := Date;
    T_lancamentos.ParamByName('HISTORICO').Value := 'VENDA Nº '+s_venda+' - '+USRNAME;
    T_lancamentos.ParamByName('VALOR').Value := total_vendas;
    T_lancamentos.ParamByName('TIPO').Value := 'D';
    T_lancamentos.ParamByName('ID_USUARIO').Value := USR_ID;
    T_lancamentos.ParamByName('ID_CONTA').Value := 1;
    T_lancamentos.ExecSQL;

    total_vendas := 0;
    Label_2.Caption := FloatToStrF(total_vendas,ffCurrency,10,2);

    // libera tabela de itens relacionados com a venda fechada

    Empty_Itens;
    UpdateAll;
    WebApplication.ShowMessage('Venda concluída com sucesso!');
  end else
  begin
    WebApplication.ShowMessage('Adicione itens à Venda.');
  end;
end;

procedure TF_vendas.bt_buscarClick(Sender: TObject);
begin
  Search;
end;

procedure TF_vendas.bt_imprimirAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
	objExportfilter : TfrxCustomExportFilter;
begin
	objExportfilter := TfrxCustomExportFilter(frx_PDF);
	objExportfilter.ShowDialog := False;
	objExportfilter.FileName := GetCurrentDir + '\wwwroot\impressos\frx_vendas.pdf';
  frx_vendas.PrepareReport(True);
  frx_vendas.Export(objExportfilter);
  WebApplication.CallBackResponse.AddJavaScriptToExecute('window.open("/impressos/frx_vendas.pdf");');
end;

procedure TF_vendas.bt_okClick(Sender: TObject);
begin
  SumItem;
  SyncFields_Itens;
  UserSession.T_itensdevenda.Post;
  Label_2.Caption := FloatToStrF(total_vendas,ffCurrency,10,2);

  with UserSession do
  begin
    T_produtos.Close;
    T_produtos.SQL.Clear;
    T_produtos.SQL.Add('UPDATE t_produtos SET ESTQ_ATUAL = :ESTQ_ATUAL WHERE ID = :ID_PRODUTO ');
    T_produtos.ParamByName('ESTQ_ATUAL').Value := estq_atual - StrToInt(ed_qtd.Text);
    T_produtos.ParamByName('ID_PRODUTO').Value := id_produto;
    T_produtos.ExecSQL;
  end;

  ClearFields;
  UpdateAll;
end;

procedure TF_vendas.bt_cancelarClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
end;

end.
