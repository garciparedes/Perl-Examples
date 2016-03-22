#!/usr/bin/perl

=pod

AUTOR:
    Sergio García Prado

GIT HISTORY:
    https://github.com/garciparedes/Perl-Examples/commits/master/ProcessorBasedOnRE

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



#
# main()
#
# Subrutina main. Es quien se encarga de gestionar la ejecución del programa.
#
sub main {

    if($#ARGV+1 == 1){
        $text = readFile();
    } else {
        $text = readSTDIN()
    }

     print customizeText($text);
}



#
# customizeText()
#
# Esta es la rutina encargada de realizar todos los cambios en el texto base que
# indican las especificaciones del programa.
#
sub customizeText {
    my ($text) = @_;

    #
    # Expresiones regulares:
    #   tagPhrase: Representa el lenguaje de las frases en castellano.
    #   tagNumber: Representa el lenguaje de los numeros multiplos de 5.
    #   tagRoman: Representa el lenguaje de los numeros romanos.
    #
    $tagPhrase = "([A-Z][^.]*.)";
    $tagNumber = "\\b([0-9]*[05])\\b";
    $tagRoman = "\\b([IVXLCDM]+)\\b";

    #
    # Dividimos el texto base en frases para seguidamente buscar numeros enteros
    # multiplos de 5, numeros romanos y por ultimo comprobamos si la longitud de
    # la frase es multiplo de 3 y 5 para realizar los cambios correspondientes
    # en cada caso.
    #
    while ($text =~ /$tagPhrase/g) {
        my $line = $1;

        $line =~ s/$tagNumber/[$1]/g;
        $line =~ s/$tagRoman/($1)/g;

        my $lenLine = length($line);
        if($lenLine % 5 == 0 and $lenLine % 3 ==0) {
                $line.="**";
        }
        $finalText .= "$line\n\n";

    }
    return $finalText;
}



#
# readFile()
#
# Subrutina encargada de leer desde fichero cuyo nombre se obtiene por la
# linea de comandos.
#
sub readFile {
    $fileName = $ARGV[0];

    open(my $file, "<", $fileName)
        or die "--ERROR-- Imposible abrir [$fileName]: $!";

    while (<$file>) {
        $text .= $_;
    }

    close($file);

    return $text;
}



#
# readSTDIN()
#
# Subrutina encargada de leer desde la entreada estandar.
#
sub readSTDIN {
    while(<STDIN>) {
        $text .= $_;
    }
    return $text;
}



#
# Llamada a la subrutina main, que es la encagada de gestionar la ejecución del
# programa.
#
main();
