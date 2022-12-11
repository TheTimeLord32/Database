file = open('MongoDB/File SQL 200k/Mandija_Radio_Intervento_200k.sql', 'w')     # crea un file TXT in scrittura
file.write('insert into interventoMongoDB values \n')                           # scrivo nel file TXT la stringa

for x in range (1, 10):                                                         # genera i valori che vanno da 1 a 9
    file.write("('Itv00000"+str(x)+"', 'Lav00000"+str(x)+"', 'Clt00000"+str(x)+"', 'Trp00000"+str(x)+"', 'Reg00000"+str(x)+"')," + "\n")

for x in range (10, 100):                                                       # genera i valori che vanno da 10 a 99
    file.write("('Itv0000"+str(x)+"', 'Lav0000"+str(x)+"', 'Clt0000"+str(x)+"', 'Trp0000"+str(x)+"', 'Reg0000"+str(x)+"')," + "\n")

for x in range (100, 1000):                                                     # genera i valori che vanno da 100 a 999
    file.write("('Itv000"+str(x)+"', 'Lav000"+str(x)+"', 'Clt000"+str(x)+"', 'Trp000"+str(x)+"', 'Reg000"+str(x)+"')," + "\n")

for x in range (1000, 10000):                                                   # genera i valori che vanno da 1000 a 9999
    file.write("('Itv00"+str(x)+"', 'Lav00"+str(x)+"', 'Clt00"+str(x)+"', 'Trp00"+str(x)+"', 'Reg00"+str(x)+"')," + "\n")

for x in range (10000, 100000):                                                 # genera i valori che vanno da 10000 a 99999
    file.write("('Itv0"+str(x)+"', 'Lav0"+str(x)+"', 'Clt0"+str(x)+"', 'Trp0"+str(x)+"', 'Reg0"+str(x)+"')," + "\n")

for x in range (100000, 200001):                                                # genera i valori che vanno da 100000 a 200000
    if x == 200000:
        file.write("('Itv"+str(x)+"', 'Lav"+str(x)+"', 'Clt"+str(x)+"', 'Trp"+str(x)+"', 'Reg"+str(x)+"');" + "\n")
    else:
        file.write("('Itv"+str(x)+"', 'Lav"+str(x)+"', 'Clt"+str(x)+"', 'Trp"+str(x)+"', 'Reg"+str(x)+"')," + "\n")

print("Scrittura Intervento terminata")                                         # messaggio a schermo
file.close()                                                                    # chiude il file

#-----------------------------------------------------------------------------------------------------------------------------------------------#

file = open('MongoDB/File SQL 200k/Mandija_Radio_Lavoratore_200k.sql', 'w')     # crea un file TXT in scrittura
file.write('insert into lavoratoreMongoDB values \n')                           # scrivo nel file TXT la stringa

for x in range (1, 10):                                                         # genera i valori che vanno da 1 a 9
    file.write("('Lav00000"+str(x)+"', 'Nome-Lavoratore00000"+str(x)+"', 'Cognome-Lavoratore00000"+str(x)+"'), \n")

for x in range (10, 100):                                                       # genera i valori che vanno da 10 a 99
    file.write("('Lav0000"+str(x)+"', 'Nome-Lavoratore0000"+str(x)+"', 'Cognome-Lavoratore0000"+str(x)+"'), \n")

for x in range (100, 1000):                                                     # genera i valori che vanno da 100 a 999
    file.write("('Lav000"+str(x)+"', 'Nome-Lavoratore000"+str(x)+"', 'Cognome-Lavoratore000"+str(x)+"'), \n")

for x in range (1000, 10000):                                                   # genera i valori che vanno da 1000 a 9999
    file.write("('Lav00"+str(x)+"', 'Nome-Lavoratore00"+str(x)+"', 'Cognome-Lavoratore00"+str(x)+"'), \n")

for x in range (10000, 100000):                                                 # genera i valori che vanno da 10000 a 99999
    file.write("('Lav0"+str(x)+"', 'Nome-Lavoratore0"+str(x)+"', 'Cognome-Lavoratore0"+str(x)+"'), \n")

for x in range (100000, 200001):                                                # genera i valori che vanno da 100000 a 200000
    if x == 200000:
        file.write("('Lav"+str(x)+"', 'Nome-Lavoratore"+str(x)+"', 'Cognome-Lavoratore"+str(x)+"'); \n")
    else:
        file.write("('Lav"+str(x)+"', 'Nome-Lavoratore"+str(x)+"', 'Cognome-Lavoratore"+str(x)+"'), \n")

print("Scrittura Lavoratore terminata")                                         # messaggio a schermo
file.close()                                                                    # chiude il file

#-----------------------------------------------------------------------------------------------------------------------------------------------#

file = open('MongoDB/File SQL 200k/Mandija_Radio_Cliente_200k.sql', 'w')        # crea un file TXT in scrittura
file.write('insert into clienteMongoDB values \n')                              # scrivo nel file TXT la stringa

