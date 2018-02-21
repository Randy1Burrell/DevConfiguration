" Ada Settings {{{
let g:tagbar_type_ada = {
      \ 'ctagstype': 'ada',
      \ 'kinds' : [
      \'P:package specs',
      \'p:packages',
      \'t:type',
      \'u:subtypes',
      \'c:record type components',
      \'l:enum type literals',
      \'v:variables',
      \'f:formal parameters',
      \'n:constants',
      \'x:exceptions',
      \'R:subprogram specs',
      \'r:subprograms',
      \'K:task specs',
      \'k:tasks',
      \'O:protected data specs',
      \'o:protected data',
      \'e:entries',
      \'b:labels',
      \'i:identifiers'
      \]
      \}
" }}}

" Ansible settings {{{
let g:tagbar_type_ansible = {
      \ 'ctagstype' : 'ansible',
      \ 'kinds' : [
      \ 't:tasks'
      \ ],
      \ 'sort' : 0
      \ }
" }}}

" Asm settings {{{
let g:tagbar_type_armasm = {
      \ 'ctagsbin'  : 'ctags',
      \ 'ctagsargs' : '-f- --format=2 --excmd=pattern --fields=nksSa --extra= --sort=no --language-force=asm',
      \ 'kinds' : [
      \ 'm:macros:0:1',
      \ 't:types:0:1',
      \ 'd:defines:0:1',
      \ 'l:labels:0:1'
      \ ]
      \}
" }}}

" AsciiDoc settings {{{
let g:tagbar_type_asciidoc = {
      \ 'ctagstype' : 'asciidoc',
      \ 'kinds' : [
      \ 'h:table of contents',
      \ 'a:anchors:1',
      \ 't:titles:1',
      \ 'n:includes:1',
      \ 'i:images:1',
      \ 'I:inline images:1'
      \ ],
      \ 'sort' : 0
      \ }
" }}}

" Bib settings {{{
let g:tagbar_type_bib = {
      \ 'ctagstype' : 'bib',
      \ 'kinds'     : [
      \ 'a:Articles',
      \ 'b:Books',
      \ 'L:Booklets',
      \ 'c:Conferences',
      \ 'B:Inbook',
      \ 'C:Incollection',
      \ 'P:Inproceedings',
      \ 'm:Manuals',
      \ 'T:Masterstheses',
      \ 'M:Misc',
      \ 't:Phdtheses',
      \ 'p:Proceedings',
      \ 'r:Techreports',
      \ 'u:Unpublished',
      \ ]
      \ }
" }}}

" CofeeScript settings {{{
let g:tagbar_type_coffee = {
      \ 'ctagstype' : 'coffee',
      \ 'kinds'     : [
      \ 'c:classes',
      \ 'm:methods',
      \ 'f:functions',
      \ 'v:variables',
      \ 'f:fields',
      \ ]
      \ }
" }}}

" Css settings {{{
let g:tagbar_type_css = {
      \ 'ctagstype' : 'Css',
      \ 'kinds'     : [
      \ 'c:classes',
      \ 's:selectors',
      \ 'i:identities'
      \ ]
      \ }
" }}}

" D settings {{{
let g:tagbar_type_d = {
      \ 'ctagstype' : 'd',
      \ 'kinds'     : [
      \ 'c:classes:1:1',
      \ 'f:functions:1:1',
      \ 'T:template:1:1',
      \ 'g:enums:1:1',
      \ 'e:enumerators:0:0',
      \ 'u:unions:1:1',
      \ 's:structs:1:1',
      \ 'v:variables:1:0',
      \ 'i:interfaces:1:1',
      \ 'm:members',
      \ 'a:alias'
      \ ],
      \'sro': '.',
      \ 'kind2scope' : {
      \ 'c' : 'class',
      \ 'g' : 'enum',
      \ 's' : 'struct',
      \ 'u' : 'union',
      \ 'T' : 'template'
      \},
      \ 'scope2kind' : {
      \ 'enum'      : 'g',
      \ 'class'     : 'c',
      \ 'struct'    : 's',
      \ 'union'     : 'u',
      \ 'template'  : 'T'
      \ },
      \ 'ctagsbin' : 'dscanner',
      \ 'ctagsargs' : ['--ctags']
      \ }

