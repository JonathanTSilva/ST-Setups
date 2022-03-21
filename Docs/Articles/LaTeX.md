<!-- LOGO DIREITO -->
<a href="#"><img width="200px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/LaTeX_project_logo_bird.svg/1200px-LaTeX_project_logo_bird.svg.png" align="right" /></a>

# Setup para programação em LaTeX

<p align="left">
  <a href="https://github.com/JonathanTSilva/ST-Setups">
    <img src="https://img.shields.io/static/v1?label=Settings&message=Setups&color=blue&logo=LaTeX&logoColor=white&labelColor=grey&style=flat" alt="ST-Setups">
  </a>
</p>

📑 Um guia de como configurar um ambiente *desktop* para programar em LaTeX.

<!-- SUMÁRIO -->
- [Setup para programação em LaTeX](#setup-para-programação-em-latex)
  - [1. Windows 10](#1-windows-10)
    - [1.1. TexStudio](#11-texstudio)
    - [1.2. VSCode](#12-vscode)
  - [2. Linux](#2-linux)
    - [WSL](#wsl)

> **Nota:** além de todos estes ambientes apresentados neste artigo, vale ressaltar as aplicações WEB que facilitaram muito o desenvolvimento de documentos em LaTeX, como é o caso do [Overleaf][1], [Authorea][2], entre outros.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. Windows 10

Por muito tempo, o Windows foi meu sistema principal para desenvolvimento de projetos em LaTeX, desde documentações pessoais, até apresentações e documentações técnicas organizacionais. Assim, ao longo desta jornada, algumas estratégias foram adotadas visando a melhoria de desempenho e produtividade, sendo estas apresentadas neste presente artigo.

Antes de listar as configurações para os editores de LaTeX, é preciso instalá-lo em sua estação, pois estes editores não trazem consigo alguma distribuição TeX. As duas mais famosas são o [MikTeX][3] e o [TeX-Live][4].

> **Nota:** o link mirror do CTAN para a localização Brasil é o site de Linux mantido pela USP. Caso os links disponibilizados para instalação te redirecionarem para algum erro, copie as rotas de redirecionamento na frente do seguinte endereço: `linorg.usp.br/`, por exemplo: `linorg.usp.br/CTAN/systems/texlive/tlnet/install-tl-windows.exe`, ou apenas reitre o `http://` do link de redirecionamento.

### 1.1. TexStudio

O TeXStudio é um editor de LaTeX de plataforma cruzada e código-fonte aberto. Seus recursos incluem um corretor ortográfico interativo, dobradura de código e realce de sintaxe. Entretanto, não é fornecido com este software, sendo obrigatória a instalação de alguma distribuição TeX, como dito anteriormente.

A sua instalação pode ser realizada pelo seguinte [link][5], e sua instalação realizada normalmente como qualquer outra.

Instalado o software, as seguintes configurações para guardar os arquivos de copilação e saídas em pastas, e abrir o visualizador de PDF externo do seu computador:

- Comandos:
  - PdfLaTeX: `pdflatex.exe -synctex=1 -shell-escape -enable-write18 -interaction=nonstopmode %.tex -aux-directory=Build -output-directory=PDF`
  - External PDF Viewer: `"<dir>" ".\PDF\?m.pdf"`
  - BibTeX: `bibtex.exe Build/% -include-directory=Build`
- Compilar:
  - Caminhos adicionais para busca:
    - Arquivo de Log: `Build`
    - Arquivo de PDF: `PDF`

Além disso, algumas outras configurações e macros foram criadas e podem ser carregadas pelo arquivo de configuração deste software no projeto, disponibilizado em [/Build/TeXStudio][6].

> **Nota:** há outros editores de TeX muito utilizados como o [TeXmaker][7] e o [LyX][8], cujas configurações são semelhantes às do TexStudio, apresentadas nesta seção.

### 1.2. VSCode

Após algum tempo de utilização de editores específicos para TeX, percebi a necessidade de centralizar todo este desenvolvimento no mesmo editor de outras linguagens, visando a redução de memória, espaço, e otimização de tempo entre troca de ambientes. Por essas e outras vantagens, decidi fazer do VSCode o meu editor de TeX principal na estação de trabalho. Apesar disso, o fato de depender de extensões e softwares terceiros para esse setup não agrada muito, ao ter que abrir mão dos diversos recursos próprios para o LaTeX que as outras aplicações específicas apresentam.

Entretanto, estes passos abaixo apresentam como configurar o melhor ambiente TeX, utilizando o Visual Studio Code como editor.

<https://www.youtube.com/watch?v=4lyHIQl4VM8&ab_channel=FedericoTartarini>
<https://github.com/James-Yu/LaTeX-Workshop/wiki/Compile>

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Linux

Differences between texlive packages in Linux: <https://tex.stackexchange.com/questions/245982/differences-between-texlive-packages-in-linux>

### WSL

Embora o WSL seja o sub-sistema de Linux para o Windows, a configuração de um ambiente para a programação em LaTeX aqui é realizada da mesma forma que em um ambiente Linux qualquer. Vale ressaltar que o WSL não é a melhor opção para esta programação, mas caso seja necessário ter um setup deste em uma virtualização, siga os próximos passos para bem prepará-lo:

1. Instalar o LaTeX, com o TeXLive: `sudo apt install texlive`;
   - Se for preciso de alguns pacotes adicionais, as instalações complementares apresentadas no início deste capítulo também podem ser realizadas.
2. Criar o projeto LaTeX: `vim file.tex` ou com o seu editor preferido (como, `code file.tex`);
3. Compilar o arquivo: `latex file.tex` (gerar arquivo .dvi) e `pdflatex file.tex` (gerar o .pdf).

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://www.overleaf.com/
[2]: https://www.authorea.com/
[3]: https://miktex.org/
[4]: https://www.tug.org/texlive/
[5]: https://www.texstudio.org/
[6]: ../../Build/TeXStudio/
[7]: https://www.lyx.org/
[8]: xm1math.net/texmaker/

<!-- IMAGES -->
