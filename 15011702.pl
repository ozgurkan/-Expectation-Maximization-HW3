#!/usr/bin/perl
#ÖZGÜR KAN ->15011702
open (DNA, '<','Database.txt') or die "Can't open database";
@record = <DNA> ;
$size = @record;
print "number of DNA in the database: $size \n";
for (my $i=0; $i < $size; $i++) {
   print "@record[$i]";
}  
close(DNA) or die "Can't open database";
print ("\n\n");
$toplam_A=0;
$toplam_C=0;
$toplam_G=0;
$toplam_T=0;

for (my $k=0; $k < $size; $k++) {
	$dna_no=$k+1;
	print ("\n $dna_no.DNA=====>			");
	for ($i = 0 ; $i < length(@record[$k]); $i++ )  { 
		@character_array[$i] = substr( @record[$k], $i, 1);
		if(@character_array[$i] eq 'A'){
			$toplam_A=$toplam_A+1;
		}
		elsif(@character_array[$i] eq 'C'){
			$toplam_C=$toplam_C+1;
		}
		elsif(@character_array[$i] eq 'G'){
			$toplam_G=$toplam_G+1;
		}
		elsif(@character_array[$i] eq 'T'){
			$toplam_T=$toplam_T+1;
		}			
		print " @character_array[$i]";	
	}	
}
$toplam_karakter=$toplam_A+$toplam_C+$toplam_G+$toplam_T;
printf("\n\n ENTER A RANDOM ALIGMENT LENGHT:");
    $random_aligment_lenght = <>;

for (my $i=0; $i < $size; $i++) {
	$dna_no=$i+1;
	print "\n ENTER A $dna_no. ROW RANDOM ALIGMENT START POSITION :";
	$position[$i] = <STDIN>;
} 

my @matrix;
print ("\n");
for (my $k=0; $k < $size; $k++) {
	$p=$position[$k];
	for ($i = 0 ; $i < $random_aligment_lenght; $i++ )  { 
		$matrix[$k][$i] = substr( @record[$k], $p, 1);		
		#print " $matrix[$k][$i]";
		$p=$p+1;	
	}	
}  

for (my $k=0; $k < $size; $k++) {
	for ($i = 0 ; $i < $random_aligment_lenght; $i++ )  { 
		print " $matrix[$k][$i]";
		if($matrix[$k][$i] eq 'A'){
			$toplam_A=$toplam_A-1;
		}
		elsif($matrix[$k][$i] eq 'C'){
			$toplam_C=$toplam_C-1;
		}
		elsif($matrix[$k][$i] eq 'G'){
			$toplam_G=$toplam_G-1;
		}
		elsif($matrix[$k][$i] eq 'T'){
			$toplam_T=$toplam_T-1;
		}				
	}
	print("\n");	
}  
    my @matrix1;
    $indis=0;
    $matrix1[0][$indis]=$toplam_A;
    $matrix1[1][$indis]=$toplam_C;
    $matrix1[2][$indis]=$toplam_G;
    $matrix1[3][$indis]=$toplam_T;
    $indis=$indis+1;
    
print("\n");
for (my $k=0; $k < $size; $k++) {
	$toplam_AA=0;
	$toplam_CC=0;
	$toplam_GG=0;
	$toplam_TT=0;
	for ($i = 0 ; $i < $size; $i++ )  { 
		#print " $matrix[$i][$k]";
		if($matrix[$i][$k] eq 'A'){
			$toplam_AA=$toplam_AA+1;
		}
		elsif($matrix[$i][$k] eq 'C'){
			$toplam_CC=$toplam_CC+1;
		}
		elsif($matrix[$i][$k] eq 'G'){
			$toplam_GG=$toplam_GG+1;
		}
		elsif($matrix[$i][$k] eq 'T'){
			$toplam_TT=$toplam_TT+1;
		}							
	}
	$matrix1[0][$indis]=$toplam_AA;
	$matrix1[1][$indis]=$toplam_CC;
	$matrix1[2][$indis]=$toplam_GG;
	$matrix1[3][$indis]=$toplam_TT;
	$indis=$indis+1;
	
}
print("\n   |");
for (my $k=0; $k < $random_aligment_lenght+1; $k++) {
		print "  $k ";		
}  
print("\n-------------------------------------------\n");
for (my $k=0; $k < 4; $k++) {
	if($k==0){
		print " A|";
	}
	elsif($k==1){
		print " C|";
	}
	elsif($k==2){
		print " G|";
	}
	elsif($k==3){
		print " T|";
	}
	for ($i = 0 ; $i < $size+1; $i++ )  { 
		print "  $matrix1[$k][$i] ";				
	}
	print("\n");	
}   

#print("\n$toplam_karakter");
$parca_karakter=($toplam_karakter-$toplam_A-$toplam_C-$toplam_G-$toplam_T)/$random_aligment_lenght;
#print("\n$parca_karakter");

my @matrix2;
for (my $k=0; $k < 4; $k++) {
	for ($i = 0 ; $i < $size+1; $i++ )  { 
		
		if($i eq 0){
		$matrix2[$k][$i]=$matrix1[$k][$i]/($toplam_A+$toplam_C+$toplam_G+$toplam_T);
		}else{
		$matrix2[$k][$i]=$matrix1[$k][$i]/$parca_karakter;
		}
		#printf("%.2f  ", $matrix2[$k][$i]);
		#print "  $matrix2[$k][$i] ";				
	}
	print("\n");	
} 

print("\n   |");
for (my $k=0; $k < $random_aligment_lenght+1; $k++) {
		print "   $k  ";		
}  
print("\n-------------------------------------------\n");
for (my $k=0; $k < 4; $k++) {
	if($k==0){
		print " A|";
	}
	elsif($k==1){
		print " C|";
	}
	elsif($k==2){
		print " G|";
	}
	elsif($k==3){
		print " T|";
	}
	for ($i = 0 ; $i < $size+1; $i++ )  { 
		printf("%.2f  ", $matrix2[$k][$i]);				
	}
	print("\n");	
}  

my @matrix3;
for (my $k=0; $k < 4; $k++) {
	for ($i = 0 ; $i < $size+1; $i++ )  { 		
		if($i eq 0){
		$matrix3[$k][$i]=($matrix1[$k][$i]+0.25)/($toplam_A+$toplam_C+$toplam_G+$toplam_T+1);
		}else{
		$matrix3[$k][$i]=($matrix1[$k][$i]+0.25)/($parca_karakter+1);
		}
		#printf("%.2f  ", $matrix3[$k][$i]);
		#print "  $matrix3[$k][$i] ";				
	}
	print("\n");	
} 

print("\n   |");
for (my $k=0; $k < $random_aligment_lenght+1; $k++) {
		print "   $k  ";		
}  
print("\n-------------------------------------------\n");
for (my $k=0; $k < 4; $k++) {
	if($k==0){
		print " A|";
	}
	elsif($k==1){
		print " C|";
	}
	elsif($k==2){
		print " G|";
	}
	elsif($k==3){
		print " T|";
	}
	for ($i = 0 ; $i < $size+1; $i++ )  { 
		printf("%.2f  ", $matrix3[$k][$i]);				
	}
	print("\n");	
}  