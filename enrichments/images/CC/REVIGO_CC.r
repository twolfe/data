

# A plotting R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800


# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );
# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );


# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency_%","plot_X","plot_Y","plot_size","log10_p_value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0005623","cell",53.553,-1.383, 3.526, 6.722,-1.6609,0.991,0.000),
c("GO:0009341","beta-galactosidase complex", 0.048, 6.094,-2.412, 3.673,-2.9318,0.693,0.000),
c("GO:0009506","plasmodesma", 0.049, 2.711, 4.927, 3.682,-1.6123,0.980,0.000),
c("GO:0009535","chloroplast thylakoid membrane", 0.078,-0.190,-7.964, 3.883,-13.0269,0.425,0.000),
c("GO:0019013","viral nucleocapsid", 0.115,-4.196, 1.854, 4.052,-0.5008,0.980,0.000),
c("GO:0048046","apoplast", 0.073,-3.130, 3.276, 3.856,-7.6383,0.957,0.000),
c("GO:0019898","extrinsic component of membrane", 0.249, 1.328, 4.349, 4.389,-2.1537,0.959,0.028),
c("GO:0070469","respiratory chain", 0.296,-5.508, 1.327, 4.465,-0.4839,0.959,0.040),
c("GO:0005618","cell wall", 0.294, 5.580, 3.554, 4.462,-4.7959,0.876,0.047),
c("GO:0031224","intrinsic component of membrane",55.975,-0.445, 4.612, 6.741,-0.4138,0.956,0.074),
c("GO:0005622","intracellular",41.175,-5.520,-0.778, 6.608,-2.3904,0.857,0.092),
c("GO:0009579","thylakoid", 0.257,-6.358,-3.060, 4.403,-1.1457,0.820,0.101),
c("GO:0017071","intracellular cyclic nucleotide activated cation channel complex", 0.000, 7.227,-0.386, 1.114,-1.2159,0.814,0.159),
c("GO:0080085","signal recognition particle, chloroplast targeting", 0.001, 1.246,-3.303, 1.968,-1.3875,0.689,0.193),
c("GO:0043073","germ cell nucleus", 0.006,-4.017,-7.310, 2.797,-1.0030,0.738,0.203),
c("GO:0030076","light-harvesting complex", 0.035, 6.560,-4.989, 3.538,-2.8996,0.664,0.217),
c("GO:0017177","glucosidase II complex", 0.001, 2.834,-7.295, 2.167,-1.7637,0.609,0.269),
c("GO:0000795","synaptonemal complex", 0.013,-2.774,-8.342, 3.123,-2.5686,0.648,0.274),
c("GO:0010598","NAD(P)H dehydrogenase complex (plastoquinone)", 0.002, 7.226,-3.676, 2.342,-0.8122,0.675,0.275),
c("GO:0005737","cytoplasm",26.017,-3.157,-3.259, 6.408,-1.4377,0.742,0.276),
c("GO:0031410","cytoplasmic vesicle", 0.729,-1.107,-5.863, 4.856,-1.7841,0.626,0.299),
c("GO:0016282","eukaryotic 43S preinitiation complex", 0.087, 2.586,-6.148, 3.931,-1.5426,0.600,0.302),
c("GO:0005764","lysosome", 0.149,-1.488,-6.730, 4.165,-1.3246,0.652,0.316),
c("GO:0005945","6-phosphofructokinase complex", 0.001, 3.131,-2.754, 2.076,-1.7637,0.618,0.334),
c("GO:0009536","plastid", 0.370,-0.695,-7.256, 4.561,-0.4276,0.641,0.343),
c("GO:0005852","eukaryotic translation initiation factor 3 complex", 0.117, 3.747,-5.324, 4.060,-1.4815,0.581,0.349),
c("GO:0005773","vacuole", 0.455,-0.968,-6.557, 4.651,-0.7570,0.636,0.350),
c("GO:0016272","prefoldin complex", 0.056, 6.824,-4.440, 3.741,-0.7240,0.709,0.361),
c("GO:0031519","PcG protein complex", 0.017, 3.734,-6.682, 3.224,-1.2159,0.577,0.382),
c("GO:0005948","acetolactate synthase complex", 0.002, 3.253,-3.235, 2.365,-1.0030,0.624,0.396),
c("GO:0070545","PeBoW complex", 0.007, 3.272,-6.434, 2.823,-1.2159,0.551,0.399),
c("GO:0045281","succinate dehydrogenase complex", 0.031, 5.872,-3.604, 3.488,-1.2169,0.565,0.403),
c("GO:0005667","transcription factor complex", 0.288, 5.601,-4.604, 4.452,-0.4457,0.622,0.408),
c("GO:0005763","mitochondrial small ribosomal subunit", 0.040, 1.397,-5.868, 3.597,-1.8545,0.521,0.418),
c("GO:0005829","cytosol", 2.553,-1.087,-4.735, 5.400,-0.9071,0.626,0.420),
c("GO:0005794","Golgi apparatus", 0.969,-0.339,-6.464, 4.979,-1.7020,0.589,0.441),
c("GO:0009332","glutamate-tRNA ligase complex", 0.133, 2.893,-4.220, 4.115,-1.3875,0.560,0.444),
c("GO:0031201","SNARE complex", 0.038, 4.344,-5.445, 3.574,-0.9444,0.572,0.453),
c("GO:0005834","heterotrimeric G-protein complex", 0.046, 5.359,-2.310, 3.655,-0.6231,0.564,0.464),
c("GO:0005886","plasma membrane",10.510, 4.312, 3.454, 6.015,-0.6796,0.847,0.472),
c("GO:0017059","serine C-palmitoyltransferase complex", 0.005, 2.075,-5.425, 2.715,-1.2159,0.556,0.479));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$plot_size <- as.numeric( as.character(one.data$plot_size) );
one.data$log10_p_value <- as.numeric( as.character(one.data$log10_p_value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);


# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below

p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = log10_p_value, size = plot_size), alpha = I(0.6) ) + scale_size_area();
p1 <- p1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$log10_p_value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = plot_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
p1 <- p1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ]; 
p1 <- p1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 3 );
p1 <- p1 + labs (y = "semantic space x", x = "semantic space y");
p1 <- p1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);



# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("C:/Users/path_to_your_file/revigo-plot.pdf");
