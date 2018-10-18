

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
revigo.data <- rbind(c("GO:0001053","plastid sigma factor activity", 0.001,-1.077,-4.682, 2.283,-1.3106,0.970,0.000),
c("GO:0003735","structural constituent of ribosome", 2.679,-2.566,-4.398, 5.577,-2.5986,0.980,0.000),
c("GO:0016168","chlorophyll binding", 0.030,-1.043,-3.842, 3.632,-9.1135,0.951,0.000),
c("GO:0030570","pectate lyase activity", 0.017, 2.686, 1.364, 3.391,-5.0555,0.928,0.000),
c("GO:0031386","protein tag", 0.010,-0.301,-2.035, 3.129,-1.0959,0.980,0.000),
c("GO:0038199","ethylene receptor activity", 0.001, 1.121,-0.977, 2.272,-1.7804,0.967,0.000),
c("GO:0050178","phenylpyruvate tautomerase activity", 0.000, 2.350,-0.079, 1.708,-1.7804,0.942,0.013),
c("GO:0016762","xyloglucan:xyloglucosyl transferase activity", 0.015, 4.727,-6.525, 3.320,-3.9208,0.890,0.016),
c("GO:0015035","protein disulfide oxidoreductase activity", 0.305,-7.510,-4.371, 4.634,-3.5376,0.838,0.020),
c("GO:0008987","quinolinate synthetase A activity", 0.023,-0.933,-8.251, 3.510,-1.1892,0.957,0.020),
c("GO:0004565","beta-galactosidase activity", 0.057,-2.391, 6.020, 3.904,-3.2147,0.901,0.022),
c("GO:0004066","asparagine synthase (glutamine-hydrolyzing) activity", 0.059, 1.447, 6.374, 3.920,-2.9431,0.918,0.022),
c("GO:0051740","ethylene binding", 0.001,-3.160,-6.129, 2.288,-3.0915,0.969,0.027),
c("GO:0031409","pigment binding", 0.004,-0.646,-0.690, 2.736,-5.6576,0.968,0.028),
c("GO:0016874","ligase activity", 3.540,-0.903,-6.163, 5.698,-2.8697,0.949,0.031),
c("GO:0005515","protein binding", 4.410,-1.332,-1.009, 5.793,-4.6383,0.959,0.046),
c("GO:0051538","3 iron, 4 sulfur cluster binding", 0.050,-0.275,-6.104, 3.851,-1.3106,0.955,0.049),
c("GO:0042803","protein homodimerization activity", 0.221, 0.119,-2.984, 4.493,-3.2518,0.954,0.056),
c("GO:0048027","mRNA 5'-UTR binding", 0.008,-2.515,-7.046, 3.070,-1.3106,0.964,0.060),
c("GO:0008289","lipid binding", 0.519,-1.150,-7.429, 4.864,-1.0397,0.963,0.062),
c("GO:0030246","carbohydrate binding", 0.723,-0.403,-4.820, 5.007,-1.8199,0.962,0.065),
c("GO:0005509","calcium ion binding", 0.967, 1.447, 2.818, 5.134,-2.5452,0.939,0.067),
c("GO:0046906","tetrapyrrole binding", 1.530,-1.584,-2.373, 5.333,-1.1092,0.956,0.085),
c("GO:0043864","indoleacetamide hydrolase activity", 0.000,-1.470, 3.000, 0.954,-1.7804,0.933,0.107),
c("GO:0005544","calcium-dependent phospholipid binding", 0.038,-2.532, 1.870, 3.724,-1.1348,0.956,0.116),
c("GO:0052624","2-phytyl-1,4-naphthoquinone methyltransferase activity", 0.001, 5.335,-3.422, 2.241,-1.7804,0.919,0.122),
c("GO:0004758","serine C-palmitoyltransferase activity", 0.003, 6.050,-4.163, 2.661,-1.3106,0.911,0.129),
c("GO:0004805","trehalose-phosphatase activity", 0.015,-1.510, 5.492, 3.322,-2.3170,0.922,0.143),
c("GO:0004364","glutathione transferase activity", 0.033, 3.859,-7.461, 3.671,-2.3716,0.904,0.146),
c("GO:0019789","SUMO transferase activity", 0.023, 3.890,-6.668, 3.504,-1.0959,0.914,0.150),
c("GO:0003872","6-phosphofructokinase activity", 0.054, 4.840,-7.423, 3.883,-1.9469,0.889,0.159),
c("GO:0004197","cysteine-type endopeptidase activity", 0.093, 0.288, 7.656, 4.117,-1.1651,0.920,0.161),
c("GO:0047995","hydroxyphenylpyruvate reductase activity", 0.000,-6.998,-3.106, 0.477,-1.4831,0.901,0.166),
c("GO:0052893","N1-acetylspermine:oxygen oxidoreductase (propane-1,3-diamine-forming) activity", 0.000,-6.537,-1.687, 1.000,-1.7804,0.870,0.179),
c("GO:0032441","pheophorbide a oxygenase activity", 0.000,-7.139,-1.507, 1.322,-1.7804,0.901,0.186),
c("GO:0016630","protochlorophyllide reductase activity", 0.002,-7.240,-3.209, 2.537,-3.0915,0.877,0.219),
c("GO:0010277","chlorophyllide a oxygenase [overall] activity", 0.004,-6.554,-3.375, 2.764,-2.1433,0.883,0.226),
c("GO:0080124","pheophytinase activity", 0.000,-3.748, 0.439, 0.301,-1.7804,0.940,0.232),
c("GO:0009916","alternative oxidase activity", 0.008,-6.353,-2.978, 3.033,-1.4831,0.885,0.235),
c("GO:0005524","ATP binding",14.125, 1.512, 2.162, 6.299,-1.7387,0.936,0.251),
c("GO:0050897","cobalt ion binding", 0.042, 1.227, 4.050, 3.775,-1.3676,0.946,0.255),
c("GO:0001055","RNA polymerase II activity", 0.014, 5.210,-6.263, 3.291,-1.7902,0.902,0.275),
c("GO:0005222","intracellular cAMP activated cation channel activity", 0.001, 4.393, 3.912, 2.033,-1.7804,0.932,0.306),
c("GO:0050236","pyridoxine:NADP 4-dehydrogenase activity", 0.001,-7.822,-3.113, 2.190,-1.0959,0.886,0.307),
c("GO:0019148","D-cysteine desulfhydrase activity", 0.001,-0.598, 0.959, 2.303,-1.4831,0.936,0.324),
c("GO:0050203","oxalate-CoA ligase activity", 0.001, 0.014, 5.381, 1.857,-1.4831,0.932,0.328),
c("GO:0004038","allantoinase activity", 0.008,-2.518, 4.544, 3.038,-1.7804,0.923,0.332),
c("GO:0042286","glutamate-1-semialdehyde 2,1-aminomutase activity", 0.024, 2.702, 0.113, 3.534,-1.3106,0.934,0.337),
c("GO:0004497","monooxygenase activity", 0.947,-7.454,-3.880, 5.125,-2.1993,0.855,0.343),
c("GO:0003954","NADH dehydrogenase activity", 0.368,-7.708,-3.762, 4.715,-1.4527,0.856,0.350),
c("GO:0004047","aminomethyltransferase activity", 0.030, 4.875,-4.281, 3.632,-1.1892,0.908,0.359),
c("GO:0016984","ribulose-bisphosphate carboxylase activity", 0.012,-0.109, 0.960, 3.244,-1.6602,0.927,0.363),
c("GO:0045435","lycopene epsilon cyclase activity", 0.000, 2.269,-0.547, 0.301,-1.7804,0.947,0.372),
c("GO:0003852","2-isopropylmalate synthase activity", 0.046, 5.793,-6.604, 3.813,-1.1892,0.901,0.382),
c("GO:0016705","oxidoreductase activity, acting on paired donors, with incorporation or reduction of molecular oxygen", 1.177,-6.845,-3.936, 5.219,-1.8972,0.854,0.394),
c("GO:0032442","phenylcoumaran benzylic ether reductase activity", 0.007,-7.153,-3.663, 3.012,-1.0959,0.878,0.398),
c("GO:0008660","1-aminocyclopropane-1-carboxylate deaminase activity", 0.004, 0.067, 7.042, 2.779,-1.4831,0.924,0.405),
c("GO:0015254","glycerol channel activity", 0.000, 3.617, 4.184, 1.771,-1.5494,0.944,0.408),
c("GO:0005506","iron ion binding", 1.548, 1.574, 2.923, 5.338,-1.1267,0.934,0.416),
c("GO:0004742","dihydrolipoyllysine-residue acetyltransferase activity", 0.020, 5.909,-5.098, 3.443,-1.1892,0.904,0.424),
c("GO:0004818","glutamate-tRNA ligase activity", 0.051, 1.136, 6.331, 3.852,-1.4831,0.917,0.429),
c("GO:0033947","mannosylglycoprotein endo-beta-mannosidase activity", 0.001,-1.353, 3.938, 2.025,-1.7804,0.915,0.430),
c("GO:0003910","DNA ligase (ATP) activity", 0.055, 1.802, 6.475, 3.890,-1.3687,0.920,0.431),
c("GO:0080123","jasmonate-amino synthetase activity", 0.001, 1.299, 6.264, 2.072,-1.4831,0.929,0.440),
c("GO:0008878","glucose-1-phosphate adenylyltransferase activity", 0.024, 4.703,-5.652, 3.533,-1.3106,0.900,0.448),
c("GO:0048529","magnesium-protoporphyrin IX monomethyl ester (oxidative) cyclase activity", 0.003,-7.227,-4.918, 2.661,-1.7804,0.884,0.452),
c("GO:0003950","NAD+ ADP-ribosyltransferase activity", 0.033, 6.055,-5.828, 3.663,-2.7305,0.886,0.456),
c("GO:0004185","serine-type carboxypeptidase activity", 0.143, 0.209, 7.603, 4.303,-1.1104,0.919,0.474),
c("GO:0015250","water channel activity", 0.010, 1.797, 4.051, 3.136,-1.4998,0.938,0.478),
c("GO:0004558","alpha-1,4-glucosidase activity", 0.005,-1.603, 5.757, 2.889,-1.7804,0.902,0.480),
c("GO:0004674","protein serine/threonine kinase activity", 0.996, 5.186,-6.623, 5.147,-1.2670,0.881,0.480),
c("GO:0080048","GDP-D-glucose phosphorylase activity", 0.003, 5.172,-5.506, 2.642,-1.4831,0.896,0.487));

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
