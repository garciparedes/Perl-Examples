#!/usr/bin/perl
=pod

AUTOR:
    Sergio García Prado
GIT HISTORY:
    https://github.com/garciparedes/Perl-Examples/commits/master/UrlExtractorBasedOnRE

DESCRIPCIÓN:

    Se pide construir un programa (preferiblemente, sea en Java, sea en PERL) o
    script (en BASH) que tome como entrada la entrada estándar o una URL que
    representa la dirección de una página web y presente en la salida la
    relación de enlaces a documentos o imágenes contenida en esa página web.
    Para ello, se asumirán las siguientes condiciones:

        1. Si el enlace aparece en una etiqueta "<A>", aparecerá como argumento
        del atributo HREF. En este caso, si la URL es url_a e mostrará en la
        salida [A] url_a en una línea por url_a.

        2. Si el enlace aparece en una etiqueta "<IMG>", aparecerá como
        argumento del atributo SRC. En este caso, si la URL es url_img e
        mostrará en la salida [I] url_a en una línea por url_img.

        3. Sólo se mostrará la URL cuando esté construída de acuerdo con las
        especificaciones de una URL
        (https://www.w3.org/Addressing/URL/url-spec.txt).

        4. Tenga en cuenta que tanto el nombre de etiqueta HTML (sea A o IMG),
        así como los atributos (sea HREF o SRC) podrán aparecer en mayúscula o
        en minúsculas. El programa deberá ignorar esta diferencia.

        5. Cualquier secuencia de caracteres cuya estructura se ajuste al
        estándar de una URL y no aparezca dentro de las etiquetas indicadas más
        arriba deberá ignorarse.

QUÉ ENTREGAR:
    Un fichero comprimido (en formato ZIP) que contenga el programa desarrollado
    y un fichero de entrada de prueba (en HTML). El fichero ZIP tendrá un nombre
    que coincida con su primer apellido (sin acentos y usando n en lugar de ñ si
    es necesario).

FECHA LÍMITE:
    2-Abril-2016 a las 23:00
=cut



#
# main()
#
# Subrutina main. Es quien se encarga de gestionar la ejecución del programa.
#
sub main {
    my $text = getText();

    #print "$text\n";
    findURLs($text);
}


#
# findURLs()
#
# TODO
#
sub findURLs() {
    my ($text) = @_;

    $tagUrlA = "(<a[^>]*href=\"([^\"]*)\"[^>]*>)";
    $tagUrlImg = "(<img[^>]*src=\"([^\"]*)\"[^>]*>)";

    while ($text =~ /$tagUrlA/g) {

        print "[A] $2\n";

    }

    while ($text =~ /$tagUrlImg/g) {

        print "[I] $2\n";

    }
}



#
# getText()
#
# Subrutina encagada de obtener el texto de entrada. Este puede provenir de
# distintas vias:
#   - Entrada estandar
#   - Ruta de un fichero como argumento al programa.
#   - URL de internet como argumento al programa.
#
sub getText {
    if ($#ARGV+1 == 1){
        $input = $ARGV[0];
        if (isURL($input)){
            return readURL($input);
        } else {
            return readFile($input);
        }
    } else {
        return readSTDIN() ;
    }
}



#
# isURL()
#
# Subrutina que devuelve un 1 en el caso de que el argumento sea una URL o un 0
# en caso contrario.
#
sub isURL {
    #TODO Hacer expression regular para las url más precisa.

    $tagURL = "(https?://.*)";
    my ($text) = @_;

    if ($text =~ /$tagURL/) {
        return 1;
    } else {
        return 0;
    }
}



#
# readFile()
#
# Subrutina encargada de leer desde fichero cuyo nombre se obtiene por la
# linea de comandos.
#
sub readFile {
    my ($fileName) = @_;

    open(my $file, "<", $fileName)
        or die "--ERROR-- Imposible abrir [$fileName]: $!";

    while (<$file>) {
        $text .= $_;
    }

    close($file);

    return $text;
}



#
# readURL()
#
# Subrutina encargada de obtener el fichero localizado en una URL pasada como
# argumento.
#
sub readURL {
    my ($input) = @_;

    use HTTP::Tiny;

    my $response = HTTP::Tiny->new->get($input);

    if ($response->{success}) {
        return $response->{content};
    } else {
        die "--ERROR-- Imposible obtener [$input]: $!";
    }
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
