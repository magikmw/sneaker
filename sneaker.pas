Program sneaker;
{A simple console number system converter.}

{
Copyright (c) 2012, Michał Walczak
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
}

{Library declaration.}
uses crt;

{Global variable and constant declaration.}
var
numsysstr:STRING;
converteestr:STRING;
{numsys:LONGINT;
convertee:LONGINT;}

bin:STRING;
oct:STRING;
dec:STRING;
hex:STRING;

{Procedures and functions declarations.}
Procedure binary(input:STRING);
	var
	nbin:LONGINT;
	noct:LONGINT;
	ndoc:LONGINT;
	nhex:STRING;
Begin



end;

Procedure octal(input:STRING);
	var
	nbin:LONGINT;
	noct:LONGINT;
	ndoc:LONGINT;
	nhex:STRING;
Begin



end;

Procedure decimal(input:STRING);
	var
	nbin:LONGINT;
	noct:LONGINT;
	ndoc:LONGINT;
	nhex:STRING;
Begin



end;

Procedure hexadecimal(input:STRING);
	var
	nbin:LONGINT;
	noct:LONGINT;
	ndoc:LONGINT;
	nhex:STRING;
Begin



end;

Begin {Program begin}

if ParamCount <> 2 then begin
	writeln('Please specify the numeric system and the number - i.e. sneaker bin 101010');
	exit;
end
else begin
	numsysstr:=ParamStr(1);
	converteestr:=ParamStr(2);
	{val(numsysstr, numsys);
	val(converteestr, convertee);}
end;

if numsysstr = 'bin' then
	begin
		bin:=converteestr;
		binary(bin);
	end
else if numsysstr = 'oct' then
	begin
		oct:=converteestr;
		octal(oct);
		writeln('Not yet implemented.')
	end
else if numsysstr = 'dec' then
	begin
		dec:=converteestr;
		decimal(dec);
		writeln('Not yet implemented.')
	end
else if numsysstr = 'hex' then
	begin
		hex:=converteestr;
		hexadecimal(hex);
		writeln('Not yet implemented.')
	end;

writeln(converteestr)

End. {Program end}