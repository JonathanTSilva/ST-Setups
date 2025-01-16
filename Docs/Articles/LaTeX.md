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

Entretanto, essas etapas abaixo mostram como configurar o melhor ambiente TeX, utilizando o Visual Studio Code como editor (supondo que já o tem instalado em sua estação):

1. Instalar a distribuição MikTeX: escolhida pela sua facilidade de instalação e utilização no Windows. Se não fossem essas vantagens, a indicada seria o TeX-Live, pois já fornece consigo o ambiente perl (necessário para a compilação do LaTeX);
2. Como instalamos o MikTeX, também é necessário instalar alguma ferramenta para criar um ambiente de desenvolvimento de perl na máquina. A escolhida, e mais apropriada para este caso é o [Strawberry Perl][9], próprio para Windows, que inclui binários, compiladores, ferramentas, bibliotecas externas e bancos de dados. Baixe o arquivo para sua versão e prossiga com a instalação padrão;
3. Instalar a extensão LaTeX Workshop (Extension ID: `James-Yu.latex-workshop`). Para maiores informações sobre esta extensão, verificar [documentação do projeto][10];
4. Realizar configurações adicionais de acordo com sua preferência:

```json
{
  "latex-workshop.view.pdf.viewer": "external",
  //"latex-workshop.latex.outDir": "PDF",
  "latex-workshop.latex.autoClean.run": "onBuilt",
  "latex-workshop.latex.tools": [
    {
      "name": "latexmk",
      "command": "latexmk",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-pdf",
        "-outdir=%OUTDIR%",
        "%DOC%"
      ],
      "env": {}
    },
    {
      "name": "pdflatex",
      "command": "pdflatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "%DOC%"
      ],
      "env": {}
    },
    {
      "name": "bibtex",
      "command": "bibtex",
      "args": [
        "%DOCFILE%"
      ],
      "env": {}
    }
  ]
}
```

> **Nota:** lembre-se de atualizar o MikTeX e todos os pacotes na primeira utilização.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Linux

Da mesma forma do Windows, o setup de desenvolvimento de um projeto TeX também necessita de dois elementos principais: o editor e a distribuição TeX (responsável pela compilação). No Linux, a distribuição mais indicada é o TeX-Live, que possibilita uma simples instalação e disponibiliza tudo o que é preciso para tal desenvolvimento. Sua instalação pode ser feita com o seguinte comando:

```bash
sudo apt install texlive
```

Entretanto, há alguns pacotes adicionais que carregam mais informações, como o `texlive-latex-base`, `texlive-latex-recommended`, `texlive-latex-extra`, `texlive-full`, entre outros.

**Diferenças entre os pacotes TeX-Live para o Linux:**

> **Nota:** essa discussão foi baseada em uma nova instalação do Debian GNU/Linux. Sendo assim, os processos serão semelhantes para as distribuições *Debian-based*. Para as demais, utilizar dos recursos disponíveis para cada uma.

A tabela abaixo mostra o tamanho dos arquivos que seriam baixados e o espaço em disco adicional que seria usado para cada pacote instalado com o comando `apt install`. Cada tamanho exibido inclui o tamanho do pacote que está sendo instalado e o tamanho de todas as dependências que seriam instaladas junto com ele.

| Pacote                      | Arquivo | Espaço no disco |
| :-------------------------- | :------ | :-------------- |
| `texlive-latex-base`        | 59 MB   | 216 MB          |
| `texlive-latex-recommended` | 74 MB   | 248 MB          |
| `texlive-pictures`          | 83 MB   | 277 MB          |
| `texlive-fonts-recommended` | 83 MB   | 281 MB          |
| `texlive`                   | 98 MB   | 314 MB          |
| `texlive-plain-generic`     | 82 MB   | 261 MB          |
| `texlive-latex-extra`       | 144 MB  | 452 MB          |
| `texlive-full`              | 2804 MB | 5358 MB         |

Para maiores informações e diferenciações entre cada pacote, visite a discussão do **tex.stackexchange**: [Differences between texlive packages in Linux][11].

O editor para este ambiente também é o VSCode (vide seção [1.2. VSCode](#12-vscode) para maiores informações). Entretanto, sinta-se livre para utilizar qualquer outro dentre os já citados.

A título de curiosidade, o editor VIM possui uma extensão para o LaTeX chamado `vim-latex-preview` que possibilita o debug e visualização de PDF no editor. Para mais informações, leia o artigo da Universidade do Texas: [Getting started with LaTeX and Vim][12].

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
[9]: https://strawberryperl.com/
[10]: https://github.com/James-Yu/LaTeX-Workshop/wiki
[11]: https://tex.stackexchange.com/questions/245982/differences-between-texlive-packages-in-linux
[12]: https://web.ma.utexas.edu/users/vandyke/notes/getting_started_latex_vim/getting_started.pdf

<!-- IMAGES -->
