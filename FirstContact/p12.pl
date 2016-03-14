# /usr/bin/perl -w

while(<>) {
    $carta_modelo .= $_ ;
}

print "!!!!!!!!!!!!!!".$carta_modelo."!!!!!!!!!\n" ;

$_ = $carta_modelo ;
s/\.a\./Calle Pez/;
s/\.s\./Estimado Sr./ ;
print ;

$_ = $carta_modelo ;
s/\.a\./Calle Potro, 13/ ;
s/\.s\./Estimado Sra. Martirio./ ;
print ;
