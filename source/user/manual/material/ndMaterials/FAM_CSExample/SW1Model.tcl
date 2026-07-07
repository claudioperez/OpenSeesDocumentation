#define node
node    1    0.0    0.0
node    2    1500.0    0.0
node    101    150.0    0.0
node    102    300.0    0.0
node    103    450.0    0.0
node    104    600.0    0.0
node    105    750.0    0.0
node    106    900.0    0.0
node    107    1050.0    0.0
node    108    1200.0    0.0
node    109    1350.0    0.0
node    3    0.0    200.0
node    4    1500.0    200.0
node    201    150.0    200.0
node    202    300.0    200.0
node    203    450.0    200.0
node    204    600.0    200.0
node    205    750.0    200.0
node    206    900.0    200.0
node    207    1050.0    200.0
node    208    1200.0    200.0
node    209    1350.0    200.0
node    5    0.0    450.0
node    6    1500.0    450.0
node    301    150.0    450.0
node    302    300.0    450.0
node    303    450.0    450.0
node    304    600.0    450.0
node    305    750.0    450.0
node    306    900.0    450.0
node    307    1050.0    450.0
node    308    1200.0    450.0
node    309    1350.0    450.0
node    7    0.0    750.0
node    8    1500.0    750.0
node    401    150.0    750.0
node    402    300.0    750.0
node    403    450.0    750.0
node    404    600.0    750.0
node    405    750.0    750.0
node    406    900.0    750.0
node    407    1050.0    750.0
node    408    1200.0    750.0
node    409    1350.0    750.0
node    9    0.0    1050.0
node    10    1500.0    1050.0
node    501    150.0    1050.0
node    502    300.0    1050.0
node    503    450.0    1050.0
node    504    600.0    1050.0
node    505    750.0    1050.0
node    506    900.0    1050.0
node    507    1050.0    1050.0
node    508    1200.0    1050.0
node    509    1350.0    1050.0
node    11    0.0    1350.0
node    12    1500.0    1350.0
node    601    150.0    1350.0
node    602    300.0    1350.0
node    603    450.0    1350.0
node    604    600.0    1350.0
node    605    750.0    1350.0
node    606    900.0    1350.0
node    607    1050.0    1350.0
node    608    1200.0    1350.0
node    609    1350.0    1350.0
node    13    0.0    1650.0
node    14    1500.0    1650.0
node    701    150.0    1650.0
node    702    300.0    1650.0
node    703    450.0    1650.0
node    704    600.0    1650.0
node    705    750.0    1650.0
node    706    900.0    1650.0
node    707    1050.0    1650.0
node    708    1200.0    1650.0
node    709    1350.0    1650.0
#fix base node
fix 1 1 1
fix 2 1 1
fix 101 1 1
fix 102 1 1
fix 103 1 1
fix 104 1 1
fix 105 1 1
fix 106 1 1
fix 107 1 1
fix 108 1 1
fix 109 1 1
#define concrete
uniaxialMaterial ConcreteCM  1  -47.804  -0.0029421  32496.0053  15  1.054  2.1434  8e-05  1.2  10000
uniaxialMaterial ConcreteCM  2  -54.579  -0.005027  21714.2439  12  1.0134  2.1434  8e-05  1.2  10000
#define steel
uniaxialMaterial SteelMPF  101  349  349  206000  0.005  0.005  20  0.925  0.15
uniaxialMaterial SteelMPF  102  396  396   206000  0.01  0.01  20  0.925  0.15
uniaxialMaterial SteelMPF  103  397  397  206000  0.01  0.01  20  0.925  0.15
#define FAM_CS
nDMaterial FAM_CS  201  0  103  101  2  0.0093084  0.056316  22  16  74.0814  100
nDMaterial FAM_CS  202  0  103  101  2  0.0093084  0.056316  22  16  74.0814  100
nDMaterial FAM_CS  203  0  103  102  1  0.0037234  0.0014544  10  16  172.8515  150
nDMaterial FAM_CS  204  0  103  102  1  0.0037234  0.0072722  10  16  172.8515  150
nDMaterial FAM_CS  205  0  103  102  1  0.0037234  0.0058178  10  16  172.8515  150
nDMaterial FAM_CS  206  0  103  102  1  0.0037234  0.0058178  10  16  172.8515  150
nDMaterial FAM_CS  207  0  103  102  1  0.0037234  0.0072722  10  16  172.8515  150
nDMaterial FAM_CS  208  0  103  102  1  0.0037234  0.0014544  10  16  172.8515  150
nDMaterial FAM_CS  209  0  103  101  2  0.0093084  0.056316  22  16  74.0814  100
nDMaterial FAM_CS  210  0  103  101  2  0.0093084  0.056316  22  16  74.0814  100
nDMaterial ElasticIsotropic  211  32496.0053  0.2  
#define quad element
element quad  101  1  101  201  3  180  PlaneStress  201
element quad  102  101  102  202  201  180  PlaneStress  202
element quad  103  102  103  203  202  180  PlaneStress  203
element quad  104  103  104  204  203  180  PlaneStress  204
element quad  105  104  105  205  204  180  PlaneStress  205
element quad  106  105  106  206  205  180  PlaneStress  206
element quad  107  106  107  207  206  180  PlaneStress  207
element quad  108  107  108  208  207  180  PlaneStress  208
element quad  109  108  109  209  208  180  PlaneStress  209
element quad  110  109  2  4  209  180  PlaneStress  210
element quad  201  3  201  301  5  180  PlaneStress  201
element quad  202  201  202  302  301  180  PlaneStress  202
element quad  203  202  203  303  302  180  PlaneStress  203
element quad  204  203  204  304  303  180  PlaneStress  204
element quad  205  204  205  305  304  180  PlaneStress  205
element quad  206  205  206  306  305  180  PlaneStress  206
element quad  207  206  207  307  306  180  PlaneStress  207
element quad  208  207  208  308  307  180  PlaneStress  208
element quad  209  208  209  309  308  180  PlaneStress  209
element quad  210  209  4  6  309  180  PlaneStress  210
element quad  301  5  301  401  7  180  PlaneStress  201
element quad  302  301  302  402  401  180  PlaneStress  202
element quad  303  302  303  403  402  180  PlaneStress  203
element quad  304  303  304  404  403  180  PlaneStress  204
element quad  305  304  305  405  404  180  PlaneStress  205
element quad  306  305  306  406  405  180  PlaneStress  206
element quad  307  306  307  407  406  180  PlaneStress  207
element quad  308  307  308  408  407  180  PlaneStress  208
element quad  309  308  309  409  408  180  PlaneStress  209
element quad  310  309  6  8  409  180  PlaneStress  210
element quad  401  7  401  501  9  180  PlaneStress  201
element quad  402  401  402  502  501  180  PlaneStress  202
element quad  403  402  403  503  502  180  PlaneStress  203
element quad  404  403  404  504  503  180  PlaneStress  204
element quad  405  404  405  505  504  180  PlaneStress  205
element quad  406  405  406  506  505  180  PlaneStress  206
element quad  407  406  407  507  506  180  PlaneStress  207
element quad  408  407  408  508  507  180  PlaneStress  208
element quad  409  408  409  509  508  180  PlaneStress  209
element quad  410  409  8  10  509  180  PlaneStress  210
element quad  501  9  501  601  11  180  PlaneStress  201
element quad  502  501  502  602  601  180  PlaneStress  202
element quad  503  502  503  603  602  180  PlaneStress  203
element quad  504  503  504  604  603  180  PlaneStress  204
element quad  505  504  505  605  604  180  PlaneStress  205
element quad  506  505  506  606  605  180  PlaneStress  206
element quad  507  506  507  607  606  180  PlaneStress  207
element quad  508  507  508  608  607  180  PlaneStress  208
element quad  509  508  509  609  608  180  PlaneStress  209
element quad  510  509  10  12  609  180  PlaneStress  210
element quad  601  11  601  701  13  600  PlaneStress  211
element quad  602  601  602  702  701  600  PlaneStress  211
element quad  603  602  603  703  702  600  PlaneStress  211
element quad  604  603  604  704  703  600  PlaneStress  211
element quad  605  604  605  705  704  600  PlaneStress  211
element quad  606  605  606  706  705  600  PlaneStress  211
element quad  607  606  607  707  706  600  PlaneStress  211
element quad  608  607  608  708  707  600  PlaneStress  211
element quad  609  608  609  709  708  600  PlaneStress  211
element quad  610  609  12  14  709  600  PlaneStress  211
