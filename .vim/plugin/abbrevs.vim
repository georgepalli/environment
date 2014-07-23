"
" Abbreviations to make life easier :)
"

ab sout System.out.println("");<Left><Left><Left>
ab serr System.err.println("");<Left><Left><Left>


" Commenting

ab #b /************************************************************************
ab #e ************************************************************************/
ab #l /*---------------------------------------------------------------------*/

ab ## #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
ab #s #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 



ab #d #define
ab #i #include
ab twcd <code></code>

ab cm my @cmd = ();
ab lcmd $logger->debug("Executing command @cmd");
ab res my $result = `@cmd`;
ab lres $logger->error("Command resulted in $?");$logger->error("Command returned:\n'$result'"); 

ab ldb $logger->debug("");
ab ler $logger->error("");
ab lif $logger->info("");
ab lwn $logger->warn("");
ab ldm $logger->warn(sub { Dumper () } );
