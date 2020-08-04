def codificacionXOR(a_string):

    ASCII_values = []
    for character in a_string:
        ASCII_values.append(ord(character))

    HEX_values = []
    for i in ASCII_values:
        HEX_values.append(hex(i))

    llave = 0xf3

    codificado = ['0x00', hex(llave)]
    for x in HEX_values:
        codificado.append(hex(int(x,16) ^ llave))

    codificado.append('0xFF')

    return codificado

def decodificacionXOR(codificado):

    llave = int(codificado[1],16)

    descodificado = []

    for y in codificado[2:len(descodificado)-1]:
        descodificado.append(hex(int(y,16) ^ llave))

    ASCII_descodificado = ''

    for z in descodificado:
        bytes_object = bytes.fromhex(z[2:])
        ascii_string = bytes_object.decode("ASCII")
        ASCII_descodificado += ascii_string

    return ASCII_descodificado

def codificacionNOT(a_string):

    ASCII_values = []
    for character in a_string:
        ASCII_values.append(ord(character))

    HEX_values = []
    for i in ASCII_values:
        HEX_values.append(hex(i))
        
    codificado = ['0x01']
    for x in HEX_values:
        codificado.append(hex(~int(x,16)))

    codificado.append('0xFF')

    return codificado

def decodificacionNOT(codificado):

    descodificado = []

    for y in codificado[1:len(descodificado)-1]:
        descodificado.append(hex(~int(y,16)))

    ASCII_descodificado = ''

    for z in descodificado:
        bytes_object = bytes.fromhex(z[2:])
        ascii_string = bytes_object.decode("ASCII")
        ASCII_descodificado += ascii_string

    return ASCII_descodificado

def codificacionROR(a_string):

    ASCII_values = []
    for character in a_string:
        ASCII_values.append(ord(character))

    HEX_values = []
    for i in ASCII_values:
        HEX_values.append(hex(i))

    corrimientos = 0x07

    codificado = ['0x03', hex(corrimientos)]
    
    for x in HEX_values:
        byte = bin(int(x, 16))[2:]
        
        while len(byte) < 8:
            byte = '0' + byte
        
        Lfirst = byte[0:corrimientos] 
        Lsecond = byte[corrimientos:] 
        
        byte = '0b' + Lsecond + Lfirst
        
        codificado.append(hex(int(byte,2)))

    codificado.append('0xFF')

    return codificado

def decodificacionROR(codificado):

    corrimientos = int(codificado[1],16)

    descodificado = []

    for y in codificado[2:len(descodificado)-1]:
        byte = bin(int(y, 16))[2:]
        
        while len(byte) < 8:
            byte = '0' + byte
            
        Rfirst = byte[0:len(byte) - corrimientos] 
        Rsecond = byte[len(byte) - corrimientos:]
        
        byte = '0b' + Rsecond + Rfirst
        
        descodificado.append(hex(int(byte,2)))

    ASCII_descodificado = ''
    for z in descodificado:
        bytes_object = bytes.fromhex(z[2:])
        ascii_string = bytes_object.decode("ASCII")
        ASCII_descodificado += ascii_string

    return ASCII_descodificado

def decodificador(codificado):
    
    tipoDeCodificacion = int(codificado[0],16)
    
    if (tipoDeCodificacion == 0):
        return decodificacionXOR(codificado)
    elif (tipoDeCodificacion == 1):
        return decodificacionNOT(codificado)
    else:
        return decodificacionROR(codificado)
    
    
print(codificacionROR("Hola me llamo Racso"))    

#print(decodificador(codificacionXOR("Hola me llamo Racso")))
#print(decodificador(codificacionNOT("Hola me llamo Racso")))
print(decodificador(codificacionROR("Hola me llamo Racso")))