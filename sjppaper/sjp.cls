%%ADOPTED FROM PRAMANA - JOURNAL OF PHYSICS - JUNE - 2013
%%
%% Pramana journal class
%%
%% Info
%% The class ias.cls file was the previous class file for pramana journal 
%% for latex 2.09. This has been replaced by the ias2.cls class file which 
%% is rewritten for latex2e using article.cls as the base. 
%% 
%% ias2.cls has been developed by Anjishnu Sarkar.
%% 
%% Even though most of the class file has been written from scratch, it 
%% uses some of the codes from article.cls, elsarticle.cls, pramana.sty
%% files.

%%% ChangeLog %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Version:1.0: Initial build
%% Version:1.1: At the request of Pramana office equations are now indented
%%  4pc from left using the following commands:
%%      \LoadClass[twoside,a4paper,fleqn]{article}
%%      \RequirePackage[fleqn]{amsmath}
%%      \setlength{\mathindent}{4pc}
%% Version:1.2: Couple of more requests from Pramana office has been
%%      implemented.
%% Version:1.3: Further requests from Pramana office:
%% i) Table and Figure caption indented 4pc from left, instead of centered 
%%      orientation
%% ii) Bibliography: 
%%      a) Font size reduced
%%      b) Gap between bibitems reduced
%%      c) Latest natbib [2009/07/16 8.31 (PWD, AO)] support
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sjp}[2010/04/07 1.2 (Pramana Journal class file)]
\typeout{ias2.cls has been developed by Anjishnu Sarkar.}

\newif\if@preprint \@preprinttrue

\DeclareOption{preprint}{\@preprinttrue}
\DeclareOption{jr}{\@preprintfalse}

\DeclareOption{twocolumn}{%
    \PassOptionsToClass{twocolumn}{article}
    \@twocolumntrue
}

% %% Process the options
\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass[twoside,a4paper,fleqn]{article}

%% Packages required
\RequirePackage{times}
\RequirePackage[fleqn]{amsmath}
\RequirePackage[square,comma,sort&compress,numbers]{natbib}%[2007/02/05]

%% Page formatting
\setlength{\oddsidemargin}{45pt}
\setlength{\evensidemargin}{45pt}
\setlength{\textwidth}{5.5in}
\setlength{\textheight}{7.8in}
\setlength{\parindent}{2em}

%% Bibliography settings
\setlength{\bibsep}{0pt}
\let\bibfont\small

\if@preprint
    \@twocolumnfalse
    \def\baselinestretch{1.5}
    \ClassWarning{ias2}{Preprint manuscript;\MessageBreak
        Twocolumn option can be passed with preprint
    }
\else
    \def\baselinestretch{1.20}
    \typeout{Final manuscript}
\fi

\if@twocolumn
    \RequirePackage{cuted}
    \RequirePackage{flushend}
    \AtBeginDocument{\flushend}
\fi

%% Obsolete command
\def\myeqn{\typeout{}\typeout{Command \string\myeqn\space is obsolete; Use
    subequations environment instead.}
    \typeout{}
}

%% Equation formatting
\setlength{\mathindent}{4pc}

%% Reduce space around '=' sign in eqnarray
\setlength{\arraycolsep}{2pt}

%%% Renewcommand for section and the like
%% To put dot after section number, but not after subsection ...
\let\@@seccntformat\@seccntformat
\renewcommand*{\@seccntformat}[1]{%
  \expandafter\ifx\csname @seccntformat@#1\endcsname\relax
    \expandafter\@@seccntformat
  \else
    \expandafter
      \csname @seccntformat@#1\expandafter\endcsname
  \fi
    {#1}%
}
\newcommand*{\@seccntformat@section}[1]{%
  \csname the#1\endcsname.\quad
}
 
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries\boldmath\uppercase}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\itshape}}
%                                      {\normalfont\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\itshape}}
%                                      {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{3}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\itshape}}
%%                                     {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{3}{\z@}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                     {\normalfont\normalsize\itshape}}
%%                                       {\normalfont\normalsize\bfseries}}

\renewcommand\thesubsection{{\rm\thesection.\@arabic\c@subsection}}
\renewcommand\thesubsubsection{{\rm\thesubsection.\@arabic\c@subsubsection}}

%%%% Check the usefulness of this code.
\def\acknowledgments{\section*{Acknowledgments}}

%%%% Headers and footers
\def\pramvolinfo#1{\gdef\@pramvolinfo{#1}}
\def\@pramvolinfo{}
\def\prammonthinfo#1{\gdef\@prammonthinfo{#1}}
\def\@prammonthinfo{}
\def\pramfoota#1{\gdef\@pramfoota{#1}}
\def\@pramfoota{}
\def\prampagespace#1{\gdef\@prampagespace{#1}}
\def\@prampagespace{}
\def\endpage#1{\gdef\@endpage{#1}}
\def\@endpage{}

