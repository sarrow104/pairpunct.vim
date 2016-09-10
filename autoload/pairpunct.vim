" User Interfaces:			" {{{1
function! pairpunct#PairAdd_chinese_style()	" {{{2
    inoremap <buffer> <A-'> ‘’<Left>
    inoremap <buffer> <A-"> “”<Left>
    inoremap <buffer> <A-9> ()<Left>
    inoremap <buffer> <A-(> （）<Left>
    inoremap <buffer> <A-[> 『』<Left>
    inoremap <buffer> <A-{> 「」<Left>
    inoremap <buffer> <A-<> 《》<Left>

    vnoremap <buffer> <A-'> <ESC>:call pairpunct#Quote_this_block('‘', '’', "'\"“”‘’")<CR>
    vnoremap <buffer> <A-"> <ESC>:call pairpunct#Quote_this_block('“', '”', "'\"“”‘’")<CR>
    vnoremap <buffer> <A-9> <ESC>:call pairpunct#Quote_this_block('(', ')', "()（）")<CR>
    vnoremap <buffer> <A-(> <ESC>:call pairpunct#Quote_this_block('（', '）', "()（）")<CR>
    vnoremap <buffer> <A-[> <ESC>:call pairpunct#Quote_this_block('『', '』', "『』")<CR>
    vnoremap <buffer> <A-{> <ESC>:call pairpunct#Quote_this_block('「', '」', "「」")<CR>
    vnoremap <buffer> <A-<> <ESC>:call pairpunct#Quote_this_block('《', '》', "<>《》")<CR>

    let b:match_words = '「:」,［:］,【:】,｛:｝,《:》,『:』,“:”,‘:’,（:）,\(，\|、\):\(。\|？\|！\)'
    "call pairpunct#PairDeleteBetween_chinese_style()
endfunction

function! pairpunct#Bind_punct_complete() " {{{2
    inoremap <buffer> <A-"> ""<Left>
    inoremap <buffer> <A-'> ''<Left>
    inoremap <buffer> <A-{> {}<Left>
    inoremap <buffer> <A-[> []<Left>
    inoremap <buffer> <A-(> ()<Left>
    snoremap <buffer> <A-"> ""<Left>
    snoremap <buffer> <A-'> ''<Left>
    inoremap <buffer> <A-<> <><Left>
    inoremap <buffer> <A-:> ::
    inoremap <buffer> <A-:> ::
endfunction

function! pairpunct#PairAdd_english_style()	" {{{2
    inoremap <buffer> <A-[> []<Left>
    inoremap <buffer> <A-{> {}<Left>
    inoremap <buffer> <A-(> ()<Left>
    inoremap <buffer> <A-'> ''<Left>
    inoremap <buffer> <A-"> ""<Left>
    inoremap <buffer> <A-<> <><Left>

    vnoremap <buffer> <A-'> <ESC>:call pairpunct#Quote_this_block("'", "'", "'\"")<CR>
    vnoremap <buffer> <A-"> <ESC>:call pairpunct#Quote_this_block('"', '"', "'\"")<CR>
    vnoremap <buffer> <A-(> <ESC>:call pairpunct#Quote_this_block("(", ")", "()")<CR>
    vnoremap <buffer> <A-[> <ESC>:call pairpunct#Quote_this_block("[", "]", "[]")<CR>
    vnoremap <buffer> <A-{> <ESC>:call pairpunct#Quote_this_block("{", "}", "{}")<CR>
    vnoremap <buffer> <A-<> <ESC>:call pairpunct#Quote_this_block("<", ">", "<>")<CR>

    " Sarrow: 2011-11-29
    "vnoremap <buffer> <A-Space> <ESC>:call pairpunct#Quote_this_block(" ", " ", " ")<CR>
    " 因为在linux-gvim下面，没有办法模拟alt键，所以用空格键，来代替原本的
    " <A-Space>快捷键。
    vnoremap <buffer> <Space> <ESC>:call pairpunct#Quote_this_block(" ", " ", " ")<CR>
endfunction

" NOTE:
" dd是常用的按钮，删除范围的缩写，没意义了；
" 还不如 va'd 这样使用；
"function! pairpunct#PairDeleteBetween_chinese_style()	" {{{2
"    noremap <buffer> da'	:call pairpunct#VisualPairOf('‘', '’', 1)<CR>d
"    noremap <buffer> di'	:call pairpunct#VisualPairOf('‘', '’', 0)<CR>d
"
"    noremap <buffer> da"	:call pairpunct#VisualPairOf('“', '”', 1)<CR>d
"    noremap <buffer> di"	:call pairpunct#VisualPairOf('“', '”', 0)<CR>d
"
"    noremap <buffer> da<	:call pairpunct#VisualPairOf('《', '》', 1)<CR>d
"    noremap <buffer> di<	:call pairpunct#VisualPairOf('《', '》', 0)<CR>d
"
"    noremap <buffer> da[	:call pairpunct#VisualPairOf('『', '』', 1)<CR>d
"    noremap <buffer> di[	:call pairpunct#VisualPairOf('『', '』', 0)<CR>d
"endfunction

function! pairpunct#PairVisual_chinese_style()	" {{{2
    vnoremap <buffer> a'	<ESC>:call pairpunct#VisualPairOf('‘', '’', 1)<CR>
    vnoremap <buffer> i'	<ESC>:call pairpunct#VisualPairOf('‘', '’', 0)<CR>

    vnoremap <buffer> a"	<ESC>:call pairpunct#VisualPairOf('“', '”', 1)<CR>
    vnoremap <buffer> i"	<ESC>:call pairpunct#VisualPairOf('“', '”', 0)<CR>

    " NOTE: 区分全角和半角字符
    vnoremap <buffer> as	<ESC>:execute "normal! va'"<CR>
    vnoremap <buffer> is	<ESC>:execute "normal! vi'"<CR>

    vnoremap <buffer> ad	<ESC>:execute "normal! va\""<CR>
    vnoremap <buffer> id	<ESC>:execute "normal! vi\""<CR>

    vnoremap <buffer> a<	<ESC>:call pairpunct#VisualPairOf('《', '》', 1)<CR>
    vnoremap <buffer> i<	<ESC>:call pairpunct#VisualPairOf('《', '》', 0)<CR>

    vnoremap <buffer> a[	<ESC>:call pairpunct#VisualPairOf('『', '』', 1)<CR>
    vnoremap <buffer> i[	<ESC>:call pairpunct#VisualPairOf('『', '』', 0)<CR>
endfunction

function! pairpunct#PairVisual_english_style()	" {{{2
    " Sarrow:
    " vim系统已经内建支持。
    "vnoremap <buffer> a'	<ESC>:call pairpunct#VisualPairOf('‘', '’', 1)<CR>
    "vnoremap <buffer> a"	<ESC>:call pairpunct#VisualPairOf('“', '”', 1)<CR>

    "vnoremap <buffer> i'	<ESC>:call pairpunct#VisualPairOf('‘', '’', 0)<CR>
    "vnoremap <buffer> i"	<ESC>:call pairpunct#VisualPairOf('“', '”', 0)<CR>

    " Sarrow: 2011-09-15
    vnoremap <buffer> a/	<ESC>:call pairpunct#VisualPairOf('/', '/', 1)<CR>
    vnoremap <buffer> i/	<ESC>:call pairpunct#VisualPairOf('/', '/', 0)<CR>

    vnoremap <buffer> ax	<ESC>:call pairpunct#VisualPairOf('x', 'x', 1)<CR>
    vnoremap <buffer> a"	<ESC>:call pairpunct#VisualPairOf('"', '"', 1)<CR>

    vnoremap <buffer> a\	<ESC>:call pairpunct#VisualPairOf('\', '\', 1)<CR>
    vnoremap <buffer> i\	<ESC>:call pairpunct#VisualPairOf('\', '\', 0)<CR>
endfunction

" Util Functions:
" Sarrow: 2010-12-19
function! pairpunct#Quote_this_block(q_b, q_e, sequence)	" {{{2
    let _tw_ = &tw
    let &tw=0
    let _tmp_a_ = @a
    normal gv"ay
    " NOTE: 空格 本身应该被替换掉！
    let _pattern_ = '[ '.a:sequence.']$'
    let _str_ = @a
    " Sarrow: 2011-11-24
    " 用 execute 方式，替换掉可视字符
    if _str_ !~ a:q_e.'$'
	if _str_ =~ _pattern_
	    "silent normal! `>s=a:q_e
	    execute "silent normal! `>s\<C-R>=a:q_e\<CR>"
	else
	    "silent normal! `>a=a:q_e
	    execute "silent normal! `>a\<C-R>=a:q_e\<CR>"
	endif
    endif
    let _pattern_ = '^[ '.a:sequence.']'
    if _str_ !~ '^'.a:q_b
	if _str_ =~ _pattern_
	    " silent normal! `<s=a:q_b
	    execute "silent normal! `<s\<C-R>=a:q_b\<CR>"
	else
	    " silent normal! `<i=a:q_b
	    execute "silent normal! `<i\<C-R>=a:q_b\<CR>"
	endif
    endif
    " End: 2011-11-24
    let @a = _tmp_a_
    let &tw=_tw_
endfunction

" mark begin: m_b
" mark end  : m_e
" is include mark : flag(Zero or none Zero)
function! pairpunct#VisualPairOf(m_b, m_e, flag)	" {{{2
    let [b_r, b_c] = searchpairpos(escape(a:m_b,'\*'), '', escape(a:m_e,'\*'), 'ncbW')
    " Sarrow: 2011年01月14日 21:31:21
    "vnoremap <buffer> i'	<ESC>/’/b-1<CR>v?‘?e+1<CR>
    "vnoremap <buffer> i"	<ESC>/”/b-1<CR>v?“?e+1<CR>
    if b_r
	let m_e= escape(a:m_e,'/\*')
	let m_b= escape(a:m_b,'?\*')
	if a:flag
	    " Sarrow: 2011-09-16
	    execute 'silent normal! /'.m_e."\<CR>v?".m_b."\<CR>"
	    "silent normal! /=m_ev?=m_b
	    " End:
	else
	    execute 'silent normal! /'.m_e."/b-1\<CR>v?".m_b."?e+1\<CR>"
	    "silent normal! /=m_e/b-1v?=m_b?e+1
	endif
    endif
    " Sarrow: 2011年01月14日 21:12:16	{{{3
    " sick-style implementation
    " is there any beautiful ones exists?
    "
    " execute "normal! /\<C-R>=".a:m_e."\<CR>v?\<C-R>=".a:m_b."\<CR>"
    " <ESC>/’<CR>v?‘<CR>
    " <ESC>/’/b-1<CR>v?‘?e+1<CR>
    "if b_r
    "    let [e_r, e_c] = searchpairpos(a:m_b, '', a:m_e, 'nW')
    "    let keys = 'v'
    "    if a:flag
    "        call search(a:m_b, 'cb')
    "    else
    "        call search(a:m_b, 'cbe')
    "        let keys .= 'lol'
    "    endif
    "    let line_to_down = e_r - b_r
    "    if !a:flag && e_c == 1
    "        let line_to_down -= 1
    "    endif
    "    let keys .= repeat('j',  line_to_down)
    "    if (b_c > e_c)
    "        let keys .= '0'
    "    endif
    "    if a:flag
    "        let keys .= 'f'.a:m_e
    "    elseif e_c > 1
    "        let keys .= 't'.a:m_e
    "    else
    "        let keys .= '$'
    "    endif
    "    execute "normal! ".keys
    "endif	}}}3
endfunction
