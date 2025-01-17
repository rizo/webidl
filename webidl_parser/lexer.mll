{
    open Lexing
    open Parser

    let token_table = Hashtbl.create 63

    let () =
      (* let open Parser in *)
      List.iter (fun (key, token) -> Hashtbl.add token_table key token)
        Keyword.[
          unsigned , UNSIGNED ;
          byte , BYTE ;
          octet , OCTET ;
          short , SHORT ;
          long , LONG ;
          usvstring , USVSTRING ;
          domstring , DOMSTRING ;
          bytestring , BYTESTRING ;
          unrestricted , UNRESTRICTED ;
          float , FLOAT ;
          double , DOUBLE ;
          any , ANY ;
          bigint , BIGINT ;
          (* void , VOID ; *)
          boolean , BOOLEAN ;
          object_ , OBJECT ;
          symbol, SYMBOL ;
          or_ , OR ;
          true_ , TRUE ;
          false_ , FALSE ;
          null , NULL ;
          undefined , UNDEFINED ;
          infinity_ , INFINITY ;
          nan_ , NAN ;
          setter , SETTER ;
          getter , GETTER ;
          deleter , DELETER ;
          constructor , CONSTRUCTOR ;
          stringifier , STRINGIFIER ;
          maplike , MAPLIKE ;
          setlike , SETLIKE ;
          iterable , ITERABLE ;
          promise , PROMISE ;
          record , RECORD ;
          sequence , SEQUENCE ;
          namespace , NAMESPACE ;
          callback , CALLBACK ;
          partial , PARTIAL ;
          mixin , MIXIN ;
          interface , INTERFACE ;
          dictionary , DICTIONARY ;
          enum , ENUM ;
          includes , INCLUDES ;
          inherit_ , INHERIT ;
          attribute , ATTRIBUTE ;
          typedef , TYPEDEF ;
          const , CONST ;
          readonly , READONLY ;
          required , REQUIRED ;
          static , STATIC ;
          optional , OPTIONAL ;
          int8array , INT8ARRAY ;
          int16array , INT16ARRAY ;
          int32array , INT32ARRAY ;
          uint8array  , UINT8ARRAY ;
          uint16array , UINT16ARRAY ;
          uint32array , UINT32ARRAY ;
          uint8clampedarray , UINT8CLAMPEDARRAY;
          float32array , FLOAT32ARRAY ;
          float64array , FLOAT64ARRAY ;
          arraybuffer , ARRAYBUFFER ;
          dataview , DATAVIEW ;
          frozenarray , FROZENARRAY ;
        ]
}

let decdigit = ['0'-'9']
let hexdigit = ['0'-'9' 'A' - 'F' 'a' - 'F']
let octdigit = ['0'-'7']
let decint = '-'? ['1'-'9'] decdigit*
let hexint = '-'? '0' ['X' 'x'] hexdigit+
let octint = '0' octdigit*
let int = decint | hexint | octint
let float_no_exp = decdigit+ '.' decdigit* | '.' decdigit+
let float_exp_part = ['E' 'e'] ['+' '-']? decdigit+
let float = '-'? (float_no_exp float_exp_part? | decdigit+ float_exp_part)
let identifier = ['A'-'Z' 'a'-'z' '_'] ['0'-'9' 'A'-'Z' 'a'-'z' '_' '-']*
let spaces = ['\t'' ']+
let other = [^'\t''\r''A'-'Z''0'-'9''a'-'z']
let comment_line = ("//"[^'\n''\r']*'\n')
let comment_region_start = "/*"
let string = '"' [^'"']* '"'

rule read = parse
  | ['\n''\r'] { new_line lexbuf; read lexbuf }
  | spaces { read lexbuf }
  | comment_line { new_line lexbuf; read lexbuf }
  | comment_region_start { skip_comment lexbuf }
  | '"' ([^'"']* as str) '"' { STRING str }
  | "*" { ASTERISK }
  | "(" { LPAR }
  | ")" { RPAR }
  | "[" { LBRACKET }
  | "]" { RBRACKET }
  | "{" { LBRACE }
  | "}" { RBRACE }
  | "<" { LT }
  | ">" { GT }
  | "-Infinity" { MINUSINFINITY }
  | "?" { QUESTION }
  | "=" { EQUAL }
  | "," { COMMA }
  | ":" { COLON }
  | ";" { SEMICOLON }
  | "..." { ELLIPSIS }
  | int { INTVAL (int_of_string (Lexing.lexeme lexbuf)) }
  | float { FLOATVAL (float_of_string (Lexing.lexeme lexbuf)) }
  | identifier as id {
      try
        Hashtbl.find token_table id
      with
      | Not_found -> IDENTIFIER id
    }
  | eof { EOF }
  | _  { raise Parsing.Parse_error }

and skip_comment = parse
  | "*/" { read lexbuf }
  | '\n' { new_line lexbuf; skip_comment lexbuf }
  | [^ '\n'] { skip_comment lexbuf }
  | eof { failwith "Unterminated comment" }
