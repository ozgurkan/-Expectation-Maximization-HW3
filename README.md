# Expectation And Maximization 

In Expectation-Maximization algorithm there are two steps: Expectation step and Maximization step. 

In the expectation step, background residue frequencies are calculated based on those residues that are not in the initially aligned sites.  Column specific residues are calculated for each position in the initial motif alignment. Using this information, the probability of finding the site at any position in the sequences can then be calculated.  

Residues not in a motif are background frequencies used to determine probability of finding site at any position in a sequence to fit motif model. 

An initial, random alignment for 6 sequences are given here. The motif we are searching for is six bases wide (motifs at each sequence are highlighted).   