let g:tagbar_type_d = {
      \ 'ctagstype' : 'd',
      \ 'kinds'     : [
      \ 'c:classes:0:1',
      \ 'f:functions',
      \ 'g:enums',
      \ 'u:unions',
      \ 's:structs',
      \ 'm:members'
      \ ],
      \'sro': '.',
      \ 'kind2scope' : {
      \ 'c' : 'class',
      \ 'g' : 'enum',
      \ 's' : 'struct',
      \ 'u' : 'union'
      \},
      \ 'scope2kind' : {
      \ 'enum'      : 'g',
      \ 'class'     : 'c',
      \ 'struct'    : 's',
      \ 'union'     : 'u'
      \ }
      \ }
" }}}

" Elixir settings {{{
let g:tagbar_type_elixir = {
      \ 'ctagstype' : 'elixir',
      \ 'kinds' : [
      \ 'f:functions',
      \ 'functions:functions',
      \ 'c:callbacks',
      \ 'd:delegates',
      \ 'e:exceptions',
      \ 'i:implementations',
      \ 'a:macros',
      \ 'o:operators',
      \ 'm:modules',
      \ 'p:protocols',
      \ 'r:records',
      \ 't:tests'
      \ ]
      \ }
" }}}

" Google Go settings {{{
let g:tagbar_type_go = {
      \ 'ctagstype': 'go',
      \ 'kinds' : [
      \'p:package',
      \'f:function',
      \'v:variables',
      \'t:type',
      \'c:const'
      \]
      \}
" }}}

" Groovy settings {{{
let g:tagbar_type_groovy = {
      \ 'ctagstype' : 'groovy',
      \ 'kinds'     : [
      \ 'p:package:1',
      \ 'c:classes',
      \ 'i:interfaces',
      \ 't:traits',
      \ 'e:enums',
      \ 'm:methods',
      \ 'f:fields:1'
      \ ]
      \ }
" }}}

" Haskel settings {{{
let g:tagbar_type_haskell = {
      \ 'ctagsbin'  : 'hasktags',
      \ 'ctagsargs' : '-x -c -o-',
      \ 'kinds'     : [
      \  'm:modules:0:1',
      \  'd:data: 0:1',
      \  'd_gadt: data gadt:0:1',
      \  't:type names:0:1',
      \  'nt:new types:0:1',
      \  'c:classes:0:1',
      \  'cons:constructors:1:1',
      \  'c_gadt:constructor gadt:1:1',
      \  'c_a:constructor accessors:1:1',
      \  'ft:function types:1:1',
      \  'fi:function implementations:0:1',
      \  'o:others:0:1'
      \ ],
      \ 'sro'        : '.',
      \ 'kind2scope' : {
      \ 'm' : 'module',
      \ 'c' : 'class',
      \ 'd' : 'data',
      \ 't' : 'type'
      \ },
      \ 'scope2kind' : {
      \ 'module' : 'm',
      \ 'class'  : 'c',
      \ 'data'   : 'd',
      \ 'type'   : 't'
      \ }
      \ }
" }}}

" IDL (Interactive Data Language) settings {{{
let g:tagbar_type_idlang = {
      \ 'ctagstype' : 'IDL',
      \ 'kinds' : [
      \ 'p:Procedures',
      \ 'f:Functions',
      \ 'c:Common Blocks'
      \ ]
      \ }
" }}}

" Julia settings {{{
let g:tagbar_type_julia = {
      \ 'ctagstype' : 'julia',
      \ 'kinds'     : [
      \ 't:struct', 'f:function', 'm:macro', 'c:const']
      \ }
" }}}

" Makefile Targets settings {{{
let g:tagbar_type_make = {
      \ 'kinds':[
      \ 'm:macros',
      \ 't:targets'
      \ ]
      \}
" }}}

" Markdown settings {{{
let g:tagbar_type_markdown = {
      \ 'ctagstype' : 'markdown',
      \ 'kinds' : [
      \ 'h:Heading_L1',
      \ 'i:Heading_L2',
      \ 'k:Heading_L3'
      \ ]
      \ }

let g:tagbar_type_markdown = {
      \ 'ctagstype': 'markdown',
      \ 'ctagsbin' : '/path/to/markdown2ctags.py',
      \ 'ctagsargs' : '-f - --sort=yes',
      \ 'kinds' : [
      \ 's:sections',
      \ 'i:images'
      \ ],
      \ 'sro' : '|',
      \ 'kind2scope' : {
      \ 's' : 'section',
      \ },
      \ 'sort': 0,
      \ }
" }}}

" Media Wiki settings {{{
let g:tagbar_type_mediawiki = {
      \ 'ctagstype' : 'mediawiki',
      \ 'kinds' : [
      \'h:chapters',
      \'s:sections',
      \'u:subsections',
      \'b:subsubsections',
      \]
      \}
" }}}

