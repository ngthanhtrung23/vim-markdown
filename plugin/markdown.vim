" =============================================================================
" Simple Markdown plugin for vim
"
" Features:
"   Highlight for basic Markdown syntax: headings, list, link
"   Embedding Tex/LaTex support: $...$ will be highlighted as tex
"   Highlight code between ``` ```
" =============================================================================

" Highlight code snippet
function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

function! MARKDOWNSET()
  " Many of the following are copied from vim-markdown/syntax/mkd.vim (https://github.com/plasticboy/vim-markdown/blob/master/syntax/mkd.vim)
  set ft=tex
  set wrap

  " HTML headings
  syn region htmlH1         start="^\s*#"                   end="\($\|#\+\)" contains=@Spell
  syn region htmlH2         start="^\s*##"                  end="\($\|#\+\)" contains=@Spell
  syn region htmlH3         start="^\s*###"                 end="\($\|#\+\)" contains=@Spell
  syn region htmlH4         start="^\s*####"                end="\($\|#\+\)" contains=@Spell
  syn region htmlH5         start="^\s*#####"               end="\($\|#\+\)" contains=@Spell
  syn region htmlH6         start="^\s*######"              end="\($\|#\+\)" contains=@Spell
  syn match  htmlH1         /^.\+\n=\+$/ contains=@Spell
  syn match  htmlH2         /^.\+\n-\+$/ contains=@Spell

  " List
  syn match  mkdListItem    "^\s*[-*+]\s\+"
  syn match  mkdListItem    "^\s*\d\+\.\s\+"
  hi  link   mkdListItem    Identifier

  " Link
  syn region mkdFootnotes   matchgroup=mkdDelimiter start="\[^"      end="\]"
  syn region mkdID          matchgroup=mkdDelimiter start="\["       end="\]" contained oneline
  syn region mkdURL         matchgroup=mkdDelimiter start="("        end=")"  contained oneline
  syn region mkdLink        matchgroup=mkdDelimiter start="\\\@<!\[" end="\]\ze\s*[[(]" contains=@Spell nextgroup=mkdURL,mkdID skipwhite oneline
  hi  link   mkdLink        htmlLink
  hi  link   mkdURL         htmlString

  " Code
  call TextEnableCodeSnip('html', '<', '/>', 'SpecialComment')
  call TextEnableCodeSnip('cpp', '```cpp', '```', 'SpecialComment')
  call TextEnableCodeSnip('java', '```java', '```', 'SpecialComment')
  call TextEnableCodeSnip('python', '```python', '```', 'SpecialComment')
  call TextEnableCodeSnip('ruby', '```ruby', '```', 'SpecialComment')

  " Comment
  syn region mkdComment     start=/<!--/ end=/-->/
  hi  link   mkdComment     Comment

  " Highlight
  syn region htmlItalic     start="\\\@<!\*\S\@="                          end="\S\@<=\\\@<!\*" keepend oneline
  syn region htmlItalic     start="\(^\|\s\)\@<=_\|\\\@<!_\([^_]\+\s\)\@=" end="\S\@<=_\|_\S\@=" keepend oneline
  syn region htmlBold       start="\S\@<=\*\*\|\*\*\S\@="                  end="\S\@<=\*\*\|\*\*\S\@=" keepend oneline
  syn region htmlBold       start="\S\@<=__\|__\S\@="                      end="\S\@<=__\|__\S\@=" keepend oneline
  syn region htmlBoldItalic start="\S\@<=\*\*\*\|\*\*\*\S\@="              end="\S\@<=\*\*\*\|\*\*\*\S\@=" keepend oneline
  syn region htmlBoldItalic start="\S\@<=___\|___\S\@="                    end="\S\@<=___\|___\S\@=" keepend oneline
endfunction

" Identify Markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd Filetype markdown call MARKDOWNSET()
