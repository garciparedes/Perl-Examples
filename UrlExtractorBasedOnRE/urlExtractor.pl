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
    #TODO
}



#
# Llamada a la subrutina main, que es la encagada de gestionar la ejecución del
# programa.
#
main();