" NASL settings {{{
let g:tagbar_type_nasl = {
      \ 'ctagstype' : 'nasl',
      \ 'kinds'     : [
      \ 'f:function',
      \ 'u:public function',
      \ 'r:private function',
      \ 'v:variables',
      \ 'n:namespace',
      \ 'g:globals',
      \ ]
      \ }
" }}}

" Obj-C settings {{{
let g:tagbar_type_objc = {
      \ 'ctagstype' : 'ObjectiveC',
      \ 'kinds'     : [
      \ 'i:interface',
      \ 'I:implementation',
      \ 'p:Protocol',
      \ 'm:Object_method',
      \ 'c:Class_method',
      \ 'v:Global_variable',
      \ 'F:Object field',
      \ 'f:function',
      \ 'p:property',
      \ 't:type_alias',
      \ 's:type_structure',
      \ 'e:enumeration',
      \ 'M:preprocessor_macro',
      \ ],
      \ 'sro'        : ' ',
      \ 'kind2scope' : {
      \ 'i' : 'interface',
      \ 'I' : 'implementation',
      \ 'p' : 'Protocol',
      \ 's' : 'type_structure',
      \ 'e' : 'enumeration'
      \ },
      \ 'scope2kind' : {
      \ 'interface'      : 'i',
      \ 'implementation' : 'I',
      \ 'Protocol'       : 'p',
      \ 'type_structure' : 's',
      \ 'enumeration'    : 'e'
      \ }
      \ }
" }}}

" Pearl settings {{{
let g:tagbar_type_perl = {
      \ 'ctagstype' : 'perl',
      \ 'kinds'     : [
      \ 'p:package:0:0',
      \ 'w:roles:0:0',
      \ 'e:extends:0:0',
      \ 'u:uses:0:0',
      \ 'r:requires:0:0',
      \ 'o:ours:0:0',
      \ 'a:properties:0:0',
      \ 'b:aliases:0:0',
      \ 'h:helpers:0:0',
      \ 's:subroutines:0:0',
      \ 'd:POD:1:0'
      \ ]
      \ }
" }}}

" Powershell settings {{{
let g:tagbar_type_ps1 = {
      \ 'ctagstype' : 'powershell',
      \ 'kinds'     : [
      \ 'f:function',
      \ 'i:filter',
      \ 'a:alias'
      \ ]
      \ }
" }}}

" Puppet settings {{{
let g:tagbar_type_puppet = {
      \ 'ctagstype': 'puppet',
      \ 'kinds': [
      \'c:class',
      \'s:site',
      \'n:node',
      \'d:definition'
      \]
      \}
" }}}

" R settings {{{
let g:tagbar_type_r = {
      \ 'ctagstype' : 'r',
      \ 'kinds'     : [
      \ 'f:Functions',
      \ 'g:GlobalVariables',
      \ 'v:FunctionVariables',
      \ ]
      \ }
" }}}

" Rst settings {{{
let g:tagbar_type_rst = {
      \ 'ctagstype': 'rst',
      \ 'ctagsbin' : '/path/to/rst2ctags.py',
      \ 'ctagsargs' : '-f - --sort=yes',
      \ 'kinds' : [
      \ 's:sections',
      \ 'i:images'
      \ ],
      \ 'sro' : '|',
      \ 'kind2scope' : {
      \ 's' : 'section',
      \ },
      \ 'sort': 0,
      \ }
" }}}

" Ruby settings {{{
let g:tagbar_type_ruby = {
      \ 'kinds' : [
      \ 'm:modules',
      \ 'c:classes',
      \ 'd:describes',
      \ 'C:contexts',
      \ 'f:methods',
      \ 'F:singleton methods'
      \ ]
      \ }
" }}}

" Ruby with riptags settings {{{
if executable('ripper-tags')
  let g:tagbar_type_ruby = {
        \ 'kinds'      : ['m:modules',
        \ 'c:classes',
        \ 'C:constants',
        \ 'F:singleton methods',
        \ 'f:methods',
        \ 'a:aliases'],
        \ 'kind2scope' : { 'c' : 'class',
        \ 'm' : 'class' },
        \ 'scope2kind' : { 'class' : 'c' },
        \ 'ctagsbin'   : 'ripper-tags',
        \ 'ctagsargs'  : ['-f', '-']
        \ }
endif
" }}}

" Rust settings {{{
let g:tagbar_type_rust = {
      \ 'ctagstype' : 'rust',
      \ 'kinds' : [
      \'T:types,type definitions',
      \'f:functions,function definitions',
      \'g:enum,enumeration names',
      \'s:structure names',
      \'m:modules,module names',
      \'c:consts,static constants',
      \'t:traits',
      \'i:impls,trait implementations',
      \]
      \}