\def\pramcfoot#1{\gdef\@pramcfoot{#1}}
\def\@pramcfoot{}

\pramcfoot{\ifx\@pramvolinfo\@empty\else
    {\small \emph{\textbf{Student Journal of Physics, 
    \@pramvolinfo \@prammonthinfo }}}
    \fi
}

%% Titlepage headers and footers
\def\ps@titlepage{%
     \let\@oddhead\@empty%
     \let\@evenhead\@empty%
     \def\@oddfoot{\hfill\thepage}%
     \def\@evenfoot{\thepage}%
}

%% Headers and footers
\markboth{}{}

\def\ps@prampagestyle{%
    \def\@oddhead{\begin{tabular*}{\textwidth\hspace{-1.5pt}}%
        {@{\extracolsep\fill}@{}lcr@{}}
                \hspace{4pc} \it\leftmark &&
                \end{tabular*}
    }
    \def\@evenhead{\begin{tabular*}{\textwidth\hspace{-1.5pt}}%
        {@{\extracolsep\fill}@{}lcr@{}}
                \hspace{4pc} \it\rightmark &&
                \end{tabular*}
    }
    \def\@oddfoot{\begin{tabular*}{\textwidth\hspace{-1.5pt}}%
        {@{\extracolsep\fill}lcr@{}}%
                &\@pramcfoot%
                &\thepage% 
                \end{tabular*}
    }
    \def\@evenfoot{\begin{tabular*}{\textwidth\hspace{-1.5pt}}%
        {@{\extracolsep\fill}@{}lcr}%
                \thepage &%
                \@pramcfoot &%
                \end{tabular*}
    }
}

%% Pagestyle implementing headers and footers
\pagestyle{prampagestyle}

%% Logo
\def\abstractsize{\@setsize\abstractsize{7pt}\ixpt\@ixpt
\abovedisplayskip 6\p@ plus2\p@ minus4\p@
\belowdisplayskip \abovedisplayskip}
\def\logofont{\abstractsize}

\def\@pramanalogo{%
    \begin{center}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}rcr}
    {\logofont{\textsc{Student Journal of Physics}}} &     & 
%    \copyright~ Indian Association of Physics Teachers  \\
%    {\logofont {\large OF PHYSICS}} &&  
%    {\logofont {\large OF PHYSICS}} && 
    \end{tabular*}
    \end{center} 
\vspace{20pt}\par
}

