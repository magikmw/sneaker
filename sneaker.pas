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

octbin:array[0..7] of STRING;

{Procedures and functions declarations.}

Procedure octbintablefill;
	Begin
		{set the table}
		octbin[0]:='000';
		octbin[1]:='001';
		octbin[2]:='010';
		octbin[3]:='011';
		octbin[4]:='100';
		octbin[5]:='101';
		octbin[6]:='110';
		octbin[7]:='111';
	end;

Function reverse(s:string):string; {stolen from rosettacode}
var i:integer;
var tmp:char;
begin
    for i:=1 to length(s) div 2 do
      begin
       tmp:=s[i];
       s[i]:=s[length(s)+1-i];
       s[length(s)+1-i]:=tmp;
       reverse:=s;
      end;
end;

Procedure binary(input:STRING);
	var
	tmpstr:STRING;
	counter:INTEGER;
	x:INTEGER;
	i:INTEGER;
	ii:INTEGER;
	Begin

		{first bin to oct}
		if byte(input[0]) mod 3 = 0 then
		begin
			counter:=byte(input[0]) div 3;
			writeln('Counter is = ', counter);

			for i:=0 to counter-1 do
			begin
				x:=3*i;

				if i > 0 then
				begin
				tmpstr:=Copy(input, x+1, 3);
				ii:=0;

					while ii <> 8 do
					begin
						if tmpstr = octbin[ii] then
						begin
							Str(ii, tmpstr);
							oct:=Concat(oct,tmpstr);
							ii:=8;
						end
						else ii:=ii+1;
					end;
				writeln(oct);
				end

				else begin
				tmpstr:=Copy(input, i+1, 3);
				ii:=0;

				while ii <> 8 do
				begin
					if tmpstr = octbin[ii] then
					begin
						Str(ii, tmpstr);
						oct:=Concat(oct,tmpstr);
						ii:=8;
					end
					else ii:=ii+1;
				end;
				writeln(oct);
				end;
			end;
		end;

	writeln('Input lenght = ',byte(input[0]));


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

	octbintablefill;

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
			writeln('You requested conversion for binary ', converteestr, '.');
		end
	else if numsysstr = 'oct' then
		begin
			oct:=converteestr;
			octal(oct);
			writeln('You requested conversion for octal ', converteestr, '.');
			writeln('Not yet implemented.')
		end
	else if numsysstr = 'dec' then
		begin
			dec:=converteestr;
			decimal(dec);
			writeln('You requested conversion for decimal ', converteestr, '.');
			writeln('Not yet implemented.')
		end
	else if numsysstr = 'hex' then
		begin
			hex:=converteestr;
			hexadecimal(hex);
			writeln('You requested conversion for hexadecimal ', converteestr, '.');
			writeln('Not yet implemented.')
		end;

	writeln('Binary:      ', bin);
	writeln('Octal:       ', oct);
	writeln('Decimal:     ', dec);
	writeln('Hexacedimal: ', hex);

End. {Program end}