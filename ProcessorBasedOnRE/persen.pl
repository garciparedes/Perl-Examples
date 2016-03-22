#!/usr/bin/perl

=pod

AUTOR:
    Sergio García Prado

DESCRIPCIÓN:
    Se pide construir un programa en PERL (llamado persen.pl) que lea de la
    entrada estándar o de un fichero cuyo nombre se especifique en la línea de
    órdenes y realice el siguiente procesamiento de los contenidos, mostrando en
    resultado en la salida estándar:

        1. Se dividirá el texto en frases del español (comienzan por mayúscula y
        terminan en punto), de forma que cada frase se muestre en línea separada
        de la siguiente por línea en blanco.

        2. Detrás del punto a final de frase se añadirá la secuencia {**} si la
        frase tiene una longitud múltiplo de 3 y de 5 simultáneamente.

        3. Cada número entero que aparezca dentro de la frase que resulte
        múltiplo de 5 se mostrará rodeado de corchetes (ej: 125 -> [125]).

        4. Cada número romano (no necesariamente correcto) se mostrará entre
        paréntesis (ej: XVII -> (XVII)).

        5. Cualquier fragmento de texto que no obedezca a las reglas anteriores
        no se mostrará en la salida.

        6. Para mostrar el correcto funcionamiento de su programa, deberá
        construir un fichero de entrada que permita comprobar dicho
        funcionamiento. Llámelo 'test.txt'.

QUÉ ENTREGAR:
    Un fichero comprimido (en formato ZIP) que contenga el programa en perl y el
    fichero de entrada de prueba. El fichero ZIP tendrá un nombre que coincida
    con su primer apellido (sin acentos y usando n en lugar de ñ si es
    necesario).

FECHA LÍMITE:
    30-Marzo-2016 a las 23:00

=cut

if($#ARGV+1 == 1){
    $fileName = $ARGV[0];

    open(my $file, "<", $fileName)
        or die "--ERROR-- Imposible abrir [$fileName]: $!";

    while (<$file>) {
        $text .= $_;
    }

    close($file);

} else {
    while(<STDIN>) {
        $text .= $_;
    }
}

print "\n\n[\n$text]\n\n\n\n";

$tagPhrase = "([A-Z][^.]*.)";
$tagNumber = "\\b([0-9]*[05])\\b";
$tagRoman = "\\b([IVXLCDM]+)\\b";


while ($text =~ /$tagPhrase/g) {
    my $line = $1;

    $line =~ s/$tagNumber/[$1]/g;
    $line =~ s/$tagRoman/($1)/g;

    my $lenLine = length($line);
    if($lenLine % 5 == 0 and $lenLine % 3 ==0) {
            $line.="**";
    }

    print "$line\n\n";
}

print "\n\n";
