" Vim syntax file
" Language: Esper Programming Language
" Maintainer: Daniyar Itegulov <ditegulov@gmail.com>
" Latest Revision: 16 December 2015

if exists("b:current_syntax")
    finish
endif

syn keyword eplInclude uses nextgroup=eplPackageName skipwhite
syn keyword eplModule module nextgroup=eplPackageName skipwhite
syn match eplPackageName '[A-Za-z.]\+' contained


syn keyword eplCreateSchema create nextgroup=eplSchema skipwhite
syn keyword eplSchema schema nextgroup=eplSchemaName skipwhite

syn region eplAfterCreateSchema start="create schema" end=";" transparent contains=eplSchemaName,eplSchemaArgumentsBlock
syn match eplSchemaName '[A-Za-z0-9]\+' nextgroup=eplSchemaArgumentsBlock skipwhite contained

syn region eplSchemaArgumentsBlock start="(" end=")" transparent contains=eplType,eplString contained
syn keyword eplType string BigDecimal double long int Map contained

syn keyword eplSchemaInherits inherits nextgroup=eplSchemaName skipwhite


syn keyword eplCreateVariable create nextgroup=eplVariable skipwhite
syn keyword eplVariable variable nextgroup=eplVariableName skipwhite

syn region eplAfterCreateVariable start="create variable" end=";" oneline transparent contains=eplVariableName
syn match eplVariableName '[A-Za-z]\+' contained


syn keyword eplCreateTable create nextgroup=eplTable skipwhite
syn keyword eplTable table nextgroup=eplTableName skipwhite

syn region eplAfterCreateTable start="create table" end=";" transparent contains=eplTableName,eplTableArgumentsBlock
syn match eplTableName '[A-Za-z0-9]\+' nextgroup=eplTableArgumentsBlock skipwhite contained

syn region eplTableArgumentsBlock start="(" end=")" transparent contains=eplType,eplPrimary,eplKey contained
syn keyword eplPrimary primary nextgroup=eplKey skipwhite contained
syn keyword eplKey key contained


syn keyword eplCreateExpression create nextgroup=eplExpression skipwhite
syn keyword eplExpression expression nextgroup=eplExpressionName skipwhite

syn region eplAfterCreateExpression start="create expression" end=";" transparent contains=eplExpressionName,eplExpressionArgumentsBlock
syn match eplExpressionName '[A-Za-z0-9]\+' nextgroup=eplExpressionArgumentsBlock skipwhite contained

syn region eplExpressionArgumentsBlock start="{" end="}" transparent contains=eplString,eplCastStatement contained


syn keyword eplCreateDataflow create nextgroup=eplDataflow skipwhite
syn keyword eplDataflow dataflow nextgroup=eplDataflowName skipwhite contained

syn region eplAfterCreateDataflow start="create dataflow" end=";" transparent contains=eplDataflowName,eplDataflowArgumentsBlock
syn match eplDataflowName '[A-Za-z0-9]\+' nextgroup=eplDataflowArgumentsBlock skipwhite contained

syn region eplDataflowArgumentsBlock start="dataflow" end=";" transparent contains=eplString contained


syn keyword eplCreateWindow create nextgroup=eplWindow skipwhite
syn keyword eplWindow window nextgroup=eplWindowName skipwhite contained

syn region eplAfterCreateWindow start="create window" end=";" transparent contains=eplWindowName,eplWindowArgumentsBlock
syn match eplWindowName '[A-Za-z0-9]\+' nextgroup=eplWindowArgumentsBlock skipwhite contained

syn region eplWindowArgumentsBlock start="window" end=";" transparent contains=eplString contained


syn match eplAnnotation '@[^(]*'

syn keyword eplInsert insert nextgroup=eplInto skipwhite
syn keyword eplInto into nextgroup=eplSchemaName skipwhite

syn keyword eplUpdate update nextgroup=eplSet skipwhite
syn keyword eplSet set

syn keyword eplOn on nextgroup=eplSchemaName skipwhite
syn region eplAfterSomething start="on" end=";" oneline transparent contains=eplSchemaName
syn region eplAfterSomething start="merge" end=";" oneline transparent contains=eplSchemaName

syn keyword eplMerge merge nextgroup=eplSchemaName skipwhite

syn match eplCastStatement 'cast(.*)' contains=eplCast,eplAs,eplType
syn keyword eplCast cast contained
syn keyword eplAs as contained

syn keyword eplWhere where
syn keyword eplWhen when
syn keyword eplNull null
syn keyword eplThen then
syn keyword eplOther select from matched delete

syn keyword eplNot not
syn match eplString '\'[^']*\''

let b:current_syntax = "epl"
hi def link eplInclude          Include
hi def link eplModule           PreProc
hi def link eplPackageName      String
hi def link eplSchemaName       Identifier
hi def link eplVariableName     Type
hi def link eplTableName        Type
hi def link eplExpressionName   Function
hi def link eplDataflowName     Function
hi def link eplCreateSchema     Keyword
hi def link eplCreateVariable   Keyword
hi def link eplCreateTable      Keyword
hi def link eplCreateExpression Keyword
hi def link eplCreateDataflow   Keyword
hi def link eplCreateWindow     Keyword
hi def link eplWindow           Keyword
hi def link eplDataflow         Keyword
hi def link eplExpression       Keyword
hi def link eplTable            Keyword
hi def link eplSchema           Keyword
hi def link eplVariable         Keyword
hi def link eplPrimary          Keyword
hi def link eplKey              Keyword
hi def link eplType             Type
hi def link eplOn               Conditional
hi def link eplNull             Constant
hi def link eplMerge            Keyword
hi def link eplWhen             Conditional
hi def link eplWhere            Conditional
hi def link eplThen             Conditional
hi def link eplInsert           Statement
hi def link eplInto             Statement
hi def link eplUpdate           Statement
hi def link eplSet              Statement
hi def link eplOther            Statement
hi def link eplCast             Statement
hi def link eplAs               Statement
hi def link eplNot              Special
hi def link eplString           String
hi def link eplSchemaInherits   Statement
hi def link eplAnnotation       Label
