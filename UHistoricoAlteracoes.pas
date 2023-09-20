unit UHistoricoAlteracoes;

interface

///  Este arquivo armazena o histórico das alterações
///  realizadas no programa Conferencia Paletizada,
///  dessa forma no código do programa podemos apenas
///  referenciar o número da alteração ou versão.
implementation
///  ///////////////////////////////////////
///
///  Versão:       1.0.0.0
///  Data:         21/11/2017
///  Programador:  Marcos Pereira
///  CR:            (Melhoria do dia  //)
///  Solicitação:  Felipe Viana
///
///  --
///
///  Solução
///    Interface:
///      - Já na abertura do programa o grid 'grdOcorrencias', é preenchido com uma lista
///        de ocorrências pendentes de tratamento e quando isso não ocorre é porque não
///        existem pendencias naquele momento, mas por isso existe o botão 'Atualizar', para
///        que ao receber um click faça uma nova consulta por ocorrências e preenchimento do
///        grid com as que forem encontradas;
///      - Ao clicarmos no grid sobre algum registro duas vezes é apresentada a tela com
///        mais informações sobre a ocorrência e com espaço para preenchimento do endereço
///        da OS, para liberação da ocorrência da mesma;
///      - Na aba 'Finaliza ocorrência', basta digitar o número do endereço apresentado nos
///        labels e rpessionar a tecla <enter> ou o botão 'Autorizar', para validar o endere-
///        ço e autorizar a ocorrência, dando certo essa ação é apresentada automáricamente a
///        aba 'Ocorrências' senão o foco continua na caixa que solicita o endereço, após uma
///        mensagem ser apresentada;
///      - Para retornar da aba 'Finaliza ocorrência' para a aba 'Ocorrências' a qualquer
///        momento basta pressionar o botão 'Cancelar'.
///    Controle:
///      - A função 'ProcuraOcorrencias()', executa a query 'qryOcorrencias' e cds
///        'cdsOcorrencias', para a pesquisa por ocorrências;
///      - A função 'LiberaOcorrencia', executa a query 'qryLiberaOcorrencia', recebendo e
///        passando para a query os parâmetros 'AnumOS', 'ACodigoUMA' e 'AMatricula', que re-
///        cebem respectivamente o número da OS o ´codigo da UMA e a matrícula do funcionário
///        que está logado no programa;
///      - No evento 'onShow' do formulário 'Principal', o componente pcTelaPrincipal é con-
///        figurado para apresentar apenas a aba 'tab_ListadeOcorrencias' e a função
///        'ProcuraOcorrencias' é executadas, para que já na avbertura seja trazida a lista
///        de ocorrências que precisam ser tratadas;
///      - No evento 'onClick' do botão 'btnAtualiza', a função 'ProcuraOcorrencias' é exe-
///        cutada;
///      - No evento 'onDblClick', do grid 'grdOcorrencias', o componente 'pcTelaPrincipal'
///        é configurado para apresentar a aba 'tab_FinalizaOcorrencia' e preenche os labels
///        dessa aba com os valores do registro de ocorrência que recebeu o clique duplo no
///        grid. É também nesse evento que as variáveis globais 'OSAtual', 'UMAAtual' e
///        'CodEndereco' são preenchidas com os valores do registro da ocorrência;
///      - O evento 'onClick', do botão 'btnAutorizar' executa a action
///        'actAutorizaLiberacaoExecute';
///      - O evento 'onKeyPress' da caixa 'edtEndereco', verifica se a tecla <enter> foi
///        pressionada e se a caixa não está vazia para então executar a action
///        'actAutorizaLiberacaoExecute';
///      - A action 'actAutorizaLiberacaoExecute' verifica se o endereço digitado na caixa
///        'edtEndereco' é igual ao endereço do registro da ocorrência selecionada, que está
///        na variável global 'CodEndereco', porque se for executa a função 'LiberaOcorrencia',
///        passando como parâmetros os valores das variáveis globais 'OSAtual' e 'UMAAtual',
///        além da matrícula do usuário logado que está no objeto Usuario.Matricula. Depois
///        se aresposta da função for true, configura o componente 'pcTelaPrincipal' para
///        apresentar de volta a aba 'tab_ListadeOcorrencias' e ainda executa a função
///        'ProcuraOcorrencias', para então atualizar o grid, não apresentando mais a ocor-
///        rência que foi liberada. CAso exista uma falha na função 'LiberaOcorrencia' e o
///        retorno dela seja 'false', apresenta uma mensagem falando sobre a falha e coloca
///        o foco na caixa 'edtEndereco' e se o endereço digitado não for igual ao da variá-
///        vel 'CodEndereco', manda uma menssagem avidando que o endereço está errado, limpa
///        a caixa 'edtEndereco' e volta o foco para ela;
///      - No evento 'onClick' do botão 'btnCancelar', o componente 'pcTelaPrincipal' é con-
///        figurado para aparesentar apenas a aba 'tab_ListadeOcorrencias' novamente;
///    Dados:
///      - A query 'qryOcorrencias', foi criada para procurar por cocorrências no abastecimento
///        e recebimento com convocação ativa, na tabela 'booscompendencia', fazendo um relacio-
///        namento com as tabelas 'pcmovendpend' (mais dados da OS com ocorrência), 'pcendereco'
///        (o endereço completo da OS, com base no código encontrado na pcmovendpend) e 'pcempr'
///        (o nome completo do funcionário que lançou a OS na pendência). A query segue algumas
///        regras para trazer o endreço da OS, porque a mesma pode possuir dois endereços ou
///        apenas um que pode estar em colunas diferentes, por isso se a OS for de recebimento
///        movimentação vertical (tipo 98) pega o endereço da coluna 'codendereco', da tabela
///        'pcmovendpend', porque não interessa o endereço de origem sempre será destino,
///        se for de recebimento movimentação horizontal (tipo 97) não existe inserção de
///        ocorrência, por isso não há validação, se for abastecimento movimentação vertical
///        (tipo 61) pega o campo 'codenderecoorig', da tabela 'pcmovendpend', que é o ende-
///        reço de origem do abastecimento e se for abastecimento movimentação horizontal
///        (tipo 58), na validação não perguntamos o tipo, porque é a única condição que so-
///        brou, mas verificamos se a OS não foi iniciada, porque nesse caso o endereço é
///        o de origem do abastecimento 'codenderecoorig', se já foi iniciada o erro foi no
///        destino do abastecimento 'codendereco';
///      - A query 'qryLiberaOcorrencia', grava a data do sistema atual e a matrícula do
///        usuário que  está logado no programa no registro de ocorrência de um OS de uma
///        UMA específicas;
///
///  ///////////////////////////////////////
///
///  Versão:       1.0.0.1
///  Data:         26/03/2018
///  Programador:  Mayara Raphael
///  CR: 2158   07/03/2018
///  Solicitação:  Felipe Viana
///
///  -- Felipe Viana - 07/03/2018 15:50
///     Com base no chamado 75984, precisamos que sejam inseridas algumas colunas na
///     rotina 9026, sendo elas:  Data da onda e número da onda
///     Além disso, foi observado que se uma OS foi lançada várias vezes na pendência,
///     quando liberado a última vez que está lá,  a data de liberação da última é repetida
///     para todas as outras movimentações. Provavelmente deverá ser utilizado mais um AND
///     para encontrar a linha correta para atualização desta data.
///
///  Solução
///    Interface:
///      - No grid na tela frmPrincipal aba Ocorrências incluídos os campos: Num. Onda,
///        Num. Ordem e Data Onda.
///
///    Dados:
///      - Na query qryOcorrencias incluído um left join com a tabela bodefineondai para
///        buscar os campos numonda, numordem, data.
///      - Na query qryLiberaOcorrencia incluído mais um and no update, além de buscar a
///        pendência por numos e codigouma, agora se alterada a data de liberação se o campo
///        estiver null -  and dataliberacao is null. 
///
end.
