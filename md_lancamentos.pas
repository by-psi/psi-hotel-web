unit md_lancamentos;

interface

uses
  Classes, SysUtils, DateUtils, Data.DB,
  IWAppForm, IWApplication, IWColor, IWTypes, IWCompExtCtrls,
  IWCompListbox, IWCompButton, IWCompEdit, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompLabel, Vcl.Controls, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWHTMLControls,
  IWCompRadioButton, IWCompGrids, IWDBGrids, IWHTMLTag,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxClass, frxDBSet, frxExportBaseDialog, frxExportHTML, frxExportPDF,
  frxExportHelpers, frxExportHTMLDiv, frxGradient;

type
  TF_lancamentos = class(TIWAppForm)
    template_lancamentos: TIWTemplateProcessorHTML;
    bt_buscar: TIWButton;
    bt_incluir: TIWButton;
    bt_editar: TIWButton;
    bt_excluir: TIWButton;
    bt_ok: TIWButton;
    bt_cancelar: TIWButton;
    ed_id: TIWEdit;
    ed_data: TIWEdit;
    ed_historico: TIWEdit;
    ed_valor: TIWEdit;
    dt_inicial: TIWEdit;
    dt_final: TIWEdit;
    ed_buscar: TIWEdit;
    ed_conta: TIWComboBox;
    RadioButton_D: TIWRadioButton;
    RadioButton_C: TIWRadioButton;
    bt_imprimir: TIWButton;
    frx_financeiro: TfrxReport;
    frx_PDF: TfrxPDFExport;
    frx_dbdataset: TfrxDBDataset;
    frxGradientObject1: TfrxGradientObject;
    link_home: TIWLink;
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
    link_usuario: TIWLink;
    link_sair: TIWLink;
    Label_1: TIWLabel;
    Label_2: TIWLabel;
    Label_3: TIWLabel;

    procedure IWAppFormShow(Sender: TObject);
    procedure template_lancamentosUnknownTag(const AName: string;  var VValue: string);

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
    procedure SyncFields();
    procedure UpdateAll();
    procedure dt_inicialHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure dt_finalHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure Search();
    procedure SumAll();

    procedure LoadCombobox();
    procedure ed_contaAsyncEnter(Sender: TObject; EventParams: TStringList);

    procedure bt_incluirAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_editarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_buscarClick(Sender: TObject);
    procedure bt_imprimirAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_okAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_cancelarClick(Sender: TObject);

  public

  end;

var
  v_saldo: double;
  v_dc: string;

implementation

{$R *.dfm}

uses
  ServerController, UserSessionUnit,
  md_login, md_principal, md_aptos, md_feriados, md_tabeladeprecos, md_fornecedores, md_produtos, md_vendas,
  md_usuarios;

procedure TF_lancamentos.IWAppFormShow(Sender: TObject);
begin
  Label_1.Caption := USRNAME;
  UpdateAll;
end;

procedure TF_lancamentos.template_lancamentosUnknownTag(const AName: string;
  var VValue: string);
begin
  if AName = 'GRID_LANCAMENTOS' then
  begin
    with UserSession do
    begin
      T_lancamentos.First;
      while not T_lancamentos.eof do
      begin
        VValue := VValue + '<tr>'+
        '<td>'+T_lancamentos.FieldByName('DATA').AsString+'</td>'+sLineBreak+
        '<td>'+T_lancamentos.FieldByName('CONTA').AsString+'</td>'+sLineBreak+
        '<td>'+T_lancamentos.FieldByName('HISTORICO').AsString+'</td>'+sLineBreak+
        '<td>'+FloatToStrF(T_lancamentos.FieldByName('VALOR').Value,ffCurrency,10,2)+'</td>'+sLineBreak+
        '<td>'+T_lancamentos.FieldByName('TIPO').AsString+'</td>'+sLineBreak+
        '<td>'+
        '<a href="#" class="buttom" onclick="return getItemId('+T_lancamentos.FieldByName('ID').AsString+', ''editar'')"><img src="icons/931.bmp" width="32" alt="EDITAR" title="EDITAR"></a> '+
        '<a href="#" class="buttom" onclick="return getItemId('+T_lancamentos.FieldByName('ID').AsString+', ''excluir'')"><img src="icons/938.bmp" width="32" alt="EXCLUIR" title="EXCLUIR"></a>'+
        '</td>'+sLineBreak+'</tr>';
        T_lancamentos.Next;
      end;
    end;
  end;
end;

procedure TF_lancamentos.m_painelClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_lancamentos.m_apartamentosClick(Sender: TObject);
begin
  TF_aptos.Create(WebApplication).Show;
end;

procedure TF_lancamentos.m_tabeladeprecosClick(Sender: TObject);
begin
  TF_tabeladeprecos.Create(WebApplication).Show;
end;

procedure TF_lancamentos.m_feriadosClick(Sender: TObject);
begin
  TF_feriados.Create(WebApplication).Show;
end;

procedure TF_lancamentos.m_vendasClick(Sender: TObject);
begin
  TF_vendas.Create(WebApplication).Show;
end;

