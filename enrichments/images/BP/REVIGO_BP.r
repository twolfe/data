

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
revigo.data <- rbind(c("GO:0009269","response to desiccation", 0.007, 4.457,-5.688, 2.923,-3.3872,0.872,0.000),
c("GO:0019344","cysteine biosynthetic process", 0.131,-5.995,-0.537, 4.225,-9.8239,0.732,0.000),
c("GO:0070838","divalent metal ion transport", 0.358, 6.730,-1.493, 4.662,-5.2518,0.923,0.000),
c("GO:0006457","protein folding", 0.903, 2.165, 3.114, 5.064,-4.0177,0.944,0.029),
c("GO:0009768","photosynthesis, light harvesting in photosystem I", 0.003,-1.971, 7.247, 2.559,-6.9208,0.831,0.035),
c("GO:0018298","protein-chromophore linkage", 0.095, 3.396,-1.820, 4.084,-5.7959,0.885,0.044),
c("GO:0015979","photosynthesis", 0.183,-1.795, 5.719, 4.370,-7.2518,0.929,0.046),
c("GO:0048481","plant ovule development", 0.003,-1.473, 1.381, 2.519,-2.9586,0.871,0.047),
c("GO:0010027","thylakoid membrane organization", 0.004, 1.308, 5.625, 2.713,-7.9208,0.788,0.112),
c("GO:0006273","lagging strand elongation", 0.024, 4.305, 0.833, 3.495,-1.7498,0.867,0.112),
c("GO:0042793","transcription from plastid promoter", 0.001, 2.028, 0.463, 2.225,-1.5107,0.880,0.158),
c("GO:0045454","cell redox homeostasis", 0.861,-3.314,-4.854, 5.043,-5.0088,0.783,0.164),
c("GO:0007263","nitric oxide mediated signal transduction", 0.003, 1.086,-7.166, 2.589,-1.7592,0.845,0.184),
c("GO:0006081","cellular aldehyde metabolic process", 0.753,-5.730, 1.774, 4.985,-1.8505,0.835,0.194),
c("GO:0006833","water transport", 0.014, 6.821, 0.508, 3.256,-3.1367,0.899,0.197),
c("GO:0090143","nucleoid organization", 0.000, 3.350, 5.676, 0.903,-1.7592,0.849,0.198),
c("GO:0006857","oligopeptide transport", 0.057, 6.832,-0.685, 3.864,-2.7595,0.943,0.218),
c("GO:0055114","oxidation-reduction process",15.060,-7.038, 1.446, 6.286,-1.9355,0.860,0.232),
c("GO:0006012","galactose metabolic process", 0.109,-5.895, 3.731, 4.145,-4.5376,0.801,0.238),
c("GO:0006662","glycerol ether metabolic process", 0.122,-7.400, 2.311, 4.193,-2.6038,0.863,0.240),
c("GO:0032880","regulation of protein localization", 0.219,-0.317,-6.679, 4.449,-3.6383,0.883,0.243),
c("GO:0015995","chlorophyll biosynthetic process", 0.039,-4.528,-1.772, 3.699,-4.4089,0.735,0.273),
c("GO:0010363","regulation of plant-type hypersensitive response", 0.001, 2.339,-6.298, 1.968,-2.7399,0.803,0.274),
c("GO:0006364","rRNA processing", 0.952, 3.258, 3.204, 5.087,-4.4089,0.732,0.304),
c("GO:0035304","regulation of protein dephosphorylation", 0.027,-1.454,-5.639, 3.537,-4.0362,0.825,0.311),
c("GO:0045893","positive regulation of transcription, DNA-templated", 0.519,-0.592,-4.071, 4.823,-2.5867,0.770,0.311),
c("GO:0016925","protein sumoylation", 0.045, 2.646,-2.072, 3.763,-1.8242,0.889,0.322),
c("GO:0019288","isopentenyl diphosphate biosynthetic process, methylerythritol 4-phosphate pathway", 0.148,-5.869,-2.031, 4.279,-4.7959,0.715,0.336),
c("GO:2000037","regulation of stomatal complex patterning", 0.000,-3.073,-7.025, 1.176,-1.7592,0.872,0.337),
c("GO:0006412","translation", 5.686,-0.879,-1.870, 5.863,-1.8529,0.759,0.355),
c("GO:0007030","Golgi organization", 0.039, 2.438, 5.788, 3.701,-3.1192,0.851,0.359),
c("GO:0006002","fructose 6-phosphate metabolic process", 0.060,-6.557,-5.474, 3.885,-1.5632,0.883,0.376),
c("GO:0034214","protein hexamerization", 0.002, 3.855, 5.045, 2.387,-1.7592,0.860,0.386),
c("GO:0045490","pectin catabolic process", 0.058,-4.496, 5.881, 3.875,-3.4815,0.840,0.391),
c("GO:0009657","plastid organization", 0.024, 2.100, 6.017, 3.492,-2.4498,0.855,0.396),
c("GO:0034599","cellular response to oxidative stress", 0.224, 3.943,-6.042, 4.458,-2.5751,0.840,0.429),
c("GO:0016132","brassinosteroid biosynthetic process", 0.004,-4.840,-3.949, 2.703,-2.3778,0.765,0.453),
c("GO:0006687","glycosphingolipid metabolic process", 0.018,-6.493,-3.162, 3.375,-2.4101,0.792,0.465),
c("GO:0005985","sucrose metabolic process", 0.017,-5.024, 4.689, 3.327,-2.7520,0.800,0.466),
c("GO:0030154","cell differentiation", 1.133,-3.681, 0.329, 5.162,-2.2269,0.801,0.467),
c("GO:0019761","glucosinolate biosynthetic process", 0.001,-7.153,-1.945, 2.093,-2.6478,0.783,0.477),
c("GO:0051245","negative regulation of cellular defense response", 0.000, 3.069,-6.489, 0.477,-1.7592,0.883,0.481),
c("GO:0051103","DNA ligation involved in DNA repair", 0.039, 3.822,-4.700, 3.703,-1.6203,0.810,0.490),
c("GO:0006636","unsaturated fatty acid biosynthetic process", 0.018,-6.550,-1.208, 3.373,-2.0155,0.775,0.499));

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