" }}}

" Scala settings {{{
let g:tagbar_type_scala = {
      \ 'ctagstype' : 'scala',
      \ 'sro'       : '.',
      \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
      \ ]
      \ }
" }}}

" Systemverilog settings {{{
let g:tagbar_type_systemverilog = {
      \ 'ctagstype': 'systemverilog',
      \ 'kinds' : [
      \'A:assertions',
      \'C:classes',
      \'E:enumerators',
      \'I:interfaces',
      \'K:packages',
      \'M:modports',
      \'P:programs',
      \'Q:prototypes',
      \'R:properties',
      \'S:structs and unions',
      \'T:type declarations',
      \'V:covergroups',
      \'b:blocks',
      \'c:constants',
      \'e:events',
      \'f:functions',
      \'m:modules',
      \'n:net data types',
      \'p:ports',
      \'r:register data types',
      \'t:tasks',
      \],
      \ 'sro': '.',
      \ 'kind2scope' : {
      \ 'K' : 'package',
      \ 'C' : 'class',
      \ 'm' : 'module',
      \ 'P' : 'program',
      \ 'I' : 'interface',
      \ 'M' : 'modport',
      \ 'f' : 'function',
      \ 't' : 'task',
      \},
      \ 'scope2kind' : {
      \ 'package'   : 'K',
      \ 'class'     : 'C',
      \ 'module'    : 'm',
      \ 'program'   : 'P',
      \ 'interface' : 'I',
      \ 'modport'   : 'M',
      \ 'function'  : 'f',
      \ 'task'      : 't',
      \ },
      \}
" }}}

" TypeScript settings {{{
let g:tagbar_type_typescript = {
      \ 'ctagsbin' : 'tstags',
      \ 'ctagsargs' : '-f-',
      \ 'kinds': [
      \ 'e:enums:0:1',
      \ 'f:function:0:1',
      \ 't:typealias:0:1',
      \ 'M:Module:0:1',
      \ 'I:import:0:1',
      \ 'i:interface:0:1',
      \ 'C:class:0:1',
      \ 'm:method:0:1',
      \ 'p:property:0:1',
      \ 'v:variable:0:1',
      \ 'c:const:0:1',
      \ ],
      \ 'sort' : 0
      \ }
" }}}

" TypeScript (vanilla) settings {{{
let g:tagbar_type_typescript = {
      \ 'ctagstype': 'typescript',
      \ 'kinds': [
      \ 'c:classes',
      \ 'n:modules',
      \ 'f:functions',
      \ 'v:variables',
      \ 'v:varlambdas',
      \ 'm:members',
      \ 'i:interfaces',
      \ 'e:enums',
      \ ]
      \ }
" }}}

" Util snipps settings {{{
let g:tagbar_type_snippets = {
      \ 'ctagstype' : 'snippets',
      \ 'kinds' : [
      \ 's:snippets',
      \ ]
      \ }
" }}}

" VHDL settings {{{
let g:tagbar_type_vhdl = {
      \ 'ctagstype': 'vhdl',
      \ 'kinds' : [
      \'d:prototypes',
      \'b:package bodies',
      \'e:entities',
      \'a:architectures',
      \'t:types',
      \'p:processes',
      \'f:functions',
      \'r:procedures',
      \'c:constants',
      \'T:subtypes',
      \'r:records',
      \'C:components',
      \'P:packages',
      \'l:locals'
      \]
      \}
" }}}

" WSDL settings {{{
let g:tagbar_type_xml = {
      \ 'ctagstype' : 'WSDL',
      \ 'kinds'     : [
      \ 'n:namespaces',
      \ 'm:messages',
      \ 'p:portType',
      \ 'o:operations',
      \ 'b:bindings',
      \ 's:service'
      \ ]
      \ }
" }}}

" Xquery settings {{{
let g:tagbar_type_xquery = {
      \ 'ctagstype' : 'xquery',
      \ 'kinds'     : [
      \ 'f:function',
      \ 'v:variable',
      \ 'm:module',
      \ ]
      \ }
" }}}

" XSD settings {{{
let g:tagbar_type_xsd = {
      \ 'ctagstype' : 'XSD',
      \ 'kinds'     : [
      \ 'e:elements',
      \ 'c:complexTypes',
      \ 's:simpleTypes'
      \ ]
      \ }
" }}}

" XSLT settings {{{
let g:tagbar_type_xslt = {
      \ 'ctagstype' : 'xslt',
      \ 'kinds' : [
      \ 'v:variables',
      \ 't:templates'
      \ ]
      \}
" }}}
