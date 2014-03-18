% ================================================================
% ENTRY

ENTRY
  {
    title
    company
    location
    date
    desc
    name
    firstname
    lastname
    address
    city
    email
    web
    birthdate
    nationality
    phone
    permis
    resume
    width
  }
  {}
  {}



% ================================================================
% Misc functions

FUNCTION{nextrow}
{
  " & " write$
}

FUNCTION{output}
{
  cite$ pop$
}

FUNCTION{eol}
{
  "\\" write$ newline$
}



% ================================================================
% Header

FUNCTION{info}
{
  "\lhead{"   write$ newline$
  address     duplicate$ empty$ { pop$ } { output write$ eol } if$
  city        duplicate$ empty$ { pop$ } { output write$ eol } if$
  nationality duplicate$ empty$ { pop$ } { "\MyNat{" write$ output write$ "}" write$ eol } if$
  birthdate   duplicate$ empty$ { pop$ } { "\MyBiD{" write$ output write$ "}" write$ eol } if$
  permis      duplicate$ empty$ { pop$ } { "\MyPer{" write$ output write$ "}" write$ eol } if$
  "~\\}"         write$ newline$

  "\chead{"                write$ newline$
  "{\Huge \sc "            write$
  output firstname         write$
  " "                      write$
  output lastname          write$
  "}"                      write$ eol
  "\vspace{\HdrTitleSep} " write$
  "{\Large \bf "           write$
  output resume            write$
  "}"                      write$ eol
  "}"                      write$ newline$

  "\rhead{" write$ newline$
  phone     duplicate$ empty$ { pop$ } { output write$ eol } if$
  email     duplicate$ empty$ { pop$ } { output write$ eol } if$
  web       duplicate$ empty$ { pop$ } { output write$ eol } if$
  "~\\}"       write$ newline$
}



% ================================================================
% Sections

FUNCTION{section_begin}
{
  "\setlength{\SectionInfoWidth}{" write$ output width write$ "}"                      write$ newline$
  "\setlength{\SectionDataWidth}{\textwidth}"                                          write$ newline$
  "\addtolength{\SectionDataWidth}{-1\SectionInfoWidth}"                               write$ newline$
  "\addtolength{\SectionDataWidth}{-2cm}"                                              write$ newline$

  "\settowidth{\SectionNameWidth}{\ \SectionCaption{" write$ output name write$ "}\ }" write$ newline$
  "\setlength{\SectionLineWidth}{10cm}"                                                write$ newline$
  "\addtolength{\SectionLineWidth}{-1\SectionNameWidth}"                               write$ newline$
  "\setlength{\SectionLineWidth}{0.5\SectionLineWidth}"                                write$ newline$

  "\setlongtables"                                                write$ newline$
  "\begin{longtable}{p{\SectionInfoWidth}p{\SectionDataWidth}}"   write$
  "\caption*{"                                                    write$
  " \rule[0.5ex]{\SectionLineWidth}{0.1mm} "                      write$
  "\SectionCaption{" write$ output name write$ "}"                write$
  " \rule[0.5ex]{\SectionLineWidth}{0.1mm} "                      write$
  "}"                                                             write$ newline$
  "\vspace{\SectionTitle}"                                        write$ newline$
  "\endfirsthead"                                                 write$ newline$
}

FUNCTION{section_end}
{
  "\end{longtable}" write$ newline$
}



% ================================================================
% Content

FUNCTION{formation}
{
  " {\footnotesize " write$ newline$
  output date        write$
  " } & {\bf "       write$ newline$
  output title       write$
  " }"               write$
  output desc        write$
  eol
  eol
}

FUNCTION{exp_short}
{
  " {\footnotesize " write$ newline$
  output date        write$
  " } & {\bf "       write$ newline$
  output title       write$
  " }"               write$
  output desc        write$
  eol
  eol
}

FUNCTION{exp_long}
{
  " {\footnotesize " write$ newline$
  output date        write$
  " } & {\bf "       write$ newline$
  output title       write$
  " }"               write$

  company empty$ location empty$ + #2 <
  {
    eol nextrow
    "{\bf " write$
    company  duplicate$ empty$ { pop$ } { output write$ } if$
    company empty$ location empty$ + #0 = { " - " write$ } {} if$
    location duplicate$ empty$ { pop$ } { output write$ } if$
    "}" write$
  }
  {
  }
  if$

  eol nextrow
  output desc write$
  eol
  eol
}

FUNCTION{proj}
{
  " {\bf "      write$ newline$
  output name   write$
  " } & {\bf "  write$ newline$
  output title  write$
  " }"          write$

  eol nextrow
  output desc write$
  eol
}

FUNCTION{misc}
{
  " {\bf " write$ newline$
  output name write$
  " } & " write$
  output desc write$
  eol
  eol
}



% ================================================================
% Page functions

FUNCTION{title_page}
{
}

FUNCTION{empty_page}
{
  "\newpage"              write$ newline$
  "\thispagestyle{plain}" write$ newline$
  "\headsep -1cm"         write$ newline$
}

FUNCTION{white_space}
{
  "\vspace{\SectionSpace}" write$ newline$
}



% ================================================================
% Wrapping functions

FUNCTION{begin.bib}
{
  "\newlength{\SectionInfoWidth}" write$ newline$
  "\newlength{\SectionDataWidth}" write$ newline$
  "\newlength{\SectionNameWidth}" write$ newline$
  "\newlength{\SectionLineWidth}" write$ newline$

  "\newcommand{\SectionCaption}[1]{\large \bf ~#1~}" write$ newline$
}

FUNCTION{end.bib}
{
  "\clearpage" write$ newline$
}


% ================================================================
% Mandatory stuff

READ

EXECUTE{begin.bib}

ITERATE{call.type$}

EXECUTE{end.bib}