procedure TF_lancamentos.m_estoqueClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_lancamentos.m_produtosClick(Sender: TObject);
begin
  TF_produtos.Create(WebApplication).Show;
end;

procedure TF_lancamentos.m_fornecedoresClick(Sender: TObject);
begin
  TF_fornecedores.Create(WebApplication).Show;
end;

procedure TF_lancamentos.m_comprasClick(Sender: TObject);
begin
{  TF_compras.Create(WebApplication).Show; }
end;

procedure TF_lancamentos.m_financeiroClick(Sender: TObject);
begin
{  separador de linha }
end;

procedure TF_lancamentos.m_planodecontasClick(Sender: TObject);
begin
{  TF_contas.Create(WebApplication).Show; }
end;

procedure TF_lancamentos.m_contasapagarreceberClick(Sender: TObject);
begin
{  TF_contasapagarreceber.Create(WebApplication).Show; }
end;

procedure TF_lancamentos.m_lancamentosClick(Sender: TObject);
begin
  TF_lancamentos.Create(WebApplication).Show;
end;

procedure TF_lancamentos.m_relatoriosClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_lancamentos.m_relatoriodeestoqueClick(Sender: TObject);
begin
{  TF_relatoriodeestoque.Create(WebApplication).Show; }
end;

procedure TF_lancamentos.m_relatoriodevendasClick(Sender: TObject);
begin
{  TF_relatoriodevendas.Create(WebApplication).Show; }
end;

procedure TF_lancamentos.m_relatoriofinanceiroClick(Sender: TObject);
begin
{  TF_relatoriofinanceiro.Create(WebApplication).Show; }
end;

procedure TF_lancamentos.m_lavanderiaClick(Sender: TObject);
begin
{  TF_lavanderia.Create(WebApplication).Show; }
end;

procedure TF_lancamentos.m_usuariosClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_lancamentos.m_suportetecnicoClick(Sender: TObject);
begin
{  TF_suportetecnico.Create(WebApplication).Show; }
end;

procedure TF_lancamentos.m_configuracoesClick(Sender: TObject);
begin
{  TF_configuracoes.Create(WebApplication).Show; }
end;

procedure TF_lancamentos.link_homeClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_lancamentos.link_usuarioClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_lancamentos.link_sairClick(Sender: TObject);
begin
  TF_login.Create(WebApplication).Show;
end;

{ ... }

procedure TF_lancamentos.ClearFields;
begin
  ed_data.Text := DateToStr(Date);
  ed_historico.Text := '';
  ed_valor.Text   := '0,00';
end;

procedure TF_lancamentos.SyncFields;
begin
  with UserSession do
  begin
    T_lancamentos.FieldByName('DATA').AsString := ed_data.Text;
    T_lancamentos.FieldByName('ID_CONTA').Value := Integer(ed_conta.Items.Objects[ed_conta.ItemIndex]); //*** verificar ID da conta
    T_lancamentos.FieldByName('HISTORICO').Value := ed_historico.Text;
    T_lancamentos.FieldByName('VALOR').Value := ed_valor.Text;
    if RadioButton_D.Checked then T_lancamentos.FieldByName('TIPO').Value := 'D';
    if RadioButton_C.Checked then T_lancamentos.FieldByName('TIPO').Value := 'C';
  end;
end;

procedure TF_lancamentos.UpdateAll;
begin
  with UserSession do
  begin
    T_lancamentos.Active := False;
    T_lancamentos.Active := True;
    T_lancamentos.SQL.Clear;
    T_lancamentos.SQL.Add('SELECT * FROM t_lancamentos ORDER BY DATA ');
//  'SELECT L.ID, L.ID_CONTA, C.CONTA, L.DATA, L.HISTORICO, L.VALOR, L.TIPO, L.ID_USUARIO FROM t_lancamentos AS L '+
//  'INNER JOIN t_contas AS C ON L.ID_CONTA = C.ID '+
//  'ORDER BY L.DATA ');
    T_lancamentos.Open();
    SumAll;
  end;
end;

procedure TF_lancamentos.dt_inicialHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('type','date');
end;

procedure TF_lancamentos.dt_finalHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('type','date');
end;

procedure TF_lancamentos.Search;
begin
  with UserSession do
  begin
    T_lancamentos.Active := False;
    T_lancamentos.Active := True;
    T_lancamentos.SQL.Clear;
    T_lancamentos.SQL.Add('SELECT * FROM t_lancamentos WHERE DATA BETWEEN :DT1 AND :DT2 AND HISTORICO LIKE :CHV ORDER BY DATA ');
//  'SELECT L.ID, L.ID_CONTA, C.CONTA, L.DATA, L.HISTORICO, L.VALOR, L.TIPO, L.ID_USUARIO FROM t_lancamentos AS L '+
//  'INNER JOIN t_contas AS C ON L.ID_CONTA = C.ID '+
//  'WHERE L.DATA BETWEEN :DT1 AND :DT2 AND HISTORICO LIKE :CHV '+
//  'ORDER BY L.DATA ');
    T_lancamentos.ParamByName('DT1').AsString := dt_inicial.Text;
    T_lancamentos.ParamByName('DT2').AsString := dt_final.Text;
    T_lancamentos.ParamByName('CHV').Value := '%'+ed_buscar.Text+'%';
    T_lancamentos.Open();
    SumAll;
		if T_lancamentos.IsEmpty then WebApplication.ShowMessage('Lançamentos não encontrados!');
  end;
