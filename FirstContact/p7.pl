# /usr/bin/perl -w
while(<>) {
    print "[$_]";
    s/\.h\./hola/ ;
    print ;
}
