# /usr/bin/perl -w

$fname = "direcciones.txt" ;
$lname = "carta.txt" ;

open(my $letfile, "<", $lname)
    or die "--Error-- Imposible abrir  [$lname]: $!";

while(<$letfile>) {
    $l_direcciones .= $_;
}

close($letfile);


open(my $dirfile, "<", $fname)
    or die "--Error-- Imposible abrir  [$fname]: $!";

while(<$dirfile>) {
    @dirdata .= split ":" ;
    foreach(@dirdata) {print ">$_\n" ; }
}

close($dirfile);



$_ = $carta_modelo ;

@lineas = split "\n" ;

foreach (@lineas){
    print ">$_\n";
}

$tag_dir = "^\\.a\n" ;
$tag_sal = "^\\.s\n" ;

$direccion = "Calle del Pez, 1" ;
$saludo = "Estimado/a Sr./Sra., \n\n" ;

foreach $linea (@lineas){
    $_ = $linea ;
    s/$tag_dir/$direccion\n\n/ ;
    s/$tag_sal/$saludo/ ;
    print "---$_\n";
}
