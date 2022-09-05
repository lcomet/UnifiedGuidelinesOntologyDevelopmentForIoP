%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Classe de rapport pédagogique
%% v4.2.8 - 07/05/2021
%%
%% Vincent Labatut 2014-21 <vincent.labatut@univ-avignon.fr>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Updates to this file to adapt it to our current guideline version
%% Lina Teresa Molinas Comet September 2022<linamolinascomet@protonmail.com>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% init class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{guideline/sty/rapport}[Report LaTeX class]
\LoadClass[a4paper, 11pt, final]{article}	% based on the existing latex class


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% encoding and stuff
\RequirePackage[english]{babel}		% language package
%\frenchsetup{AutoSpacePunctuation=false}	% disable space insertion before colon (doesn't work)
%	\RequirePackage{polyglossia}			% alternative to babel for LuaLaTeX
%	\setmainlanguage{french}
%\RequirePackage[T1]{fontenc}				% select font encoding and allow hyphenation
\RequirePackage{fontspec}
%\RequirePackage{luatextra}				    % same, but for LuaLaTex instead of PDFlatex
%    \defaultfontfeatures{Ligatures=TeX}     % for ligatures in LuaLaTex (may slow down the compilation)
%\RequirePackage[utf8]{inputenc}			% use source file containing diacritics (not necessary for LuaLaTeX or XeLaTeX)
\RequirePackage{soul}						% improves hyphenation


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% font settings
\RequirePackage{luatexbase}                 % solves problem between LuaLaTeX, TexLive 2018 and microtype
\RequirePackage[
	babel=true
%	kerning=true							% option conflicts with LuaLaTeX
]{microtype}					        	% typographical refinements
\RequirePackage{lmodern}					% uses better fonts (?)
\setsansfont{Gilroy}[                       % set up custom font
    Extension = .otf,
    Path = guideline/fonts/,
    UprightFont = *-Light,
    BoldFont = *-SemiBold,
    ItalicFont = *-LightItalic,
    BoldItalicFont = *-SemiBoldItalic,
    FontFace={k}{n}{*-Bold},
    FontFace={k}{it}{*-BoldItalic}
]
\newcommand{\textbbf}[1]{%                  % command to insert bolder text
    {\fontseries{k}\selectfont{}#1}}
\renewcommand{\familydefault}{\sfdefault}	% use the sans-serif font
\def\mathfamilydefault{\rmdefault}          % but keep the serif font for formulas
\RequirePackage{xspace}						% add missing spaces
\RequirePackage{icomma}						% no space inserted after commas in expressions such as 1,23 (French)
\RequirePackage{eurosym}					% euro symbol (€)
\RequirePackage{textcomp}					% degree character (°)
\RequirePackage{pifont}                     % dingbat characters
\newcommand{\cmark}{\ding{51}}              % command for check mark
\newcommand{\xmark}{\ding{55}}              % command for matching cross mark
\RequirePackage{relsize}                    % define relative font sizes

\usepackage{verbatim}
\usepackage[printonlyused]{acronym}

\RequirePackage[toc,page]{appendix}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% middle dot
%%%%\newcommand{\tpc}{\textperiodcentered}      % original middle dot command
%%%%\newcommand{\tpc}{$\cdot$}                  % middle dot command
%%%\RequirePackage{fontspec}                   % this solution is more robust
%%%\RequirePackage{polyglossia}               % but much slower when compiling
%%%\setmainlanguage{french}                   % we don't really need polyglossia, apparently
%\RequirePackage{newunicodechar}
%%%\newunicodechar{·}{\makebox[0.27em]{·}}
%\newunicodechar{·}{\ensuremath{{\cdot}}}   % possibly unnecessary with appropriate font


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% needed for UAPV title page formating
\RequirePackage{graphicx}					% improves \includegraphics
\sodef\ugg{}{.4em plus 1fill}{1em plus 2 fill}{2em plus 2fill minus.1em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% space-related settings
\RequirePackage[top=2.5cm, 
	bottom=2.5cm, 
    left=2.5cm, 
    right=2.5cm]{geometry}					% changes document margins
\RequirePackage{setspace}	
% controls spacing between lines


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% misc
\RequirePackage[french]{varioref} 			% improves cross-refs
\RequirePackage{lipsum}						% inserts filler text
\RequirePackage{xifthen}					% if/then expressions
\RequirePackage{printlen}					% displays lengths
\RequirePackage{xstring}					% handles strings functions
\RequirePackage{titling}					% better control over the title
\RequirePackage{authoraftertitle}			% accesses title and author names
\RequirePackage{datetime}					% custom date format
\RequirePackage{etoolbox}					% test if a macro value is empty
\RequirePackage{multicol}                   % switch to 2 columns
\RequirePackage{footmisc}                   % additional footnote features


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% header/footer settings
\RequirePackage{lastpage}					% computes the number of pages
\RequirePackage{fancyhdr}					% changes headers and setters
\setlength{\headheight}{14pt}				% increases header size
\newcommand{\setHeaders}{					% macro initializing the headers and footers
	\pagestyle{fancy}
	\fancyhf{}
	\chead{\textcolor{black}{\MyTitle} \ifdefined\MySubtitle -- \MySubtitle \else \fi}
	\cfoot{\textcolor{black}{\thepage\ / \pageref*{LastPage}}}
%	\renewcommand{\headrulewidth}{0.4pt}
%	\renewcommand{\footrulewidth}{0.4pt}
	\renewcommand\headrule{					% color and thickness of the header rule
    	{\color{black}\hrule width \hsize}}
	\renewcommand\footrule{					% color and thickness of the header rule
    	{\color{black}\hrule width \hsize} \kern 1mm}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% color settings
\RequirePackage{luacolor}                       % prevent color changes at page breaks
%\let\normalcolor\relax						    % prevent automatic restoration to black >> but also sometimes causes table text to be completely colored
\RequirePackage[table]{xcolor}				    % define custom colors
%\definecolor{fgRed}{RGB}{233,82,70}% headers and hyperlinks
\definecolor{indigo(dye)}{rgb}{0.0, 0.25, 0.42}
\definecolor{cobalt}{rgb}{0.0, 0.28, 0.67}
\definecolor{blue(ncs)}{rgb}{0.0, 0.53, 0.74}
\definecolor{darkcyan}{rgb}{0.0, 0.55, 0.55}
\definecolor{darkmidnightblue}{rgb}{0.0, 0.2, 0.4}
\definecolor{oceanboatblue}{rgb}{0.0, 0.47, 0.75}
\definecolor{lightblue}{rgb}{0.68, 0.85, 0.9}
\definecolor{unitednationsblue}{rgb}{0.36, 0.57, 0.9}
\definecolor{steelblue}{rgb}{0.27, 0.51, 0.71}
\definecolor{mediumtealblue}{rgb}{0.0, 0.33, 0.71}
\definecolor{shamrockgreen}{rgb}{0.0, 0.62, 0.38}
\definecolor{fgYellow}{RGB}{250,165,25}
\definecolor{fgDeepRed}{RGB}{238,42,36}
\definecolor{fgLightYellow}{RGB}{229,208,66}
\definecolor{bgLightGray}{RGB}{235,235,235}     % pseudocode background
%
\definecolor{LightGrey}{rgb}{0.96,0.96,0.96}    % title page
\definecolor{DarkGrey}{rgb}{0.83,0.83,0.83}
\definecolor{BaseColor}{rgb}{0.64,0.69,0.31}
\definecolor{tropicalrainforest}{rgb}{0.0, 0.46, 0.37}
\colorlet{darktropicalrainforest}{tropicalrainforest!110}
\definecolor{arsenic}{rgb}{0.23, 0.27, 0.29}
\definecolor{phthalogreen}{rgb}{0.07, 0.21, 0.14}
\definecolor{bananamania}{rgb}{0.98, 0.91, 0.71}
\definecolor{junglegreen}{rgb}{0.16, 0.67, 0.53}
\definecolor{pastelred}{rgb}{1.0, 0.41, 0.38}
\definecolor{sapphire}{rgb}{0.03, 0.15, 0.4}
\definecolor{magicmint}{rgb}{0.67, 0.94, 0.82}
\definecolor{etonblue}{rgb}{0.59, 0.78, 0.64}

\definecolor{cadetblue}{rgb}{0.37, 0.62, 0.63}
\definecolor{officegreen}{rgb}{0.0, 0.5, 0.0}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% watermark settings
\RequirePackage{draftwatermark}				% watermark
\SetWatermarkText{ }
\SetWatermarkScale{1}
\SetWatermarkLightness{0.95}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% diagram settings
\RequirePackage{pgf}
\RequirePackage{tikz}						% programmatically defines drawings
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.14}                   % supposed to be 1.15 (apparently not installed on Overleaf)
\usetikzlibrary{arrows}						% configures arrow tips
\usetikzlibrary{arrows.meta}				% necessary to draw graphs
\tikzset{>=latex}							% uses larger default arrow tips
\usetikzlibrary{calc}						% extended coordinate calculation
\usetikzlibrary{decorations.markings}		% improved decorations
\usetikzlibrary{math}						% use mathematical functions
\usetikzlibrary{positioning} 				% ease relative positioning

\RequirePackage{pdflscape}
\RequirePackage{rotating}
\RequirePackage{pdfpages}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hyperlinks settings
\RequirePackage[
	bookmarks=true, bookmarksnumbered=true, bookmarksopen=true,
	unicode=true, colorlinks=true, linktoc=all, %linktoc=page
	linkcolor=indigo(dye), citecolor=cobalt, filecolor=steelblue, urlcolor=cobalt,
	pdfstartview=FitH, 
	%pdfkeywords={Modèle de rapport AU/CERI v4.2.8},
    pdfencoding=auto    % avoid encoding problems in PDF bookmarks (French)
]{hyperref}									% enables hyperlinks
\RequirePackage{url}						% properly displays urls
% deals with problem in PDF properties
\makeatletter
\pdfstringdefDisableCommands{%
  \def\\{}%
  \def\hbox{}%
  \def\mathsurround{}%
  \def\z@{0}%
  \def\@@underline{}%
  \def\textsuperscript#1{}%
  \def\texttt#1{<#1>}%
}
\makeatother
% check this: https://tex.stackexchange.com/questions/306988/automatically-add-texorpdfstring-for-math-mode-in-section-titles


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% table settings
\RequirePackage{longtable}
\RequirePackage{multirow}						% cells spanning several rows
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}	% thicker line for the tables
\RequirePackage{tabularx} 						% for larger tables
\newcolumntype{L}{>{$}l<{$}}                    % math-mode version of "l" column type (tabularx)
\newcolumntype{R}{>{$}r<{$}}                    % math-mode version of "r" column type (tabularx)
\RequirePackage{array}							% extends table and array functions
% Macro by A. Kassi 							% don't remember what this is for...
% http://www.ukonline.be/programmation/latex/tutoriel/chapitre4/page2.php
\makeatletter
	\def\hlinewd#1{
	\noalign{\ifnum0=`}\fi\hrule \@height #1
	\futurelet\reserved@a\@xhline}
\makeatother
% end macro
\RequirePackage{csvsimple}						% populates table with file content



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mathematical settings
\RequirePackage{amsmath}						% extended mathematical functions
\RequirePackage{amsthm}							% even more advanced math functions
\RequirePackage{amssymb}  						% additional math symbols
\RequirePackage{shadethm}                       % for background color
\colorlet{shadethmcolor}{lightblue}
\newtheorem{theorem}{Theorem}					% those are not really needed here, but whatever
\newshadetheorem{lemma}[theorem]{Lemma}
\newshadetheorem{proposition}[theorem]{Proposition}
\newshadetheorem{corollary}[theorem]{Corollary}
\newshadetheorem{fact}[theorem]{Fact}
\newshadetheorem{Hypothesis}[theorem]{Hypothesis}
\newshadetheorem{remark}[theorem]{Remark}
\newshadetheorem{definition}[theorem]{Definition}
\newcommand{\sqdiamond}[1][fill=black]{\tikz [x=1.2ex,y=1.85ex,line width=.1ex,line join=round, yshift=-0.285ex] \draw  [#1]  (0,.5) -- (.5,1) -- (1,.5) -- (.5,0) -- (0,.5) -- cycle;}%


\RequirePackage[framemethod=tikz]{mdframed}



% define environment for Examples
\newtheorem{SampleEnv}{Example}[section]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bibliographic settings
%\RequirePackage[numbers]{natbib}		% incompatible with biblatex
\RequirePackage{doi}					% displays DOIs in the bibliography
\RequirePackage[autostyle]{csquotes}	% don't remember why I put this
\RequirePackage[
	maxcitenames=2,						% two authors max in the text (only for author-year)
	maxbibnames=99,						% list all authors in the reference list
	style=numeric,						% numeric style for reference list
	citestyle=numeric-comp,				% numeric style for citations
%	style=authoryear,					% NOTE: if you want the author-year style instead,
%	citestyle=authoryear-comp,			% uncomment these 2 lines and comment both ones above
%	backref=true,						% includes a page backlink in the reference list
%	dashed=false,						% displays all author names (only for authoryear)
    datamodel=guideline/sty/hal_id,          % prints custom hal-id fields
    backend=biber                       % uses biber to compile (instead of bibtex)
]
{biblatex}								% uses biblatex (instead of bibtex)
%\renewcommand*{\bibfont}				% changes font size for biblio
%		{\footnotesize} 				
\newcommand{\bibName}{Bibliography}	% define bibliography header
\AtEveryCite{\restorecommand\mkbibnamefamily}	% avoid small caps in citations (French)
\setlength\bibitemsep{0.9\itemsep}		% reduce space between bibliographic items
% command to insert the bibliography
	\newcommand{\MyBibliography}{					% receives the bibtex file
		\newpage
		\phantomsection
		\addcontentsline{toc}{section}{\bibName}	% add the bibliography in the TOC
		{	\setstretch{0.8}
       		\printbibliography
		}
		\thispagestyle{fancy}						% force header/footer
	}
% specific commands for HAL ids
\DeclareFieldFormat{hal}{%
    \ifhyperref
    {$\langle$\href{https://hal.archives-ouvertes.fr/#1}{\nolinkurl{#1}}$\rangle$}
    {$\langle$\nolinkurl{#1}$rlangle$}
}
\DeclareFieldAlias{eprint:hal}{hal}
\DeclareFieldAlias{eprint:HAL}{eprint:hal}
\renewbibmacro*{eprint}{%
    \printfield{hal}%
    \newunit\newblock
    \iffieldundef{eprinttype}
    {\printfield{eprint}}
    {\printfield[eprint:\strfield{eprinttype}]{eprint}}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% caption settings
\RequirePackage{caption}					% caption customization
\captionsetup{
	labelfont={color=cobalt, bf, small},	% font(sf), color, bold, size of the caption label
	textfont={small},						% font(sf) and size of the caption text itself
	labelsep=period,						% separator between label and text
	margin=10mm								% left/right margins
}
\DeclareCaptionType{fileText}[Fichier][Liste de fichiers]
\DeclareCaptionType{consoleText}[Console][Liste de sorties console]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom floats
\RequirePackage{subcaption}                 % handles subfloats
\RequirePackage{float}	 					% custom floats environments
%\RequirePackage{tocloft}	 				% list of custom float objects
% prevents vertical centering when only floats on the last page
\makeatletter
\setlength{\@fptop}{0pt}    
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom equations
\makeatletter								% change equation numbers
\def\tagform@#1{\maketag@@@{(\color{cobalt}\textbbf{#1}\normalcolor)\@@italiccorr}}
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom algorithms
\RequirePackage[							% environment for pseudo code
    %french,									% language in the caption (default: English)
    ruled,									% boxed, ruled (shaded in v5.3)
    linesnumbered,							% add line numbers
    longend,								% block-specific end keyword
    procnumbered							% functions/procedures must be numbered
]{guideline/sty/algorithm2e}							% Overleaf does not have the latest version installed
\SetAlCapFnt{\color{mediumtealblue}}				% change caption font (in algorithm floats)
\SetProcFnt{\color{mediumtealblue}}				% change caption font (in function/procedure floats)
% keep the caption below 
% (see https://tex.stackexchange.com/questions/27671/algorithm2e-with-ruled-but-with-caption-underneath)
% and also shaded background
% (see https://tex.stackexchange.com/questions/375669/apply-background-color-in-algorithm2e-but-not-on-the-caption)
\makeatletter                       
\newenvironment{algorithm2e}[1][htpb]
{   \def\@algocf@pre@ruled{%
        \setlength{\OuterFrameSep}{0pt}
	    \setlength{\FrameSep}{1mm}
    	\colorlet{shadecolor}{bgLightGray}
        \begin{shaded}}%
    \def\@algocf@post@ruled{\end{shaded}\relax}%   % without horizontal separator
%    \def\@algocf@post@ruled{\end{shaded}\kern\interspacealgoruled\hrule  height\algoheightrule\kern3pt\relax}%           	% with horizontal separator
    \def\@algocf@capt@ruled{under}%
    \begin{algorithm}[#1]}
  {\end{algorithm}}
\makeatother
\setlength\algotitleheightrule{0pt} 		% remove the last rule (below the caption)
\newcommand{\mycaptfrmt}[1]{\parbox{\linewidth}{\centerline{#1}}}
%\SetAlgoCaptionLayout{mycaptfrmt}   		% center the caption (see open TODO task) >> see https://tex.stackexchange.com/questions/173776/algorithm2e-and-hanging-captions
\SetAlgoCaptionSeparator{\unskip.}          % use dot as the separator in captions


%%%%%%%%%%%%%%%%%%%%%%%%%
% bullet list
%\renewcommand{\labelitemi}{$\bullet$}
%\renewcommand{\FrenchLabelItem}         % use bullets even in French
%    {\raisebox{-0.4\height}{\scalebox{2}{\textbullet}}}
\RequirePackage{enumitem}				% gives more control over lists
\setlist{nolistsep}						% changes spacing between list items


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% macros used to set the document details
\def\subtitle#1{\gdef\MySubtitle{#1}}				% optional subtitle
\def\major#1{\gdef\MyMajor{#1}}						% name of the class (ex. Licence or Master in CS)
\def\specialization#1{\gdef\MySpecialization{#1}}	% specialization (ex. software engineering vs. computer networks)
\def\course#1{\gdef\MyCourse{#1}}					% class name (Programming, Operating Systems...)
\def\subcourse#1{\gdef\MySubcourse{#1}}					% subclass name (optional)
%\def\advisor#1{\gdef\MyAdvisor{#1}}				% teacher advising the students (for an internship report, optional)
%\def\advisor[#1]#2{\gdef\MyAdvisor{#2}              % teacher advising the students (for an internship report, optional)
%    \gdef\MyAdvisorTitle{#1}
%}
\newcommand{\advisor}[2][Encadrement]{%             % teacher advising the students (for an internship report, optional)
    \gdef\MyAdvisor{#2}
    \gdef\MyAdvisorTitle{#1}
}
\def\affiliations#1{\gdef\MyAffiliations{#1}}		% affiliations (for technical or research reports)

\def\group#1{\gdef\MyGroup{#1}}						% student group (for a project report)
\def\date#1{\gdef\MyDate{#1}}						% date (optional)
\newcommand{\dateUpdt}[1]{%                         % date of last update (optional)
    \gdef\MyDateUpdt{#1}
}
\def\summary#1{\gdef\MySummary{#1}}					% abstract (for a paper)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom section headers
\RequirePackage{titlesec}
\titleformat{\section}
	{\color{mediumtealblue}\normalfont\Large\bfseries}
    {\thesection}
    {1em}
    {}
\titleformat{\subsection}
	{\color{mediumtealblue}\normalfont\large\bfseries}
    {\thesubsection}
    {1em}
    {}
\titleformat{\subsubsection}
	{\color{mediumtealblue}\normalfont\normalsize\bfseries}
    {\thesubsubsection}
    {1em}
    {}
%\setcounter{secnumdepth}{5}			% number subsubsections
%\setcounter{tocdepth}{5}				% and include them in the TOC
\setcounter{secnumdepth}{3}				% number subsubsections
\setcounter{tocdepth}{3}				% and include them in the TOC
% NOTE: only (?) for the report class
%	\RequirePackage{chngcntr}			% defines specific counters
%	\counterwithout{section}{chapter}	% hide the chapter number in section headings


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom paragraphs
\renewcommand{\paragraph}[1]{
	\par\vspace{0.15cm}
	\phantomsection
    \IfEndWith{\thesection}{0}{
    	\addcontentsline{toc}{section}{#1}
    }{\IfEndWith{\thesubsection}{.0}{
    	\addcontentsline{toc}{subsection}{#1}
    	}{\IfEndWith{\thesubsubsection}{.0}{
    		\addcontentsline{toc}{subsubsection}{#1}
    		}{\addcontentsline{toc}{paragraph}{#1}}
        }
    }
    \noindent
    \textbbf{#1}\hspace{0.1cm}
} 
\newcommand{\paragraphe}[1]{
	\par\vspace{0.15cm}
    \noindent
    \textbbf{#1.}\hspace{0.1cm}
} 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom remark frames
\makeatletter
\newenvironment{beware}[1][\@nil]
{	\def\tmp{#1}%
    \setlength{\OuterFrameSep}{0pt}						% no space around the text
	\setlength{\FrameSep}{1mm}							% just a bit of colored space around the text
	\definecolor{shadecolor}{rgb}{1.00,0.80,0.80}		% background color for remarks
	\begin{leftbar}\noindent{}%                         % test for option or not
	\ifx\tmp\@nnil{}\else{\textbbf{#1 : }}\fi}           % taken from https://tex.stackexchange.com/questions/217757/special-behavior-if-optional-argument-is-not-passed
{\end{leftbar}\par}
\makeatother
% see the mdframed package for more control, if needed
% https://ctan.crest.fr/tex-archive/macros/latex/contrib/mdframed/mdframed.pdf


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom listings
\RequirePackage{listings}						% format source code
% \RequirePackage{lstlinebgrd}					% change background color - does not work anymore (v3.8.14)
\definecolor{colKeywords}{RGB}{127,0,85}		% keyword color
\definecolor{colComments}{RGB}{77,109,141}		% comment color
\definecolor{colStrings} {RGB}{42,0,255}		% string literal color
\definecolor{colLstHL}{RGB}{255,255,153}		% highlight color
\definecolor{colNumber}{rgb}{0.50,0.50,0.50}	% line number color
%\definecolor{mauve}{rgb}{0.58,0.00,0.82}

\lstset{
%	frame=tb,									% frame around the source code
	aboveskip=1mm,								% space before the source code
	belowskip=1mm,								% space after the source code
	showstringspaces=false,						% display space char as underscore
	columns=flexible,
    captionpos=b,                               % position of the caption (t or b)
	basicstyle={\small\ttfamily\NoAutoSpacing},
	keywordstyle=\color{colKeywords},			% set keyword color
	commentstyle=\color{colComments},			% set comment color
	stringstyle=\color{colStrings},				% set string literal color
    backgroundcolor=\color{bgLightGray},		% set background color
	numbers=left,								% line numbering: left, none
	numberstyle=\tiny\color{colNumber},			% line number format
	breaklines=true,							
	breakatwhitespace=true,						
	tabsize=3,									% size of tabulation (in chars)
	upquote=true,                               % straight quote character (' instead of ’)
%     literate=%
% 		{à}{{\`{a}}}1
%         {À}{{\`{A}}}1
%         {á}{{\'a}}1
%         {Á}{{\'A}}1
% 		{â}{{\^a}}1
%         {Â}{{\^A}}1
%         {ä}{{\"a}}1
%         {Ä}{{\"A}}1
%         {å}{{\r a}}1
%         {Å}{{\r A}}1
%         {æ}{{\ae}}1
%         {Æ}{{\AE}}1
% 		{ç}{{\c{c}}}1
%         {Ç}{{\c{C}}}1
% 		{é}{{\'e}}1
%         {É}{{\'E}}1
% 		{è}{{\`e}}1
%         {È}{{\`E}}1
% 		{ë}{{\"e}}1
%         {Ë}{{\"E}}1
% 		{ê}{{\^e}}1
%         {Ê}{{\^E}}1
%         {í}{{\'i}}1
%         {Í}{{\'I}}1
%         {ì}{{\`i}}1
%         {Ì}{{\`I}}1
% 		{ï}{{\"i}}1
%         {Ï}{{\"I}}1
% 		{î}{{\^i}}1
%         {Î}{{\^I}}1
%         {ñ}{{\~n}}1
%         {Ñ}{{\~N}}1
%         {ó}{{\'o}}1
%         {Ó}{{\'O}}1
%         {ò}{{\`o}}1
%         {Ò}{{\`O}}1
% 		{ö}{{\"o}}1
%         {Ö}{{\"O}}1
% 		{ô}{{\^o}}1
%         {Ö}{{\^O}}1
%         {ő}{{\H{o}}}1
%         {Ő}{{\H{O}}}1
%         {ø}{{\o}}1
%         {œ}{{\oe}}1
%         {Œ}{{\OE}}1
%         {ß}{{\ss}}1
%         {ú}{{\'u}}1
%         {Ú}{{\'U}}1
% 		{ù}{{\`u}}1
%         {Ù}{{\`U}}1
% 		{ü}{{\"u}}1
%         {Ü}{{\"U}}1
% 		{û}{{\^u}}1
%         {Û}{{\^U}}1
%         {ű}{{\H{u}}}1
%         {Ű}{{\H{U}}}1
%         {€}{{\euro}}1 
%         {£}{{\pounds}}1 
%         {«}{{\guillemotleft}}1
%         {»}{{\guillemotright}}1 
%         {¿}{{?`}}1
}
% this is just to be able to mention the listings environments... in latex listings environments
\lstnewenvironment{TeXlstlisting}{\lstset{language={[LaTeX]TeX}, numbers=none}}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% typewriter-type environments
\RequirePackage{framed}
\pgfkeys{
 /filetext/.is family, /filetext,
 caption/.estore in = \filetextCaption,
 label/.estore in = \filetextLabel,
}
\makeatletter
\newenvironment{filetext}[1][]
{	\def\tmp{#1}%
    \pgfkeys{/filetext,#1}
    \setlength{\OuterFrameSep}{0pt}						% no frame around the text
	\setlength{\FrameSep}{1mm}							% just a bit of colored space around the text
    \colorlet{shadecolor}{lightblue}               % background color to display files
	\begin{shaded}\begin{raggedright}\captionsetup{type=fileText}\small\ttfamily}
{\end{raggedright}\end{shaded}\par%
%\ifx\tmp\@nnil{\relax}\else{\vspace{-0.25cm}\captionof{fileText}{\filetextCaption}\vspace{0.25cm}\label{\filetextLabel}}\fi
\ifthenelse{\equal{\tmp}{}}{}{\vspace{-0.25cm}\captionof{fileText}{\filetextCaption}\vspace{0.25cm}\label{\filetextLabel}}
    
}
\makeatother
\pgfkeys{
 /consoletext/.is family, /consoletext,
 caption/.estore in = \consoletextCaption,
 label/.estore in = \consoletextLabel,
}
\makeatletter
\newenvironment{consoletext}[1][]
{	\def\tmp{#1}%
    \pgfkeys{/consoletext,#1}
    \setlength{\OuterFrameSep}{0pt}						% no frame around the text
	\setlength{\FrameSep}{1mm}							% just a bit of colored space around the text
    \colorlet{shadecolor}{black!90}                % background color to display console
	\begin{shaded}\begin{raggedright}\captionsetup{type=consoleText}\small\ttfamily\color{shamrockgreen}}
{\end{raggedright}\end{shaded}\par%
%\ifx\tmp\@nnil{\relax}\else{\vspace{-0.25cm}\captionof{consoleText}{\consoletextCaption}\vspace{0.25cm}\label{\consoletextLabel}}\fi
\ifthenelse{\equal{\tmp}{}}{}{\vspace{-0.25cm}\captionof{consoleText}{\consoletextCaption}\vspace{0.25cm}\label{\consoletextLabel}}
}
\makeatother
\RequirePackage{textcomp}                               % for the \textquotesingle command (straight single quotes in \texttt)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gantt diagrams
% the below part is taken from StackExchange:
	% http://tex.stackexchange.com/questions/175830/how-to-draw-a-vertical-line-at-a-specified-date-in-a-gantt-chart
	\RequirePackage{pgfgantt}		% load the package we are modifying
    \makeatletter
	\@gtt@keydef{anyday}{none}		% some new keys for the style of our "anyday" marker lines
	\@gtt@keydef{anyday offset}{1}
	\@gtt@stylekeydef{anyday rule}{dashed, line width=1pt}
	\@gtt@keydef{anyday label font}{\normalfont}
	\@gtt@stylekeydef{anyday label node}{%
  		anchor=north, font=\ganttvalueof{anyday label font}%
	}
	\newcount\gtt@anyday@slot
	\newcommand\drawverticalline[2]{%
  		\gtt@tsstojulian{#1}{\gtt@anyday@slot}%
  		\gtt@juliantotimeslot{\gtt@anyday@slot}{\gtt@anyday@slot}%
  		\pgfmathsetmacro\y@upper{%
    		\gtt@lasttitleline * \ganttvalueof{y unit title}%
  		}%
  		\pgfmathsetmacro\y@lower{%
    		\gtt@lasttitleline * \ganttvalueof{y unit title}%
      		+ (\gtt@currentline - \gtt@lasttitleline - 1)%
      		* \ganttvalueof{y unit chart}%
  		}%
  		\pgfmathsetmacro\x@mid{%
    		(\gtt@anyday@slot - 1 + \ganttvalueof{anyday offset})%
      		* \ganttvalueof{x unit}%
  		}%
  		\draw [/pgfgantt/anyday rule]
    		(\x@mid pt, \y@upper pt) -- (\x@mid pt, \y@lower pt)
    		node [/pgfgantt/anyday label node] {#2};%
	}
    \makeatother
% custom bars
\newcommand\ganttbarbis[5]{\ganttbar{#1}{#3}{#4}\ganttbar[inline, bar/.append style={fill=#5}, bar label font=\footnotesize]{#2}{#3}{#4}}
% custom week nimbers
\newcounter{myWeekNum}
\stepcounter{myWeekNum}
\newcommand{\myWeek}{\themyWeekNum
	\stepcounter{myWeekNum}
	\ifnum\themyWeekNum=53
		\setcounter{myWeekNum}{1}
	\else\fi
}
\ganttset{%
calendar week text={s\myWeek{}}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% names of the specialized tables of content
\newcommand{\tocName}{Contents}									% define TOC header
\addto\captionsfrench{\renewcommand{\contentsname}{\tocName}}	% change TOC header
\newcommand{\lofName}{List of Figures}						% define LOF header
\renewcommand{\listfigurename}{\lofName}						% change LOF header (1)
\addto\captionsfrench{\renewcommand{\listfigurename}{\lofName}}	% change LOF header (2)
\newcommand{\lotName}{List of Tables}							% define LOT header
\renewcommand{\listtablename}{\lotName}						% change LOT header (1)
\addto\captionsfrench{\renewcommand{\listtablename}{\lotName}}	% change LOT header (2)


\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% specialized tables of content
\newcommand{\MyToc}{
	\phantomsection
	%\addcontentsline{toc}{section}{\tocName}	% add the TOC in the TOC (yes! for PDF bookmarks)
	\tableofcontents							% insert TOC
    \clearpage
	\listoffigures	
	\clearpage
	\listoftables
	\thispagestyle{fancy}						% force header/footer
	\newpage
}
\newcommand{\MyLof}{
	\phantomsection
	\addcontentsline{toc}{section}{\lofName}	% add the LOF in the TOC
	\listoffigures								% insert LOF
	\thispagestyle{fancy}						% force header/footer
	\newpage
}
\newcommand{\MyLot}{
	\phantomsection
	\addcontentsline{toc}{section}{\lotName}	% add the LOT in the TOC
	\listoftables								% insert LOT
	\thispagestyle{fancy}						% force header/footer
	\newpage
}		


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% regular title page
\newcommand{\maketitleZ}{
	% setup PDF doc info
	\hypersetup{
    	pdftitle={\ifdefined\MyTitle \MyTitle \else \fi \ifdefined\MySubtitle -- \MySubtitle \else \fi},
	   	pdfauthor={\ifdefined\MyAuthor \MyAuthor \else \fi},
    	pdfsubject={\ifdefined\MyCourse \MyCourse \else \fi}
	}
	
	% custom headers and footers
	\setHeaders
    
	% draw title page
	\phantomsection 
	%\addcontentsline{toc}{section}{Title}	% add the title page in the TOC (yes! for PDF bookmarks)
	\begin{titlepage}
		\begin{tikzpicture}[remember picture,overlay]
			% vertical lines
	    	\node at (current page.south west)
			{	\begin{tikzpicture}[remember picture,overlay]
                    \newlength{\ypos}
					% background
					\useasboundingbox (0,0) rectangle(\the\paperwidth,\the\paperheight);
                    \node[anchor=north west, inner sep=-0.01cm] at (current page.north west){%
                        % \ifaspectratio{169}{
                            \includegraphics{guideline/images/coverikv.pdf}
                            % }{\includegraphics{au/images/section_4-3.pdf}}
                            };
                    % title and possibly subtitle
					\pgftext[x=1cm, y=24.5cm, top, left]
					    {\parbox[t]{19cm}{\centering \fontsize{42}{42}{\textbbf{\textcolor{darkmidnightblue}{Guidelines for the Creation \\ of Semantic Models in the \\ Internet of Production (IoP)}}} \ifdefined\MySubtitle {\\[0.2cm] \fontsize{35}{35}{\textit{\textbbf{\textcolor{darkmidnightblue}{\parbox[t]{19cm}{\raggedright\MySubtitle}}}}}} \else \fi}};
%                    \pgfmathsetmacro{\ypos}{17.5cm}
                    \setlength{\ypos}{17.5cm}
					\ifdefined\MyGroup \pgftext[x=1cm, y=\ypos, top, left]
					    {\fontsize{20}{20}{\textmd{\textcolor{darkmidnightblue}{\parbox[t]{19cm}{\raggedright\MyGroup}}}}}; 
					    \addtolength{\ypos}{-0.9cm}
                    \else\fi
                    % authors
					\pgftext[x=13.3cm, y=8cm, top, left]
					    {\begin{minipage}{19cm}
					        \begin{doublespace}
					     \fontsize{17}{17}{\textbbf{Author} \\ \textmd{\MyAuthor}}
					        \end{doublespace}
				        \end{minipage}};
                    % date
					\pgftext[x=20cm, y=15, bottom, right]
				        {\fontsize{18}{18}{\textbbf{\textcolor{darkmidnightblue}{
				            \ifdefined\MyDate 
				                {\ifdefempty{\MyDate}{}{\MyDate}} 
			                \else {} 
			                \fi}}}};
		            % update date
				    \addtolength{\ypos}{-0.8cm}
					\pgftext[x=20cm, y=\ypos, bottom, right]
				        {\fontsize{17}{17}{\textmd{\textcolor{darkmidnightblue}{
			                \ifdefined\MyDateUpdt 
			                    {\ifdefempty{\MyDateUpdt}{}{\MyDateUpdt}} 
		                    \else {}
		                    \fi}}}};
			        % affiliations
                    \ifdefined\MyMajor \setlength{\ypos}{9.5cm} \else \setlength{\ypos}{8cm} \fi
					\ifdefined\MyAffiliations \pgftext[x=1cm, y=\ypos, top, left]
					    {\begin{minipage}{19cm}
				            \fontsize{13}{13}{\textmd{\textcolor{black}{\MyAffiliations}}}
				        \end{minipage}};
					    \else\fi
                    % advisors
                    \setlength{\ypos}{5cm}
					\ifdefined\MyAdvisor \pgftext[x=20cm, y=\ypos, top, right]
					    {\begin{minipage}{19cm}
					        \raggedleft
				            \fontsize{17}{17}{\textbbf{\MyAdvisorTitle} \\ \textmd{\MyAdvisor \\}}
			            \end{minipage}}; 
					    \else\fi
                    % misc
					\pgftext[x=1cm, y=\ypos, top, left]
					    {\begin{minipage}{19cm}
					        \fontsize{16}{16}{
					        \raggedright
					        % major
					        \ifdefined\MyMajor \textbbf{\MyMajor} \\ \else\fi
					        % specialization
					        \ifdefined\MySpecialization \textbbf{\MySpecialization} \\ \else\fi
					        \vspace{0.2cm}
					        % course
					        \ifdefined\MyCourse \textbbf{UE}~\textmd{\MyCourse} \\ \else\fi
					        % subcourse
					        \ifdefined\MySubcourse \textbbf{UCE}~\textmd{\MySubcourse} \\ \else\fi
					    }\end{minipage}}; 
				\end{tikzpicture}
			};
		\end{tikzpicture}
	\end{titlepage}

	\setcounter{page}{2} 	% set the second page... to number 2
	\thispagestyle{fancy}	% force header/footer
	\newpage
		
	% insert abstract
	\ifdefined\MySummary
		\phantomsection
		\addcontentsline{toc}{section}{\abstractname}	% add the abstract in the TOC
		\noindent \textcolor{mediumtealblue}{\textbbf{\huge \abstractname}}
           
		\vspace{0.25cm}
		\MySummary
		\newpage
	\else\fi
        
	% insert ToC
	\MyToc
}
\renewcommand{\maketitle}{\maketitleZ}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% handles the "blue" option
\DeclareOption{blue}{%
    \renewcommand{\maketitleZ}{
    	% setup PDF doc info
    	\hypersetup{
    	    pdftitle={\ifdefined\MyTitle \MyTitle \else \fi \ifdefined\MySubtitle -- \MySubtitle \else \fi},
    	   	pdfauthor={\ifdefined\MyAuthor \MyAuthor \else \fi},
        	pdfsubject={\ifdefined\MyCourse \MyCourse \else \fi}
    	}
    	
    	% custom headers and footers
    	\setHeaders
        
    	% draw title page
    	\phantomsection 
    	%\addcontentsline{toc}{section}{Contents}	% add the title page in the TOC (yes! for PDF bookmarks)
    	\begin{titlepage}
    		\begin{tikzpicture}[remember picture,overlay]
    			% vertical lines
    	    	\node at (current page.south west)
    			{	\begin{tikzpicture}[remember picture,overlay]
                        \newlength{\ypos}
    					% background
    					\useasboundingbox (0,0) rectangle(\the\paperwidth,\the\paperheight);
                        \node[anchor=north west, inner sep=-0.01cm] at (current page.north west){%
                            % \ifaspectratio{169}{
                                \includegraphics{guideline/images/blue_background.pdf}
                                % }{\includegraphics{au/images/section_4-3.pdf}}
                                };
                        % title
    					\pgftext[x=1cm, y=25.5cm, top, left]
    					    {\parbox[t]{19cm}{\raggedright\fontsize{42}{42}{\textbbf{\textcolor{black}{\MyTitle}}} \ifdefined\MySubtitle {\\[0.2cm] \fontsize{35}{35}{\textit{\textbbf{\textcolor{black}{\parbox[t]{19cm}{\raggedright\MySubtitle}}}}}} \else \fi}};
                        % group (optional)
    %                    \pgfmathsetmacro{\ypos}{17.5cm}
                        \setlength{\ypos}{15cm}
    					\ifdefined\MyGroup \pgftext[x=1cm, y=\ypos, top, left]
    					    {\fontsize{20}{20}{\textmd{\textcolor{darkmidnightblue}{\parbox[t]{19cm}{\raggedright\MyGroup}}}}}; 
    					    \addtolength{\ypos}{-0.9cm}
                        \else\fi
                        % authors
    					\pgftext[x=1cm, y=8cm, top, left]
    					    {\begin{minipage}{19cm}
    					        \begin{doublespace}
    					            \fontsize{20}{20}{\textbbf{\textcolor{darkmidnightblue}{\MyAuthor}}}
    					        \end{doublespace}
    				        \end{minipage}};
                        % date
    					\pgftext[x=20cm, y=\ypos, top, right]
    				        {\fontsize{20}{20}{\textbbf{\textcolor{darkmidnightblue}{
    				            \ifdefined\MyDate 
    				                {\ifdefempty{\MyDate}{16 September 2022}{\MyDate}} 
    			                \else {\16 September 2022} 
    			                \fi}}}};
    			        % affiliations
                        \ifdefined\MyMajor \setlength{\ypos}{9.5cm} \else \setlength{\ypos}{8cm} \fi
    					\ifdefined\MyAffiliations \pgftext[x=1cm, y=\ypos, top, left]
    					    {\begin{minipage}{19cm}
    				            \fontsize{13}{13}{\textmd{\textcolor{darkmidnightblue}{\MyAffiliations}}}
    				        \end{minipage}};
    					    \else\fi
                        % advisors
                        \setlength{\ypos}{8cm}
    					\ifdefined\MyAdvisor \pgftext[x=20cm, y=\ypos, top, right]
    					    {\begin{minipage}{19cm}
    					        \raggedleft
    				            \fontsize{16}{16}{\textcolor{darkmidnightblue}{\textbbf{\MyAdvisorTitle}} \\ \textcolor{darkmidnightblue}{\textmd{\MyAdvisor} \\}}
    			            \end{minipage}}; 
    					    \else\fi
                        % misc
    					\pgftext[x=1cm, y=\ypos, top, left]
    					    {\begin{minipage}{19cm}
    					        \fontsize{16}{16}{
    					        \raggedright
    					        % major
    					        \ifdefined\MyMajor \textcolor{darkmidnightblue}{\textbbf{\MyMajor}} \\ \else\fi
    					        % specialization
    					        \ifdefined\MySpecialization \textcolor{darkmidnightblue}{\textbbf{\MySpecialization}} \\ \else\fi
    					        \vspace{0.2cm}
    					        % course
    					        \ifdefined\MyCourse \textcolor{darkmidnightblue}{\textbbf{UE}~\textmd{\MyCourse}} \\ \else\fi
    					        % subcourse
    					        \ifdefined\MySubcourse \textcolor{darkmidnightblue}{\textbbf{UCE}~\textmd{\MySubcourse}} \\ \else\fi
    					    }\end{minipage}}; 
    				\end{tikzpicture}
    			};
    		\end{tikzpicture}
    	\end{titlepage}
    
    	\setcounter{page}{2} 	% set the second page... to number 2
    	\thispagestyle{fancy}	% force header/footer
    	\newpage
    		
    	% insert abstract
    	\ifdefined\MySummary
    		\phantomsection
    		\addcontentsline{toc}{section}{\abstractname}	% add the abstract in the TOC
    		\noindent \textcolor{mediumtealblue}{\textbbf{\huge \abstractname}}
               
    		\vspace{0.25cm}
    		\MySummary
    		\newpage
    	\else\fi
            
    	% insert ToC
    	\MyToc
    }
    \renewcommand{\maketitle}{\maketitleZ}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% handles the "light" option
\DeclareOption{light}{%
	\SetWatermarkText{BROUILLON}

	\renewcommand{\maketitle}{
		% setup PDF doc info
		\hypersetup{
    	    pdftitle={\ifdefined\MyTitle \MyTitle \else \fi \ifdefined\MySubtitle -- \MySubtitle \else \fi},
	    	pdfauthor={\ifdefined\MyAuthor \MyAuthor \else \fi},
    		pdfsubject={\ifdefined\MyCourse \MyCourse \else \fi}
		}
			
		% custom headers and footers
		\pagestyle{fancy}
		\fancyhf{}
		\renewcommand{\headrulewidth}{0.4pt}
		\renewcommand{\footrulewidth}{0.4pt}
		\cfoot{\thepage\ / \pageref*{LastPage}} 
		\chead{\MyTitle \ifdefined\MySubtitle -- \MySubtitle \else \fi} 

		% first page style
		\fancypagestyle{firststyle}
		{	\fancyhf{}
			\renewcommand{\headrulewidth}{0pt}
			\renewcommand{\footrulewidth}{0.4pt}
			\cfoot{\thepage\ / \pageref*{LastPage}} 
		}
			
		% draw title page
		\phantomsection 
		%\addcontentsline{toc}{section}{Titre}	% add the title page in the TOC (yes! for PDF bookmark)
		\begin{center}
           	% title
			\Huge{\textbbf{\textcolor{mediumtealblue}{\MyTitle}}} \\
			\Large{\textbbf{\textcolor{mediumtealblue}{\MySubtitle}}} \\
			% authors
			\Large{\MyAuthor} \\
	        % affiliations
			\ifdefined\MyAffiliations 
    			\vspace{0.1cm}
			    \small{\textmd{\textcolor{black}{\MyAffiliations}}} \\
		    \else\fi
			% group
			\vspace{0.2cm}
			\ifdefined\MyGroup 
				\normalsize{\MyGroup} \\
			\else\fi
			% date
			\ifdefined\MyDate
				\ifdefempty{\MyDate}{\small{16 September 2022} \\}{\small{\MyDate} \\}
			\else
				{\small{16 September 2022}} \\
			\fi
			% major and specialization
            \ifdefined\MyMajor
    			\vspace{0.2cm}
				\normalsize{\textbbf{\MyMajor}}
				\ifdefined\MySpecialization
					\normalsize{ -- }
				\else
					\\
				\fi
			\else\fi
			\ifdefined\MySpecialization
            	\normalsize{\textbbf{\MySpecialization}} \\
            \else\fi
			% course
			\ifdefined\MyCourse
    			\vspace{0.2cm}
				\normalsize{\textbbf{UE} \MyCourse} \\
			\else\fi
			% subcourse
			\ifdefined\MySubcourse
				\normalsize{\textbbf{UCE} \MySubcourse} \\
			\else\fi
			% advisor
			\ifdefined\MyAdvisor
    			\vspace{0.2cm}
				{\small{\textbbf{\MyAdvisorTitle :} \\ \MyAdvisor}} \\
			\else\fi
            % abstract
            \ifdefined\MySummary
            	\phantomsection
                \addcontentsline{toc}{section}{\abstractname}	% add the abstract in the TOC
                \parbox[c][][s]{0.75\textwidth}{\footnotesize \vspace{0.5cm} \noindent \textcolor{mediumtealblue}{\textbbf{\abstractname.}} \MySummary}
			\else\fi
		\end{center}	
	
		\setcounter{page}{1} 		% set the second page... to number 2
		\thispagestyle{firststyle}	% force header/footer
	}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% handles the "full" option
\DeclareOption{full}{%
	\renewcommand{\maketitle}
	{	\maketitleZ
    	% Insert list of figures
		\MyLof
		% Insert list of tables
		\MyLot
	}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% handles the "handout" option
\DeclareOption{handout}                         % console text in video inverse
{   \makeatletter
    \renewenvironment{consoletext}[1][]         % redefine the previously defined environment
    {	\def\tmp{#1}%
        \pgfkeys{/consoletext,#1}
        \setlength{\OuterFrameSep}{0pt}		    % frame around the text
	    \setlength{\FrameSep}{1mm}			    % just a bit of colored space around the text
	    \colorlet{shadecolor}{lightblue}   % background color to display console
	    \begin{framed}\begin{raggedright}\captionsetup{type=consoleText}\small\ttfamily\color{cobalt}}
    {\end{raggedright}\end{framed}\par
        \ifthenelse{\equal{\tmp}{}}{}{\vspace{-0.25cm}\captionof{consoleText}{\consoletextCaption}\vspace{0.25cm}\label{\consoletextLabel}}
    }
    \makeatother
}

\ProcessOptions