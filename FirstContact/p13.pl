# /usr/bin/perl -w

while(<>) {
    $carta_modelo .= $_ ;
}

$_ = $carta_modelo ;

@lineas = split "\n" ;

foreach (@lineas){
    print ">$_\n";
}

$tag_dir = "^\\.a\$" ;
$tag_sal = "^\\.s\$" ;

$direccion = "Calle del Pez, 1" ;
$saludo = "Estimado/a Sr./Sra., \n\n" ;

foreach $linea (@lineas){
    $_ = $linea ;
    s/$tag_dir/$direccion\n\n/ ;
    s/$tag_sal/$saludo/ ;
    print "---$_\n";
}
