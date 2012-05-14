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
bin:STRING;
oct:STRING;
dec:STRING;
hex:STRING;
octbin:array[0..7] of STRING;
dechex:array[0..15] of STRING;

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

Procedure dechextablefill;
	begin
		{set the table}
		dechex[0]:='0';
		dechex[1]:='1';
		dechex[2]:='2';
		dechex[3]:='3';
		dechex[4]:='4';
		dechex[5]:='5';
		dechex[6]:='6';
		dechex[7]:='7';
		dechex[8]:='8';
		dechex[9]:='9';
		dechex[10]:='A';
		dechex[11]:='B';
		dechex[12]:='C';
		dechex[13]:='D';
		dechex[14]:='E';
		dechex[15]:='F';
	end;

Function reverse(s:string):string; {stolen from rosettacode}
var i:longint;
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

Function power(x:longint; y:longint):longint;
var i:longint;
var z:longint;
begin
	if y = 0 then power:=1
	else
	begin
		z:=x;
		for i:=1 to y-1 do x:=x*z;
		power:=x;
	end;
end;

Procedure binary(input:STRING);
	var
	tmpstr:STRING;
	tmpstr2:STRING;
	counter:longint;
	tmpint:longint;
	filling:STRING;
	x:longint;
	i:longint;
	j:longint;
	y:longint;
	z:longint;

	Begin

		{first bin to oct}
		tmpstr2:=input;
		tmpint:=byte(tmpstr2[0]) mod 3;
		if tmpint <> 0 then
		begin
			if tmpint = 1 then filling:='00'
			else filling:='0';

			tmpstr2:=Concat(filling,tmpstr2);
		end;

		counter:=byte(tmpstr2[0]) div 3;

		for i:=0 to counter-1 do
		begin
			x:=3*i;

			if i > 0 then
			begin
			tmpstr:=Copy(tmpstr2, x+1, 3);
			y:=0;

				while y <> 8 do
				begin
					if tmpstr = octbin[y] then
					begin
						Str(y, tmpstr);
						oct:=Concat(oct,tmpstr);
						y:=8;
					end
					else y:=y+1;
				end;
			end

			else begin
			tmpstr:=Copy(tmpstr2, i+1, 3);
			y:=0;

			while y <> 8 do
			begin
				if tmpstr = octbin[y] then
				begin
					Str(y, tmpstr);
					oct:=Concat(oct,tmpstr);
					y:=8;
				end
				else y:=y+1;
			end;
			end;
		end;

		{then bin to dec}
		tmpstr2:=input;
		tmpint:=0;
		counter:=byte(tmpstr2[0]);
		y:=0;
		for i:=counter downto 0 do
		begin
			val(tmpstr2[i],z);
			x:=z * power(2,y);
			tmpint:=tmpint+x;
			y:=y+1;
		end;
		str(tmpint, dec);

		{finally, bin to hex}
		tmpstr2:=input;
		tmpint:=byte(tmpstr2[0]) mod 4;
		if tmpint <> 0 then
		begin
			if tmpint = 1 then filling:='000'
			else if tmpint = 2 then filling:='00'
			else if tmpint = 3 then filling:='0';
			tmpstr2:=Concat(filling,tmpstr2);
		end;

		counter:=byte(tmpstr2[0]) div 4;

		for i:=1 to counter do
		begin
			tmpint:=0;
			x:=i*4;
			z:=0;
			j:=0;
			for y:=0 to 3 do
			begin
				val(tmpstr2[x-y], z);
				tmpint:=z*power(2,j)+tmpint;
				j:=j+1;
			end;
			hex:=Concat(hex,dechex[tmpint]);
		end;

		
	writeln('Input lenght = ',byte(input[0]));


	end;

Procedure octal(input:STRING);
	{var}

	Begin



	end;

Procedure decimal(input:STRING);
	{var}

	Begin



	end;

Procedure hexadecimal(input:STRING);
	{var}

	Begin



	end;

Begin {Program begin}

	octbintablefill;
	dechextablefill;

	if ParamCount <> 2 then
	begin
		writeln('Usage: sneaker [bin,oct,dec,hex] [number] ie. sneaker bin 101010');
		exit;
	end
	else begin
		numsysstr:=ParamStr(1);
		converteestr:=ParamStr(2);
		if numsysstr <> 'bin' then
			if numsysstr <> 'oct' then
				if numsysstr <> 'dec' then
					if numsysstr <> 'hex' then
					begin
						writeln('Valid system parameters are [bin, oct, dec, hex].');
						writeln('Usage: sneaker [bin,oct,dec,hex] [number] ie. sneaker bin 101010');
						exit;
					end;
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