for x in range (1, 10):                                                         # genera i valori che vanno da 1 a 9
    file.write("('Clt00000"+str(x)+"', 'Nome-Cliente00000"+str(x)+"'), \n")

for x in range (10, 100):                                                       # genera i valori che vanno da 10 a 99
    file.write("('Clt0000"+str(x)+"', 'Nome-Cliente0000"+str(x)+"'), \n")

for x in range (100, 1000):                                                     # genera i valori che vanno da 100 a 999
    file.write("('Clt000"+str(x)+"', 'Nome-Cliente000"+str(x)+"'), \n")

for x in range (1000, 10000):                                                   # genera i valori che vanno da 1000 a 9999
    file.write("('Clt00"+str(x)+"', 'Nome-Cliente00"+str(x)+"'), \n")

for x in range (10000, 100000):                                                 # genera i valori che vanno da 10000 a 99999
    file.write("('Clt0"+str(x)+"', 'Nome-Cliente0"+str(x)+"'), \n")

for x in range (100000, 200001):                                                # genera i valori che vanno da 100000 a 200000
    if x == 200000:
        file.write("('Clt"+str(x)+"', 'Nome-Cliente"+str(x)+"'); \n")
    else:
        file.write("('Clt"+str(x)+"', 'Nome-Cliente"+str(x)+"'), \n")

print("Scrittura Cliente terminata")                                            # messaggio a schermo
file.close()                                                                    # chiude il file

#-----------------------------------------------------------------------------------------------------------------------------------------------#

file = open('MongoDB/File SQL 200k/Mandija_Radio_Trasporto_200k.sql', 'w')      # crea un file TXT in scrittura
file.write('insert into trasportoMongoDB values \n')                            # scrivo nel file TXT la stringa

for x in range (1, 10):                                                         # genera i valori che vanno da 1 a 9
    file.write("('Trp00000"+str(x)+"', 'Marca00000"+str(x)+"', 'Modello00000"+str(x)+"'), \n")

for x in range (10, 100):                                                       # genera i valori che vanno da 10 a 99
    file.write("('Trp0000"+str(x)+"', 'Marca0000"+str(x)+"', 'Modello0000"+str(x)+"'), \n")

for x in range (100, 1000):                                                     # genera i valori che vanno da 100 a 999
    file.write("('Trp000"+str(x)+"', 'Marca000"+str(x)+"', 'Modello000"+str(x)+"'), \n")

for x in range (1000, 10000):                                                   # genera i valori che vanno da 1000 a 9999
    file.write("('Trp00"+str(x)+"', 'Marca00"+str(x)+"', 'Modello00"+str(x)+"'), \n")

for x in range (10000, 100000):                                                 # genera i valori che vanno da 10000 a 99999
    file.write("('Trp0"+str(x)+"', 'Marca0"+str(x)+"', 'Modello0"+str(x)+"'), \n")

for x in range (100000, 200001):                                                # genera i valori che vanno da 100000 a 200000
    if x == 200000:
        file.write("('Trp"+str(x)+"', 'Marca"+str(x)+"', 'Modello"+str(x)+"'); \n")
    else:
        file.write("('Trp"+str(x)+"', 'Marca"+str(x)+"', 'Modello"+str(x)+"'), \n")

print("Scrittura Trasporto terminata")                                          # messaggio a schermo
file.close()                                                                    # chiude il file

#-----------------------------------------------------------------------------------------------------------------------------------------------#

file = open('MongoDB/File SQL 200k/Mandija_Radio_Regione_200k.sql', 'w')        # crea un file TXT in scrittura
file.write('insert into regioneMongoDB values \n')                              # scrivo nel file TXT la stringa

for x in range (1, 10):                                                         # genera i valori che vanno da 1 a 9
    file.write("('Reg00000"+str(x)+"', 'Nome-Regione00000"+str(x)+"'), \n")

for x in range (10, 100):                                                       # genera i valori che vanno da 10 a 99
    file.write("('Reg0000"+str(x)+"', 'Nome-Regione0000"+str(x)+"'), \n")

for x in range (100, 1000):                                                     # genera i valori che vanno da 100 a 999
    file.write("('Reg000"+str(x)+"', 'Nome-Regione000"+str(x)+"'), \n")

for x in range (1000, 10000):                                                   # genera i valori che vanno da 1000 a 9999
    file.write("('Reg00"+str(x)+"', 'Nome-Regione00"+str(x)+"'), \n")

for x in range (10000, 100000):                                                 # genera i valori che vanno da 10000 a 99999
    file.write("('Reg0"+str(x)+"', 'Nome-Regione0"+str(x)+"'), \n")

for x in range (100000, 200001):                                                # genera i valori che vanno da 100000 a 200000
    if x == 200000:
        file.write("('Reg"+str(x)+"', 'Nome-Regione"+str(x)+"'); \n")
    else:
        file.write("('Reg"+str(x)+"', 'Nome-Regione"+str(x)+"'), \n")

print("Scrittura Regione terminata")                                            # messaggio a schermo
file.close()                                                                    # chiude il file