end;

procedure TF_lancamentos.SumAll;
begin
  v_saldo:= 0; v_dc := 'D';
  with UserSession do
  begin
    T_lancamentos.First;
    while not T_lancamentos.eof do
    begin
      if T_lancamentos.FieldByName('TIPO').value  = 'D' then
      v_saldo := v_saldo + T_lancamentos.FieldByName('VALOR').Value else
      if T_lancamentos.FieldByName('TIPO').value  = 'C' then
      v_saldo := v_saldo - T_lancamentos.FieldByName('VALOR').Value;
      if v_saldo >= 0 then v_dc := 'D' else v_dc := 'C';
      T_lancamentos.Next;
    end;
    Label_2.Caption := FloatToStrF(v_saldo,ffCurrency,10,2);
    Label_3.Caption := v_dc;
    if v_saldo >= 0 then
    begin
      Label_2.Css := 'text-success';
      Label_3.Css := 'text-success';
    end else
    begin
      Label_2.Css := 'text-danger';
      Label_3.Css := 'text-danger';
    end;
  end;
end;

{ ... }

procedure TF_lancamentos.LoadCombobox;
begin
  with UserSession do
  begin
    T_contas.Close;
    T_contas.Active := True;
    ed_conta.Items.Clear;
    while not T_contas.Eof do
    begin
      ed_conta.Items.AddObject(T_contas.FieldByName('CONTA').AsString, TObject(T_contas.FieldByName('ID').AsInteger));
      T_contas.Next;
    end;
  end;
  ed_conta.ItemIndex := 0;
end;

procedure TF_lancamentos.ed_contaAsyncEnter(Sender: TObject;
  EventParams: TStringList);
begin
  LoadCombobox;
end;

{ ... }

procedure TF_lancamentos.bt_incluirAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  LoadCombobox;
  ClearFields;
{ LoadInfo_Conta } // saldo e tipo
  UserSession.T_lancamentos.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
  ed_conta.SetFocus;
end;

procedure TF_lancamentos.bt_editarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  LoadCombobox;
  with UserSession do
  begin
    T_lancamentos.Locate('ID', ed_id.Text, []);
    T_lancamentos.Edit;
    ed_id.Text := T_lancamentos.FieldByName('ID').Value;
    ed_conta.Items[0] := T_lancamentos.FieldByName('CONTA').Value;
    ed_data.Text := T_lancamentos.FieldByName('DATA').AsString;
    ed_historico.Text := T_lancamentos.FieldByName('HISTORICO').Value;
    ed_valor.Text := FloatToStrF(T_lancamentos.FieldByName('VALOR').Value,ffCurrency,10,2);
    if T_lancamentos.FieldByName('TIPO').Value = 'D' then RadioButton_D.Checked := True;
    if T_lancamentos.FieldByName('TIPO').Value = 'C' then RadioButton_C.Checked := True;
  end;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
end;

procedure TF_lancamentos.bt_excluirClick(Sender: TObject);
begin
  with UserSession do
  begin
    T_lancamentos.Locate('ID', ed_id.Text, []);
    T_lancamentos.Delete;
  end;
  UpdateAll;
end;

procedure TF_lancamentos.bt_buscarClick(Sender: TObject);
begin
  Search;
end;

procedure TF_lancamentos.bt_imprimirAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
	objExportfilter : TfrxCustomExportFilter;
begin
	objExportfilter := TfrxCustomExportFilter(frx_PDF);
	objExportfilter.ShowDialog := False;
	objExportfilter.FileName := GetCurrentDir + '\wwwroot\impressos\frx_financeiro.pdf';
  frx_financeiro.Variables['dt_inicial'] := copy(dt_inicial.Text,9,2)+'/'+copy(dt_inicial.Text,6,2)+'/'+copy(dt_inicial.Text,1,4);
  frx_financeiro.Variables['dt_final'] := copy(dt_final.Text,9,2)+'/'+copy(dt_final.Text,6,2)+'/'+copy(dt_final.Text,1,4);
  frx_financeiro.Variables['valor_total'] := FloatToStrF(v_saldo,ffCurrency,10,2);
  frx_financeiro.Variables['dc'] := v_dc;
  frx_financeiro.PrepareReport(True);
  frx_financeiro.Export(objExportfilter);
  WebApplication.CallBackResponse.AddJavaScriptToExecute('window.open("/impressos/frx_financeiro.pdf");');
end;

procedure TF_lancamentos.bt_okAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(ed_historico.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo HISTÓRICO!');
    ed_historico.SetFocus;
    exit;
  end;
  if Trim(ed_valor.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo VALOR!');
    ed_valor.SetFocus;
    exit;
  end;
  SyncFields;
  UserSession.T_lancamentos.Post;
  ClearFields;
  UpdateAll;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
end;

procedure TF_lancamentos.bt_cancelarClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
end;

end.