%% Manuscript dates
\def\msdatesfont{\abstractsize}
\gdef\@msdates{}
\def\msdates#1{%
{\gdef\@msdates{\par\noindent{\msdatesfont MS %
\hskip0.40em\msdatesfont\ignorespaces #1\vskip12pt\par}}\par}}
\def\@msdates{}

%% Title, author(s), email(s), address(es) etc...
\newcommand\restorefont{\normalsize\normalfont}
\def\@titlefont{\Large\bf}
\def\@authorfont{\restorefont\large\bf}
\def\@addressfont{\restorefont\small}
\def\@emailfont{\restorefont\footnotesize\tt}

\def\@title{}

\def\jmkLabel#1{\@bsphack\protected@write\@auxout{}%
         {\string\Newlabel{#1}{\@currentlabel}}\@esphack}
\def\Newlabel#1#2{\expandafter\xdef\csname X@#1\endcsname{#2}}
\def\jmkRef#1{\@ifundefined{X@#1}{0}{\csname X@#1\endcsname}%
}

\def\email#1{\g@addto@macro\jmkauthors{%
    $^{,}\!$ 
    \footnote{\@emailfont#1}}}

\def\jmkauthors{}
\let\authorsep\@empty
\let\sep\@empty

\def\author{\@@author}

\def\@@author[#1]#2{\g@addto@macro\jmkauthors{%
    \@authorfont
    \def\baselinestretch{1}%
    \authorsep{#2}\unskip\textsuperscript{%#1%
      \@for\@@affmark:=#1\do{%
       \edef\affnum{\@ifundefined{X@\@@affmark}{1}{\jmkRef{\@@affmark}}}%
     \unskip\sep\affnum\let\sep=,}%
      }%
    \def\authorsep{\space,\space\space}%
    \global\let\sep\@empty\global\let\@corref\@empty
    }%
}

\def\jmkaddress{}
\def\addsep{\par\vskip0pt}

\def\address{\@@address}

\def\@alph#1{%
  \ifcase#1\or a\or b\or c\or d\or e\or f\or g\or h\or i\or j\or k\or
  l\or m\or n\or o\or p\or q\or r\or s\or t\or u\or v\or w\or x\or
  y\or z%
  \or aa\or ab\or ac\or ad\or ae\or af\or ag\or ah\or ai\or aj\or
  ak\or al\or am\or an\or ao\or ap\or aq\or ar\or as\or at\or au\or
  av\or aw\or ax\or ay\or az%
  \or ba\or bb\or bc\or bd\or be\or bf\or bg\or bh\or bi\or bj\or
  bk\or bl\or bm\or bn\or bo\or bp\or bq\or br\or bs\or bt\or bu\or
  bv\or bw\or bx\or by\or bz%
  \or ca\or cb\or cc\or cd\or ce\or cf\or cg\or ch\or ci\or cj\or
  ck\or cl\or cm\or cn\or co\or cp\or cq\or cr\or cs\or ct\or cu\or
  cv\or cw\or cx\or cy\or cz%
  \or da\or db\or dc\or dd\or de\or df\or dg\or dh\or di\or dj\or
  dk\or dl\or dm\or dn\or do\or dp\or dq\or dr\or ds\or dt\or du\or
  dv\or dw\or dx\or dy\or dz%
  \or ea\or eb\or ec\or ed\or ee\or ef\or eg\or eh\or ei\or ej\or
  ek\or el\or em\or en\or eo\or ep\or eq\or er\or es\or et\or eu\or
  ev\or ew\or ex\or ey\or ez%
  \or fa\or fb\or fc\or fd\or fe\or ff\or fg\or fh\or fi\or fj\or
  fk\or fl\or fm\or fn\or fo\or fp\or fq\or fr\or fs\or ft\or fu\or
  fv\or fw\or fx\or fy\or fz%
  \or ga\or gb\or gc\or gd\or ge\or gf\or gg\or gh\or gi\or gj\or
  gk\or gl\or gm\or gn\or go\or gp\or gq\or gr\or gs\or gt\or gu\or
  gv\or gw\or gx\or gy\or gz%
  \else\@ctrerr\fi}

\newcounter{affn}
\renewcommand\theaffn{}

\long\def\@@address[#1]#2{\g@addto@macro\jmkaddress{%
    \def\baselinestretch{1}%
     \refstepcounter{affn}
     \xdef\@currentlabel{\theaffn}
     \jmkLabel{#1}%
    \textsuperscript{\theaffn}\@addressfont#2\par}}

%% Abstract
\newbox\@bsbox
\renewenvironment{abstract}{\global\setbox\@bsbox=\vbox\bgroup
    \hsize=\textwidth
    \noindent\unskip
    \small \textbf{Abstract.}
}{\egroup}

%% Keywords and pacs
\def\keywords#1{\def\@keywords{{\small \bfseries Keywords.~} {\small #1}}}
\def\@keywords{}
\def\pacs#1{\def\@pacs{{\small \bfseries PACS Nos.~} {\small #1}}}
\def\@pacs{}

%% Maketitle command
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{titlepage}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\renewcommand{\@maketitle}
{
    \parindent 0pt
    \@input{\jobname.not}
    \@input{jrinf.not}
    \@pramanalogo
    {\@titlefont\@title}\par\vskip 15pt
    \jmkauthors\par %\vskip 10pt
    \jmkaddress\par\vskip 15pt
    \@msdates
    \ifvoid\@bsbox 
    \else
        \unvbox\@bsbox\par\vskip 0.3cm
    \fi
    \noindent\@keywords
%    \vskip 0.35cm%
    \noindent\@pacs
%    \vskip 1cm%
}

%% Widetext environment in twocolumn
\newlength\p@rindent
\setlength\p@rindent{\parindent}
\if@twocolumn
    \newenvironment{widetext}
        {%
            \par
            \vspace{-20pt}
            \begin{strip}
            \rule{\dimexpr(0.5\textwidth-0.5\columnsep-0.4pt)}{0.4pt}%
            \rule{0.4pt}{6pt}
            \par \vspace{6pt}
            \parindent \p@rindent
        }%
        {%
            \par
            \hfill\rule[-6pt]{0.4pt}{6.4pt}%
            \rule{\dimexpr(0.5\textwidth-0.5\columnsep-1pt)}{0.4pt}
            \end{strip}
        }
\else
    \newenvironment{widetext}{}{}
\fi


%% New environment for footnote in tables
\newenvironment{fntable}[1][\columnwidth]
    {% 
        \def\thefootnote{\alph{footnote}}
        \begin{minipage}{#1}
        \centering
    }
    {%
        \vspace{-0.5\skip\footins}
        \renewcommand{\footnoterule}{}
        \end{minipage}
    }
%%%%%%%%%%%%%%%%%%

%% Caption formatting in tables and figures
% \long\def\@makecaption#1#2{%
%   \vskip\abovecaptionskip
%   \sbox\@tempboxa{{\bf #1.} #2}%
%   \ifdim \wd\@tempboxa >\hsize
%   {\bf #1.} #2\par
%   \else
%     \global \@minipagefalse
%     \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%   \fi
%   \vskip\belowcaptionskip%
% }

\newbox\@testboxa
\newbox\@testboxb
\newif\ifoutertab
\global\outertabfalse
\let\@capwidth\columnwidth

\newif\ifinfigure
\infiguretrue

\long\def\@makecaption#1#2{%
    \ifinfigure
        \@figurecaption{#1}{#2}
    \else
        \@tablecaption{#1}{#2}
    \fi
}

\long\def\@figurecaption#1#2{%
\vskip 10pt
\setbox\@testboxa\hbox{\outertabfalse %
\reset@font\small\rm#1\penalty10000\hskip.5em plus.2em\ignorespaces#2%
}%
\setbox\@testboxb\vbox{\hsize\@capwidth
\ifdim\wd\@testboxa<26pc %
%\hbox to\hsize{\hfil\box\@testboxa\hfil}%
\hbox to\hsize{\hskip4pc\box\@testboxa\hfil}%
\else %
\hskip4pc\vbox{
\small
\hsize26pc
\unhbox\@testboxa\par}
\fi
}%
\noindent \leftmargin 4pc
\box\@testboxb
} %

\def\fnum@figure{{\bf \figurename}\penalty10000\hskip0.2em plus .1em\relax{\bf \thefigure.}}

\long\def\@tablecaption#1#2{%
\vskip 10pt
\setbox\@testboxa\hbox{\outertabfalse %
\reset@font\small\rm#1\penalty10000\hskip.5em plus.2em\ignorespaces#2%
}%
\setbox\@testboxb\vbox{\hsize\@capwidth
\ifdim\wd\@testboxa<26pc %
%\hbox to\hsize{\hfil\box\@testboxa\hfil}%
\hskip4pc\vbox{
\small
\hsize26pc
\unbox\@testboxa\par}
%\hbox to\hsize{\noindent\hskip4pc\box\@testboxa\hfil}%
\else %
\hskip4pc\vbox{
\small
\hsize26pc
\unhbox\@testboxa\par}
\fi
}%
\noindent \hskip4pc \box\@testboxb
} %

\def\fnum@table{{\bf \tablename}\penalty10000\hskip.3em plus .1em\relax{\bf \thetable.}}

%%%%%%%%%%%%%%%%%%
%% For blackboard bold numericals
%% Taken from bbold.sty package
\newcommand{\bbfamily}{\fontencoding{U}\fontfamily{bbold}\selectfont}
\newcommand{\textbb}[1]{{\bbfamily#1}}
\DeclareMathAlphabet{\mathbb}{U}{bbold}{m}{n}


%% Re-defining \appendix
\def\appendix{%
 \par

%% Redefining section, subsections

%% For subsections
  \renewcommand{\@@seccntformat}[1]{%
    {\rm Appendix} \csname the##1\endcsname\quad}
  \renewcommand*{\@seccntformat}[1]{%
    \expandafter\ifx\csname @seccntformat@##1\endcsname\relax
    \expandafter\@@seccntformat
  \else
    \expandafter
     \csname @seccntformat@##1\expandafter\endcsname
  \fi
    {##1}%
  }

%% For sections
  \renewcommand*{\@seccntformat@section}[1]{%
    {\rm \bf{Appendix}} \csname the##1\endcsname.\quad
  }
  
  \setcounter{section}\z@
  \setcounter{subsection}\z@
  \setcounter{subsubsection}\z@
  \setcounter{figure}\z@
  \setcounter{table}\z@

  \gdef\thesection{\@Alph\c@section}%
  \gdef\thesubsection{{\rm\Alph{section}.\arabic{subsection}}}%
  \gdef\thesubsubsection{{\rm\thesubsection.\arabic{subsubsection}}}%
  \gdef\thefigure{\@Alph\c@section.\arabic{figure}}%
  \gdef\theHfigure{\@Alph\c@section.\arabic{figure}}%
  \gdef\thetable{\@Alph\c@section.\arabic{table}}%
  \gdef\theHtable{\@Alph\c@section.\arabic{table}}%

  \@addtoreset{equation}{section}%
  \gdef\theequation{\@Alph\c@section.\arabic{equation}}%

  \@ifstar{%
   \def\thesection{\unskip}%
  }{%
  }%
}%

\def\appendixesname{Appendixes}%
\def\appendixname{Appendix}%

%% End page number
\let\origenddocument=\enddocument
\def\enddocument{\clearpage\if@filesw%
  {\addtocounter{page}{-1} \immediate\write\@mainaux%
 {\string\endpage{{\thepage}}}}\fi
\origenddocument}

\endinput
%%
%% End of file `ias2.cls'.
